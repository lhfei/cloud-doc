To solve hard problems successfully, you usually have to be willing to solve them unsuccessfully in order to learn more about them. The process of learning *why* a given solution doesn’t work can allow you to learn more about what *would* work. Here’s a case study.



### Some background

This one is a bit complicated, so bear with me. There are two central requirements that turn out to be in tension here.

#### Memory-mapping and memory-remapping

Pilosa works with fairly large data sets, and reading data in can be slow, but memory-mapping files and reading them later can be fast. So we like to memory-map files. This offers a neat bonus feature: The kernel is able to drop pages of mapped data that are mapped to on-disk files, and recover them later by reading the disk, which means that we can have more “memory” available than there is physical memory in a machine. (That comes up more than you might expect.)

The unit by which these are done is called, internally, a “fragment”. A fragment represents one shard’s worth of data for a single view of a single field, but possibly many rows. Each fragment is about a million columns by default, and each fragment gets its own distinct data file. Each fragment (and bitmap) is logically divided into sections of 65,536 (1<<16) bits, called “containers”; the individual container data structures are what contain pointers to the mmapped data. So here’s how it looks right after you’ve just opened a fragment from the disk:

![Freshly-mapped fragment](https://www.pilosa.com/img/blog/mmap1.png)

Unfortunately, it only works for data that’s identical to the on-disk file. We don’t want to corrupt the data, so we don’t write back to the memory-mapped parts of the file; rather, when an object which was memory-mapped changes, we allocate new storage in memory and use that. So after a couple of changes, it looks like this:

![Partially-mapped fragment](https://www.pilosa.com/img/blog/mmap2.png)

Unlike the file-backed memory, this memory can’t just be discarded by the kernel whenever it wants more space. So, eventually, we want to update the on-disk representation to match the in-memory representation, and go back to using memory-mapped access. We call this operation a “snapshot”. After that, we would end up in the same state we were in before, with a freshly-mapped fragment.

So, that’s part one of the backstory: We have a lot of things which are memory-mapped, and occasionally we want to clear the old memory maps and make new ones.

#### Caching and copy-on-write semantics

Now let’s talk about mixed loads, where there’s both read and write operations happening. It’s undesireable to have bits mutating while you read them, and Go makes no guarantees about what happens if you try. So, when a read operation comes in, it temporarily locks the object it’s reading from, and extracts the bits it cares about. Then it *releases* that lock, and goes on to process the data it retrieved, without the lock held. So, we create a new in-memory structure, which refers to the same memory that the fragment is using for a single row’s data:

![A row, with containers pointing at both mapped and heap storage](https://www.pilosa.com/img/blog/mmap3.png)

But now that we’ve released the lock, other parts of the system can come along and modify the data in the fragment. You might ask why we don’t just keep the lock; the answer is that we have a lot of parallel processing going on, and furthermore, in some cases we might need several separate reads from the same data source, which will be used as inputs to computations which need to happen before we can be done using this data. For instance, consider a query like:

```
Intersect(Row(x=1),Row(x=2))
```

The `Intersect` query needs to operate on the contents of two separate rows from the same field, which means they’re using the same storage. We have to be able to retrieve both, and each of them wants to grab the lock, so they have to release the lock, too.

In the times of long-ago, we had a simple solution: Make a copy of the data, store that copy in a cache, and then use that to answer read requests. And that works, but it costs a *lot* of memory, and takes a significant amount of time.

To resolve this, we developed a software-emulated “copy on write” functionality; when a given piece of data gets read, we don’t copy it, but we mark it as “frozen”; this means that specific data is never allowed to be modified, and anything that wants to modify it needs to create a copy and start using that copy. So, when you read part of a bitmap, that part is frozen; when writes to that part of the bitmap happen, the bitmap allocates new copies that it can write to.

So, in this scheme, if additional writes come in, they may change what the fragment refers to, but they won’t change the contents of an existing row object. It looks a bit like this:

![Row with references to storage the fragment doesn't use](https://www.pilosa.com/img/blog/mmap4.png)

At this point, if a new write came in for Row 0, Container 1, we’d end up with a *new* container in memory; the row object would still point to the old one, but the fragment would get the new one. Then, when the row argument goes away, the in-memory object it was using gets garbage collected.

That’s part two of the backstory: We’re using copy-on-write semantics, and unmodifiable copies of chunks of data, to reduce copying and memory overhead.

#### Oops

And then I realized the problem, which didn’t show up in production often enough for us to catch it, but which I could reproduce with a custom test case: If you have stale containers using memory-mapped bits, and you unmap the addresses they were at, and then access those containers, you have a crash.

Have a look at the state immediately after a snapshot, when a row object exists:

![Row with references to an old mapping](https://www.pilosa.com/img/blog/mmap5.png)

As long as the objects the row has references to aren’t memory-mapped, we don’t have a problem. If they are, we have a problem – when can we unmap this memory?

This initially escaped my notice because I had evaluated everything in terms of changes to the actual representation of the container objects – every operation which could do that was being invoked on a specific container, and could check that the container wasn’t frozen, or create a new container to operate on. But unmapping memory *doesn’t* have to write to the in-memory data structure to be effectively a change to it, invalidating the address it stored for the data it wants to refer to.

The temporary solution for this is obvious: When marking a thing as frozen, we always first make that initial copy, making it be a memory object rather than a mapped object. Which is to say, revert a significant part of the copy-on-write semantics change, and lose a lot of its benefits. The nicer solution would be to make sure that we have a way to track whether anything’s still using a given mapping, so we can map a new file, then unmap the old one only after all of its users are gone. But that requires a way to *track* all those users. And we didn’t really have a good way to express that, and there’s a lot of code that might be referencing these hunks of bitmaps, and all of it would need to be changed. So this got shelved for a while; we took the performance hit but kept things safe and stable.

### Round Two: I have this great idea…

I wanted to work on some code to improve reliability during opens with possibly-corrupt files, and in the process of this, I ran into the problem that the file open/close logic, which also handles memory mapping, was really a bit more complicated than I wanted it to be. It wasn’t wrong, just hard to follow or modify cleanly, and I wanted to fix this up. So I started working on cleaning it up, and dividing it up into logical components that are easier to reason about.

For instance, when we memory-map a new file, we need to point all the fragment’s storage to that file’s mapping, so we can unmap the old file. This logic is tied in closely with the logic for reading and validating the file and ensuring that it’s not corrupt, and the logic for handling missing files, and it just ends up being a lot. A good starting point would be to separate this logic out, and handle the memory-mapping logic separately from the rest of the open/close logic. Some of the complexity comes from the fragment needing to know what its current memory-map is. So I wanted to make a separate object that represents the memory-mapping and handles that bookkeeping.

And that gave me an idea: Part of the problem is that we need to know the address to unmap it, so if we overwrite the fragment’s memory-map attribute, we’ve got to have unmapped the old one before that. But this separate object could track the old mapping separately, and unmap it at some other time.

I named the new data structure a “generation”; each fragment would have sequentially-numbered generations representing times we’ve opened a copy of that fragment and mapped it in. The periodic “snapshot” tasks would then create a new generation for that fragment. Then these generations could be assigned to bitmaps as “sources”, which the bitmaps could then track, and mark as in-use or not-in-use. So, basically: Reference counting. Unmap things when the reference count reaches zero, and the problem is solved. (Narrator: It wasn’t solved.)

#### Building a new interface

My initial design was to have a compatibility API for these which would still do the copying, and a new API that would let you basically “check out” a given mapping, then return it when you’re done, and that wouldn’t need to do the copying. Existing code would start out using the compatibility API, and then I’d migrate things to the new API and they’d work better.

This does imply a fair amount of work, though, to track ownership, and make sure it gets tracked correctly across operations. For instance, if you perform a union operation on two bitmaps, it’s *possible* that the resulting bitmap actually still contains some of the individual containers from either or both sources. So there’s support for making a combined/merged source. But if you combine two references, should you end up with a single reference, or with two? If you’re just performing an intersect operation on two items, and never touch those items again, you probably want to think of this as one reference. If you’re intersecting a row with each of 20 other rows, it’s more complicated.

So I spent a few days prototyping this and making sure things ran and passed the existing tests cleanly.

#### Testing it more carefully

Eventually I had something that sort of worked, but I wasn’t confident that I’d proven that it was correct. And then I had a great insight: Go supports finalizers for garbage-collected objects, so I could write finalizers which checked the reference counts on items, and their history, and reported items which had the wrong reference count on close.

That worked out pretty well. It definitely identified problems, and it made it pretty easy to correct them. Well, easy to identify them and figure out where they were happening; correcting them was hard, and messy, and required a lot of fiddly little details to try to track reference counts and ownership. Roughly two weeks after I first started on this, I had it basically working: It passed all the tests, and thanks to the fancy finalizer-based code, I had reasonable confidence that it was correct, and that if we got anything wrong in the complicated reference-counting code, we would be able to detect it.

And that got me to thinking, and I had a couple of insights that are closely related:

1. My confidence in the finalizers is much higher than my confidence in the code they’re checking.
2. The entire purpose of this is to determine whether or not I have anything left that contains a reference to a thing. I don’t actually care about the number of references, just “are there any”.
3. So basically, this is just a slower, more error-prone, reimplementation of what the garbage collector *already does* to decide whether to call those finalizers.

Which is to say, I realized I’d just spent two weeks building a convincing argument against my current design.

### Round Three: Lessons Learned

So I started over, mostly. I kept a lot of the base code for the generations, and the source tracking, but I didn’t implement any reference counting at all. Instead, I implemented a tracker (controlled by a build tag) which records when a generation is created, when we declare it “ended” (not planning to hand out new references to it), and when it gets finalized, and functionality for reporting on any generations which ended up in undesired states. For instance, if a generation got finalized without having been marked as ended, or hadn’t been finalized yet at the end of the run, even after explicitly running the garbage collector, that should be reported as suspicious. That’s no longer a functional part of the generation code; it’s an additional bit of code used only for debugging and testing.

Implementing this, and cleaning it up, took about a week. It did turn up a handful of bugs, but while the previous implementation turned up mostly bugs it had *introduced* by requiring careful reference counting which could be wrong, this one caught *existing* problems like tests which weren’t cleaning up after themselves properly, which are arguably actual bugs.

This code isn’t in-tree yet, because we still want to do more testing, but it appears that it finally gets us the performance boosts we wanted for read-only access to files, without the crash risks we were working so hard to avoid. Memory usage and CPU time are down, and the code that manages opening and closing the files is clearer and easier to read.

But the point of this long rambling story is: I wouldn’t have gotten there without the detour.

If you want to do something that looks hard, and you’re not sure whether you can do it, the best strategy I’ve found is to go *try* it, even if you’re not sure at all whether your approach is going to be viable. The most likely outcome is that you will fail, but that you’ll learn enough about the problem in the process to have a much better chance next time. That said, test your experimental designs extra carefully and thoroughly; if the reason you’re in this situation is that you don’t fully understand what problems you need to solve, you shouldn’t assume that you’ll have thought of all the problems that might crop up.

[Hero image credit](https://www.pexels.com/photo/close-up-of-pictures-185933/)