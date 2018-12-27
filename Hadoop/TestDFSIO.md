# TestDFSIO

Useage



```ini
Usage: TestDFSIO [genericOptions] -read [-random | -backward | -skip [-skipSize Size]] | -write | -append | -truncate | -clean [-compression codecClassName] [-nrFiles N] [-size Size[B|KB|MB|GB|TB]] [-resFile resultFileName] [-bufferSize Bytes] [-storagePolicy storagePolicyName] [-erasureCodePolicy erasureCodePolicyName]
```





> Write

```shell
hadoop jar hadoop-common-3.1.1.3.0.1.0-187-tests.jar org.apache.hadoop.fs.TestDFSIO  -write -nrFiles 10 -size 10MB
```

Result output like as belown:

```ini
18/12/21 17:10:15 INFO fs.TestDFSIO: ----- TestDFSIO ----- : write
18/12/21 17:10:15 INFO fs.TestDFSIO:             Date & time: Fri Dec 21 17:10:15 CST 2018
18/12/21 17:10:15 INFO fs.TestDFSIO:         Number of files: 10
18/12/21 17:10:15 INFO fs.TestDFSIO:  Total MBytes processed: 100
18/12/21 17:10:15 INFO fs.TestDFSIO:       Throughput mb/sec: 29.23
18/12/21 17:10:15 INFO fs.TestDFSIO:  Average IO rate mb/sec: 30.43
18/12/21 17:10:15 INFO fs.TestDFSIO:   IO rate std deviation: 6.84
18/12/21 17:10:15 INFO fs.TestDFSIO:      Test exec time sec: 19.35
```



> Read

```
hadoop jar hadoop-common-3.1.1.3.0.1.0-187-tests.jar org.apache.hadoop.fs.TestDFSIO  -read -nrFiles 10 -size 10MB
```



```ini
18/12/21 17:13:21 INFO fs.TestDFSIO: ----- TestDFSIO ----- : read
18/12/21 17:13:21 INFO fs.TestDFSIO:             Date & time: Fri Dec 21 17:13:21 CST 2018
18/12/21 17:13:21 INFO fs.TestDFSIO:         Number of files: 10
18/12/21 17:13:21 INFO fs.TestDFSIO:  Total MBytes processed: 100
18/12/21 17:13:21 INFO fs.TestDFSIO:       Throughput mb/sec: 94.52
18/12/21 17:13:21 INFO fs.TestDFSIO:  Average IO rate mb/sec: 372
18/12/21 17:13:21 INFO fs.TestDFSIO:   IO rate std deviation: 590.31
18/12/21 17:13:21 INFO fs.TestDFSIO:      Test exec time sec: 20.5
```

