```
```
jstack - Stack Trace
====================

[jstack]("https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstack.html")

Prints Java thread stack traces for a Java process, core file, or remote debug server. This command is experimental and unsupported.

```
```

>## Synopsis

**jstack** [*options*] *pid*

**jstack** [*options*] *executable core*

**jstack** [*options*] [*server-id@*] *remote-hostname-or-IP*


***options***

&emsp;The command-line options. Sess [Options](#Options)

***pid***

&emsp;The process ID for which the stack trace is printed. The process must be a java process. To get a list of java processes running on a machine, use the [jps]("https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jps.html#CHDGHCGB") command.

***executable***

&emsp;The Java executable from which the core dump was produced.

***core***

&emsp;The core file for which the stack trace is to be printed.

***remote-hostname-ip***

&emsp;The remote debug server *hostname* or *IP* address. See [jsadebugg]("https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jsadebugd.html#BHBHHJCA")

***server-id***

&emsp;An optional unique ID to user when multiple debug servers are running on the same remote host.

>## Description

The jstack command prints Java stack traces of Java threads ofr specified Java prodess, core file, or remote debug server. For each Java frame, the full class name, method name, byte code index(BCI), and line numberm when available, are printed. With the -m options, the jstack command prints both Java and native frames of all threads with the program counter(PC). For each native frame, the closest native symbol to PC, when available, is printed. C++ mangled names are not demangled.To demangle C++ names, the output of this command can be piped to c++filt. When the specified process is running on a 64-bit Java Virtual Machine, you might need to specify the *-J-d64* option, for example: *jstack -J-d64 -m pid*.

**Note**: This utility is unsupported and might not be available in future release of the JDK. In Windows Systems where the dbgeng.dll file is not present, Debugging Tools For Windows must be installed so these tools work. The PATH environment variable needs to contain the location of the jvm.dll that is used by the target process, or the location from which the crash dump file was produced. For example:

```sh
set PATH=<jdk>\jre\bin\client;%PATH%
```

>## Options

-F

&emsp;Force a stack dump when jstack [-l] pid does not respond.

-l

&emsp;Long listing. Prints additional information about locks such as a list of owned java.util.concurrent ownable synchronizers. See the AbstractOwnableSynchronizer class description at [AbstractOwnableSynchronizer]("http://docs.oracle.com/javase/8/docs/api/java/util/concurrent/locks/AbstractOwnableSynchronizer.html").


-m

&emsp;Prints a mixed mode stack trace that has both Java and native C/C++ frames.

-h

&emsp;Prints a help message.

-help

&emsp;Prints a help message.


>##Known Bugs

In mixed mode stack trace, the -m option does not work with the remote debug server.

>## See Also

- pstack(1)

- C++filt(1)

- [jps(1)]("https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jps.html#CHDGHCGB")

- [jsadebugd(1)]("https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jsadebugd.html#BHBHHJCA")

```
```
# jstack -- Utility

>## Troubleshoot with jstack Utility

..

>## Force a Stack Dump

If the jstack pid command does not respond because of a hung process, then the -F option can be used (on Oracle Solaris and Linux operating systems only) to force a stack dump, as shown in [Example 2-29](Example 2-29 Force a Stack Dump with jstack Utility "").

######Example 2-29 Force a Stack Dump with jstack Utility

```sh
$ jstack -F 8321
Attaching to process ID 8321, please wait...
Debugger attached successfully.
Client compiler detected.
JVM version is 1.6.0-rc-b100
Deadlock Detection:

Found one Java-level deadlock:
=============================

"Thread2":
  waiting to lock Monitor@0x000af398 (Object@0xf819aa10, a java/lang/String),
  which is held by "Thread1"
"Thread1":
  waiting to lock Monitor@0x000af400 (Object@0xf819aa48, a java/lang/String),
  which is held by "Thread2"

Found a total of 1 deadlock.

Thread t@2: (state = BLOCKED)

Thread t@11: (state = BLOCKED)
 - Deadlock$DeadlockMakerThread.run() @bci=108, line=32 (Interpreted frame)

Thread t@10: (state = BLOCKED)
 - Deadlock$DeadlockMakerThread.run() @bci=108, line=32 (Interpreted frame)

Thread t@6: (state = BLOCKED)

Thread t@5: (state = BLOCKED)
 - java.lang.Object.wait(long) @bci=-1107318896 (Interpreted frame)
 - java.lang.Object.wait(long) @bci=0 (Interpreted frame)
 - java.lang.ref.ReferenceQueue.remove(long) @bci=44, line=116 (Interpreted frame)
 - java.lang.ref.ReferenceQueue.remove() @bci=2, line=132 (Interpreted frame)
 - java.lang.ref.Finalizer$FinalizerThread.run() @bci=3, line=159 (Interpreted frame)

Thread t@4: (state = BLOCKED)
 - java.lang.Object.wait(long) @bci=0 (Interpreted frame)
 - java.lang.Object.wait(long) @bci=0 (Interpreted frame)
 - java.lang.Object.wait() @bci=2, line=485 (Interpreted frame)
 - java.lang.ref.Reference$ReferenceHandler.run() @bci=46, line=116 (Interpreted frame)

```


>## Stack Trace from a Core Dump

To obtain stack traces from a core dump, execute the jstack command on a core file, as shown in [Example 2-30]("Example 2-30 Stack Trace from a Core Dump").

######Example 2-30 Stack Trace from a Core Dump

```sh
$ jstack $JAVA_HOME/bin/java core
```

>## Mixed Stack

he jstack utility can also be used to print a mixed stack; that is, it can print native stack frames in addition to the Java stack. Native frames are the C/C++ frames associated with VM code and JNI/native code.

To print a mixed stack, use the -m option, as shown in [Example 2-31]("Example 2-31 Mixed Java Stack with jstack Utility").

######Example 2-31 Mixed Java Stack with jstack Utility

```sh
$ jstack -m 21177
Attaching to process ID 21177, please wait...
Debugger attached successfully.
Client compiler detected.
JVM version is 1.6.0-rc-b100
Deadlock Detection:

Found one Java-level deadlock:
=============================

"Thread1":
  waiting to lock Monitor@0x0005c750 (Object@0xd4405938, a java/lang/String),
  which is held by "Thread2"
"Thread2":
  waiting to lock Monitor@0x0005c6e8 (Object@0xd4405900, a java/lang/String),
  which is held by "Thread1"

Found a total of 1 deadlock.

----------------- t@1 -----------------
0xff2c0fbc    __lwp_wait + 0x4
0xff2bc9bc    _thrp_join + 0x34
0xff2bcb28    thr_join + 0x10
0x00018a04    ContinueInNewThread + 0x30
0x00012480    main + 0xeb0
0x000111a0    _start + 0x108
----------------- t@2 -----------------
0xff2c1070    ___lwp_cond_wait + 0x4
0xfec03638    bool Monitor::wait(bool,long) + 0x420
0xfec9e2c8    bool Threads::destroy_vm() + 0xa4
0xfe93ad5c    jni_DestroyJavaVM + 0x1bc
0x00013ac0    JavaMain + 0x1600
0xff2bfd9c    _lwp_start
----------------- t@3 -----------------
0xff2c1070    ___lwp_cond_wait + 0x4
0xff2ac104    _lwp_cond_timedwait + 0x1c
0xfec034f4    bool Monitor::wait(bool,long) + 0x2dc
0xfece60bc    void VMThread::loop() + 0x1b8
0xfe8b66a4    void VMThread::run() + 0x98
0xfec139f4    java_start + 0x118
0xff2bfd9c    _lwp_start
----------------- t@4 -----------------
0xff2c1070    ___lwp_cond_wait + 0x4
0xfec195e8    void os::PlatformEvent::park() + 0xf0
0xfec88464    void ObjectMonitor::wait(long long,bool,Thread*) + 0x548
0xfe8cb974    void ObjectSynchronizer::wait(Handle,long long,Thread*) + 0x148
0xfe8cb508    JVM_MonitorWait + 0x29c
0xfc40e548    * java.lang.Object.wait(long) bci:0 (Interpreted frame)
0xfc40e4f4    * java.lang.Object.wait(long) bci:0 (Interpreted frame)
0xfc405a10    * java.lang.Object.wait() bci:2 line:485 (Interpreted frame)
... more lines removed here to reduce output...
----------------- t@12 -----------------
0xff2bfe3c    __lwp_park + 0x10
0xfe9925e4    AttachOperation*AttachListener::dequeue() + 0x148
0xfe99115c    void attach_listener_thread_entry(JavaThread*,Thread*) + 0x1fc
0xfec99ad8    void JavaThread::thread_main_inner() + 0x48
0xfec139f4    java_start + 0x118
0xff2bfd9c    _lwp_start
----------------- t@13 -----------------
0xff2c1500    _door_return + 0xc
----------------- t@14 -----------------
0xff2c1500    _door_return + 0xc

```

Frames that are prefixed with an asterisk (*) are Java frames, whereas frames that are not prefixed with an asterisk are native C/C++ frames.

The output of the utility can be piped through *c++filt* to demangle C++ mangled symbol names. Because the Java HotSpot VM is developed in the C++ language, the jstack utility prints C++ mangled symbol names for the Java HotSpot internal functions.

The *c++filt* utility is delivered with the native C++ compiler suite: SUNWspro on Oracle Solaris operating system and gnu on Linux.
