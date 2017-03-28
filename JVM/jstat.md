```
```
jstat - Java Virtual Machine Statistics Monitoring Tool
====================

[jstat]("https://docs.oracle.com/javase/8/docs/technotes/tools/unix/jstat.html")

Monitors Java Virtual Machine (JVM) statistics. This command is experimental and unsupported.

```
```

>## Synopsis

**jstat** [ *generalOption* | *outputOptions vmid* [ *interval*[s|ms] [ *count* ] ]



***generalOption***

&emsp;A single general command-line option -help or -options. See General Options.

***outputOptions***

&emsp;One or more output options that consist of a single statOption, plus any of the -t, -h, and -J options. See Output Options.

***vmid***

&emsp;Virtual machine identifier, which is a string that indicates the target JVM. The general syntax is the following:

&emsp;&emsp;[protocol:][//]lvmid[@hostname[:port]/servername]

&emsp;The syntax of the vmid string corresponds to the syntax of a URI. The vmid string can vary from a simple integer that represents a local JVM to a more complex construction that specifies a communications protocol, port number, and other implementation-specific values. See Virtual Machine Identifier.

***core***

&emsp;The core file for which the stack trace is to be printed.

***interval*** **[s|ms]**

&emsp;Sampling interval in the specified units, seconds (s) or milliseconds (ms). Default units are milliseconds. Must be a positive integer. When specified, the jstat command produces its output at each interval.

***count***

&emsp;Number of samples to display. The default value is infinity which causes the jstat command to display statistics until the target JVM terminates or the jstat command is terminated. This value must be a positive integer.

>## Description

The jstat command displays performance statistics for an instrumented Java HotSpot VM. The target JVM is identified by its virtual machine identifier, or vmid option.

>## Virtual Machine Identifier