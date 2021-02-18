Pilosa stores integer values in Base-2, Range-Encoded, Bit-sliced Indexes. This post explains what all that means.

### Introduction

Pilosa is built around the concept of representing everything as bitmaps. Relationships between objects, for example, are treated as boolean values—either the relationship exists or it doesn’t—and a set of these boolean values is stored as a series of ones and zeros. These boolean sets are bitmaps, and by using bitmaps in a variety of bitwise operations, we can perform complex queries very quickly. Additionally, bitmap compression techniquies allow us to represent large amounts of data in a very compact format, which reduces the amount of resources we need to store data and perform queries.

Using bitmaps and [Roaring bitmap compression](http://roaringbitmap.org/), Pilosa is really good at performing segmentation queries on billions of objects. But often we see use-cases where it would be useful to work with integer values. For example, we might want to perform a query that excludes all records with a value of `foo` greater than 1,000. This post explains, step-by-step, how we added range-encoded bitmaps to Pilosa, giving us the ability to support integer values in our query operations.

All of the concepts described in this post are based on research done over the last couple of decades by some very smart people. This is my attempt to describe things at a little higher level, but I encourage you to read more about [Bit-sliced Indexes](https://cs.brown.edu/courses/cs227/archives/2008/Papers/Indexing/buchmann98.pdf) and [Range-Encoding](https://link.springer.com/chapter/10.1007/3-540-45675-9_8).

### Bitmap Encoding

To get started, let’s assume that we want to catalog every member of the [Animal Kingdom](https://en.wikipedia.org/wiki/Animal) in such a way that we can easily, and efficiently, explore various species based on their traits. Because we’re talking about bitmaps, an example data set might look like this:

![Example data set](https://www.pilosa.com/img/blog/range-encoded-bitmaps/example-dataset.png) *Example Data Set*

#### Equality-encoded Bitmaps

The example above shows a set of equality-encoded bitmaps, where each row—each trait—is a bitmap indicating which animals have that trait. Although it’s a fairly simple concept, equality-encoding can be pretty powerful. Because it lets us represent everything as a boolean relationship (i.e. a manatee has wings: yes/no), we can perform all sorts of bitwise operations on the data.

The next diagram shows how we find all animals that are air-breathing invertebrates by performing a logical AND on the `Invertebrate` and `Breathes Air` bitmaps. Based on our sample data, we can see that the Banana Slug, Garden Snail, and Wheel Bug all have both of those traits.

![Bitwise Intersection example](https://www.pilosa.com/img/blog/range-encoded-bitmaps/bitwise-intersection.png) *Bitwise Intersection of two traits*

You can get pretty far with equality-encoded bitmaps, but what about cases where a boolean value doesn’t best represent the original data? What if we want to add a trait called `Captivity` which represents the total number of specimens that are currently held in captivity, and we want to perform queries filtered by those values? (As you probably suspect, the values that we use for `Captivity` in the examples below are completely made up, but they help demonstrate the concepts.)

Given what we know about equality-encoded bitmaps, there are a couple of (admittedly naive) approaches that we could take. One approach would be to create a trait (bitmap) for every possible `Captivity` value, like this:

![Captivity Counts as individual bitmaps](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-rows.png) *Captivity Counts represented as individual bitmaps*

This approach is ok, but it has a couple of limitations. First, it’s not very efficient. Depending on the cardinality, you may need to create a lot of bitmaps to represent all possible values. Second, if you want to filter your query by a range of `Captivity` values, you’ll have to perform an `OR` operation against every possible value in your range. In order to know which animals have fewer than 100 specimens in captivity, your query needs to perform something like (Captivity=99 OR Captivity=98 OR Captivity=97 OR …). You get the idea.

Instead of representing every possible value as a unique bitmap, another approach is to create buckets of `Captivity` ranges. In that case, you might have something like this:

![Captivity Counts as buckets](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-buckets.png) *Captivity Counts represented as buckets*

One benefit to this approach is that it’s a bit more efficient. It’s also easier to query because you don’t have to construct a Union of multiple bitmaps in order to represent a range of values. The downside is that it’s not as granular; by transforming `47` into the bucket 0-99, you are losing information.

Either of those approaches are perfectly valid solutions to some problems, but for cases where cardinality is extremely high and losing information is not acceptable, we need another way to represent non-boolean values. And we need to do it in such a way that we can perform queries on ranges of values without writing really large and cumbersome `OR` operations. For that, let’s talk about range-encoded bitmaps and how they avoid some of the problems that we ran into with the previous approaches.

#### Range-Encoded Bitmaps

First, let’s take our example above and see what it looks like if we use range-encoded bitmaps.

![Captivity Counts as Range-Encoded bitmaps](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-range-encoded-rows.png) *Captivity Counts as Range-Encoded bitmaps*

Representing a value with range-encoded bitmaps is similar to what we did with equality-encoding, but instead of just setting the bit that corresponds to a specific value, we also set a bit for every value greater than the actual value. For example, because there are 14 Koala Bears in capitivity, we set the bit in bitmap 14 as well as bitmaps 15, 16, 17, etc. Instead of a bitmap representing all the animals with a specific captivity count, a bitmap now represents all of the animals with a captivity count up to and including that amount.

This encoding method lets us perform those range queries that we did before, but instead of performing an `OR` operation on many different bitmaps, we can get what we want from just one or two bitmaps. For example, if we want to know which animals have fewer than 15 specimens in captivity, we just pull the 14 bitmap and we’re done. If we want to know which animals have more than 15 specimens in captivity, it’s a little more complicated, but not much. For that, we pull the bitmap representing the maximum count (in our case that’s the 956 bitmap), and then we subtract the 15 bitmap.

Those operations are much simpler—and much more efficient—than our previous approach. We have addressed the problem that had us `OR`‘ing together dozens of bitmaps in order to find our range, and we aren’t losing any information like we did in the bucketing approach. But we still have a couple of issues that make this approach less than ideal. First, we still have to keep a bitmap representing every specific captivity count. And on top of that, we have added the complexity and overhead of having to set a bit not just for the value we’re interested in, but also for every value greater than that one. This would very likely introduce performance problems in a write-heavy use-case.

Ideally what we want is to have the functionality of range-encoded bitmaps with the efficiency of equality-encoding. Next, we’ll discuss bit-sliced indexes and see how that helps us achieve what we want.

### Bit-sliced Indexes

If we want to represent every possible value from 0 to 956 using range-encoded bitmaps, we have to use 957 bitmaps. While this works, it’s not the most efficient approach, and when the cardinality of possible values gets really high, the number of bitmaps we need to maintain can become prohibitive. Bit-sliced indexes let us represent those same values in a more efficient way.

Let’s look at our example data and talk about how we would represent it using bit-sliced indexes.

![Captivity Counts as a Base-10, Bit-sliced Index](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-bsi-base10.png) *Base-10, Bit-sliced Index*

Notice that we’ve broken our values into three, base-10 components. The first column of bits represents the value `003`, which is the number of Manatees in captivity. Component 0 of `003` is `3`, so we set a bit in component 0, row 3. Components 1 and 2 of `003` are both `0`, so we set bits in component 1, row 0 and component 2, row 0. Each component in our base-10 index requires 10 bitmaps to represent all possible values, so in our captivity example where we need to represent values ranging from 0 to 956, we only need (3 x 10) = 30 bitmaps (as opposed to 957 bitmaps that would be required if we used a bitmap for every distinct value).

So that’s great, but we’ve basically just found a way to be more efficient with our equality-encoding strategy. Let’s see what it looks like when we combine bit-sliced indexes with range-encoding.

### Range-Encoded Bit-Slice Indexes

![Captivity Counts as a Range-Encoded, Base-10, Bit-sliced Index](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-bsi-range-encoded-base10.png) *Range-Encoded, Base-10, Bit-sliced Index*

Notice that the most significant value in each component (9 in the base-10 case) is always one. Because of this, we don’t need to store the highest value. So for base-10, range-encoded, bit-sliced indexes, we only need 9 bitmaps to represent a component. In addition to that, we need to store one more bitmap, called “Not Null”, which indicates whether or not a value has been set for that column. The next diagram shows the resulting bitmaps.

![Captivity Counts as a Range-Encoded, Base-10, Bit-sliced Index with Not-Null](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-bsi-range-encoded-base10-not-null.png) *Range-Encoded, Base-10, Bit-sliced Index with Not-Null*

So for 3-component values, we need ((3 x 9) + 1) = 28 bitmaps to represent any value in the range 0 to 999. Now we have a pretty efficient way to store values, and we get the benefit of range encoding, so we can perform queries that filter on ranges. Let’s take it just one step further and try encoding the base-2 representation of our value range.

#### Base-2 Components

If, instead of representing our `Captivity` values as base-10 components, we use base-2 components, then we end up with a range-encoded set of bit-sliced indexes that looks like this:

![Capacity Counts as a Range-Encoded, Base-2, Bit-sliced Index](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-bsi-range-encoded-base2.png) *Range-Encoded, Base-2, Bit-sliced Index*

The first column of bits represents the base-2 value `000000011`, which is the number of Manatees in captivity (3 in base-10). Since component 0 and component 1 of `000000011` are both `1`, we set a bit in component 0, row 1 and component 1, row 1. Since the remaining components of `000000011` are all `0`, we set a bit in row 0 for components 2 through 9, and also—because these are range-encoded—we set a bit in every value greater than 0. In the case of base-2 components, that means we also set the bit in row 1 for components 2 through 9.

But remember, just like we saw before with bitmap 9 of the base-10 representation, bitmap 1 is always one so we don’t need to store it. That leaves us with this:

![Captivity Counts as a Range-Encoded, Base-2, Bit-sliced Index with Not-Null](https://www.pilosa.com/img/blog/range-encoded-bitmaps/captive-bsi-range-encoded-base2-not-null.png) *Range-Encoded, Base-2, Bit-sliced Index with Not-Null*

With this encoding, we can represent the range of sample values with only 10 bitmaps! Also, notice that the base-2, range-encoded, bit-sliced index is the inverse of the binary representation of the integer value. What this tells us is that we can represent any range of values with cardinality n using only (n + 1) bitmaps (where the additional bitmap is the “Not Null” bitmap). And it means that we can perform range queries on large integer values without needing to store an unreasonable number of bitmaps.

### Range-Encoded Bitmaps in Pilosa

By implementing range-encoded bitmaps in Pilosa, users can now store integer values that pertain to billions of objects, and very quickly perform queries that filter by a range of values. We also support aggregation queries like `Sum()`. What’s the total number of winged vertebrates in captivity? No problem.

As one last exercise, let’s demonstrate how we would store and query our example `Captivity` data in Pilosa.

```
# Create an index called "animals".
curl -X POST localhost:10101/index/animals

# Create a frame "traits" to hold captivity values.
curl localhost:10101/index/animals/frame/traits \
  -X POST \
  -d '{"options":{"rangeEnabled": true,
                     "fields": [{"name": "captivity",
                                 "type": "int",
                                 "min": 0,
                                 "max": 956}]
                    }
         }'

# Add the captivity values to the field.
curl localhost:10101/index/animals/query \
  -X POST \
  -d 'SetFieldValue(frame=traits, col=1,  captivity=3)
      SetFieldValue(frame=traits, col=2,  captivity=392)
      SetFieldValue(frame=traits, col=3,  captivity=47)
      SetFieldValue(frame=traits, col=4,  captivity=956)
      SetFieldValue(frame=traits, col=5,  captivity=219)
      SetFieldValue(frame=traits, col=6,  captivity=14)
      SetFieldValue(frame=traits, col=7,  captivity=47)
      SetFieldValue(frame=traits, col=8,  captivity=504)
      SetFieldValue(frame=traits, col=9,  captivity=21)
      SetFieldValue(frame=traits, col=10, captivity=0)
      SetFieldValue(frame=traits, col=11, captivity=123)
      SetFieldValue(frame=traits, col=12, captivity=318)
  '

# Query for all animals with more than 100 specimens
# in captivity.
curl localhost:10101/index/animals/query \
  -X POST \
  -d 'Range(frame=traits, captivity > 100)'
 
# Query for the total number of animals in captivity
curl localhost:10101/index/animals/query \
  -X POST \
  -d 'Sum(frame=traits, field=captivity)'
```

### Conclusion

The examples that I described in this post showed how we can use Bit-sliced indexes to significantly reduce the number of bitmaps we need to represent a range of integer values. And by applying range-encoding to our indexes, we are able to perform various range queries on our data. The chart below compares the different approaches that we discussed.

![Comparison Chart](https://www.pilosa.com/img/blog/range-encoded-bitmaps/example-comparison.png) *Comparison Chart*

We added Range-Encoding support to [Release 0.7.0](https://github.com/pilosa/pilosa/releases/tag/v0.7.0). You should also check out the [Range-Encoding Documentation](https://www.pilosa.com/docs/latest/data-model/#bsi-range-encoding).

Try it out, and let us know what you think. We’re always looking to make improvements and appreciate any feedback you have!

*Travis is Chief Architect at Pilosa. Find him on Twitter at [@travislturner](https://twitter.com/travislturner?lang=en).*



**[Read More](https://www.pilosa.com/blog/range-encoded-bitmaps/)**

