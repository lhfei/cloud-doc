-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
--https://community.hortonworks.com/articles/4868/hive-oom-caused-by-javalangoutofmemoryerror-java-h.html
# Vertex failed, vertexName=Map 6, vertexId=vertex_1452174100502_1736_1_00, 
  diagnostics=[Task failed, taskId=task_1452174100502_1736_1_00_001528, 
  diagnostics=[TaskAttempt 0 failed, info=[Error: Failure while running 
  task:java.lang.RuntimeException: java.lang.OutOfMemoryError: Java heap space

	Increase hive.tez.container.size if it is set too low.
	tez.runtime.shuffle.memory.limit.percent from default value 0.7
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
#  Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient
>schematool -dbType mysql -initSchema
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
org.apache.thrift.TApplicationException: Required field 'client_protocol' is unset! Struct:TOpenSessionReq(client_protocol:null, configuration:{use:database=default})
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column 'A0.MESSAGE_FORMAT' in 'field list'

>user {Hive_metadata_db}
>ALTER TABLE `NOTIFICATION_LOG` ADD `MESSAGE_FORMAT` varchar(16);
>ALTER TABLE `NOTIFICATION_LOG` MODIFY `MESSAGE` longtext;

-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------





> #### Vertex did not succeed due to OWN_TASK_FAILURE

```ini
ERROR : Status: Failed
ERROR : Vertex failed, vertexName=Map 1, vertexId=vertex_1514250829950_0001_1_00, diagnostics=[Vertex vertex_1514250829950_0001_1_00 [Map 1] killed/failed due to:ROOT_INPUT_INIT_FAILURE, Vertex Input: values__tmp__table__1 initializer failed, vertex=vertex_1514250829950_0001_1_00 [Map 1], java.lang.NullPointerException
    at org.apache.hadoop.mapred.FileInputFormat.getBlockIndex(FileInputFormat.java:388)
    at org.apache.hadoop.mapred.FileInputFormat.getSplitHostsAndCachedHosts(FileInputFormat.java:579)
    at org.apache.hadoop.mapred.FileInputFormat.getSplits(FileInputFormat.java:359)
    at org.apache.hadoop.hive.ql.io.HiveInputFormat.addSplitsForGroup(HiveInputFormat.java:311)
    at org.apache.hadoop.hive.ql.io.HiveInputFormat.getSplits(HiveInputFormat.java:413)
    at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:155)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:273)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:266)
    at java.security.AccessController.doPrivileged(Native Method)
    at javax.security.auth.Subject.doAs(Subject.java:422)
    at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1866)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:266)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:253)
    at java.util.concurrent.FutureTask.run(FutureTask.java:266)
    at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
    at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
    at java.lang.Thread.run(Thread.java:745)
]
ERROR : DAG did not succeed due to VERTEX_FAILURE. failedVertices:1 killedVertices:0
Error: Error while processing statement: FAILED: Execution Error, return code 2 from org.apache.hadoop.hive.ql.exec.tez.TezTask. Vertex failed, vertexName=Map 1, vertexId=vertex_1514250829950_0001_1_00, diagnostics=[Vertex vertex_1514250829950_0001_1_00 [Map 1] killed/failed due to:ROOT_INPUT_INIT_FAILURE, Vertex Input: values__tmp__table__1 initializer failed, vertex=vertex_1514250829950_0001_1_00 [Map 1], java.lang.NullPointerException
    at org.apache.hadoop.mapred.FileInputFormat.getBlockIndex(FileInputFormat.java:388)
    at org.apache.hadoop.mapred.FileInputFormat.getSplitHostsAndCachedHosts(FileInputFormat.java:579)
    at org.apache.hadoop.mapred.FileInputFormat.getSplits(FileInputFormat.java:359)
    at org.apache.hadoop.hive.ql.io.HiveInputFormat.addSplitsForGroup(HiveInputFormat.java:311)
    at org.apache.hadoop.hive.ql.io.HiveInputFormat.getSplits(HiveInputFormat.java:413)
    at org.apache.hadoop.hive.ql.exec.tez.HiveSplitGenerator.initialize(HiveSplitGenerator.java:155)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:273)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable$1.run(RootInputInitializerManager.java:266)
    at java.security.AccessController.doPrivileged(Native Method)
    at javax.security.auth.Subject.doAs(Subject.java:422)
    at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1866)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:266)
    at org.apache.tez.dag.app.dag.RootInputInitializerManager$InputInitializerCallable.call(RootInputInitializerManager.java:253)
    at java.util.concurrent.FutureTask.run(FutureTask.java:266)
    at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
    at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
    at java.lang.Thread.run(Thread.java:745)
]DAG did not succeed due to VERTEX_FAILURE. failedVertices:1 killedVertices:0 (state=08S01,code=2)
```

Try the following:

```ini
hive.tez.container.size=2048.
hive.tez.java.opts=-Xmx1640m (0.8 times hive.tez.container.size)
tez.runtime.io.sort.mb=820 (0.4 times hive.tez.container.size)
ttez.runtime.unordered.output.buffer.size-mb=205 (0.1 times hive.tez.container.size)
```

