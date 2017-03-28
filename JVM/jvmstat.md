```
```
jvmstat
====================

[jvmstat]("http://www.oracle.com/technetwork/java/jvmstat-142257.html#Support")



```
```

>#### Bundled Experimental JDK Tools and Utilities

You can use the following tools from the Java SE 6 JDK to monitor JVM performance and resource consumption. The tools described in this section are unsupported and experimental, and should be used with that in mind. They may not be available for future JDK versions.

Platform support:

**jps**, **jstat**, and **jstatd**: all platforms except Windows 98 and Windows ME.
 

Tool Name	    |    Brief Description
----------------|-----------------------------------------------------------------------------
[jps](http://docs.oracle.com/javase/6/docs/technotes/tools/share/jps.html "")	        | Experimental: JVM Process Status Tool - Lists instrumented HotSpot Java virtual machines on a target system. (formerly jvmps)
[jstat](http://docs.oracle.com/javase/6/docs/technotes/tools/share/jstat.html "")	    | Experimental: JVM Statistics Monitoring Tool - Attaches to an instrumented HotSpot Java virtual machine and collects and logs performance statistics as specified by the command line options. (formerly jvmstat)
[jstatd](http://docs.oracle.com/javase/6/docs/technotes/tools/share/jstatd.html "")	    | Experimental: JVM jstat Daemon - Launches an RMI server application that monitors for the creation and termination of instrumented HotSpot Java virtual machines and provides a interface to allow remote monitoring tools to attach to Java virtual machines running on the local system. (formerly perfagent)
 
>#### Unbundled Experimental JDK Tools and Utilities

You can use the following tools from the jvmstat 3.0 distribution to monitor JVM performance and resource consumption. The tools described in this section are unsupported and experimental, and should be used with that in mind. They may not be available for future JDK versions.

Platform support:

- visualgc: all platforms except Windows 98 and Windows ME.
 

Tool Name	|    Brief Description
------------|----------------------------------------------------------------------
[visualgc](http://www.oracle.com/technetwork/java/visualgc-136680.html "")	| Experimental: Visual Garbage Collection Monitoring Tool - a graphical tool for monitoring the HotSpot Garbage Collector, Compiler, and class loader. It can monitor both local and remote JVMs.