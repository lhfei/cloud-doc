### jhat

jhatAnalyzes the Java heap. This command is experimental and unsupported.

Synopsis**jhat** [ *options* ] *heap-dump-file*

- *heap-dump-file*

  Java binary heap dump file to be browsed. For a dump file that contains multiple heap dumps, you can specify which dump in the file by appending `#<number>` to the file name, for example, `myfile.hprof#3`.

DescriptionThe `jhat` command parses a Java heap dump file and starts a web server. The `jhat` command lets you to browse heap dumps with your favorite web browser. The `jhat` command supports predesigned queries such as show all instances of a known class `MyClass`, and Object Query Language (OQL). OQL is similar to SQL, except for querying heap dumps. Help on OQL is available from the OQL help page shown by the `jhat` command. With the default port, OQL help is available at http://localhost:7000/oqlhelp/There are several ways to generate a Java heap dump:

- 

- 

  Use the `jmap -dump` option to obtain a heap dump at runtime. See [`jmap`(1)](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jmap.html#CEGBCFBC).

- Use the `jconsole` option to obtain a heap dump through `HotSpotDiagnosticMXBean` at runtime. See [`jconsole`(1)](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jconsole.html#CACDDJCH) and the `HotSpotDiagnosticMXBean` interface description at
  `http://docs.oracle.com/javase/8/docs/jre/api/management/extension/com/sun/management/HotSpotDiagnosticMXBean.html`

- Heap dump is generated when an `OutOfMemoryError` is thrown by specifying the `-XX:+HeapDumpOnOutOfMemoryError` Java Virtual Machine (JVM) option.

- Use the `hprof` command. See the HPROF: A Heap/CPU Profiling Tool at
  `http://docs.oracle.com/javase/8/docs/technotes/samples/hprof.html`

Options-stack false|trueTurns off tracking object allocation call stack. If allocation site information is not available in the heap dump, then you have to set this flag to `false`. The default is `true`.-refs false|trueTurns off tracking of references to objects. Default is `true`. By default, back pointers, which are objects that point to a specified object such as referrers or incoming references, are calculated for all objects in the heap.-port *port-number*Sets the port for the `jhat` HTTP server. Default is 7000.-exclude *exclude-file*Specifies a file that lists data members that should be excluded from the reachable objects query. For example, if the file lists `java.lang.String.value`, then, then whenever the list of objects that are reachable from a specific object `o` are calculated, reference paths that involve `java.lang.String.value` field are not considered.-baseline *exclude-file*Specifies a baseline heap dump. Objects in both heap dumps with the same object ID are marked as not being new. Other objects are marked as new. This is useful for comparing two different heap dumps.-debug *int*Sets the debug level for this tool. A level of 0 means no debug output. Set higher values for more verbose modes.-versionReports the release number and exits-hDisplays a help message and exits.-helpDisplays a help message and exits.-J*flag*Passes `flag` to the Java Virtual Machine on which the `jhat` command is running. For example, `-J-Xmx512m` to use a maximum heap size of 512 MB.



See Also

- 

- 

  [`jmap`(1)](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jmap.html#CEGBCFBC)

- [`jconsole`(1)](https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jconsole.html#CACDDJCH)

- HPROF: A Heap/CPU Profiling Tool at
  `http://docs.oracle.com/javase/8/docs/technotes/samples/hprof.html`