####################################################################################
#
# Spark FAQs
#
####################################################################################


====================================================================================
```
```
##
project spark-tags_2.11: Execution scala-compile-first of goal net.alchim31.maven:scala-maven-plugin:3.2.2:compile failed.
```
Caused by: Compile failed via zinc server
```
./build/mvn -rf :spark-tags_2.11
./build/zinc-<version>/bin/zinc -shutdown
```


	
```
Did you configure the correct one through spark.history.fs.logDirectory?
```
```
====================================================================================
> .

```
org.apache.hadoop.hive.ql.metadata.HiveException: java.lang.RuntimeException: Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient
```

...


```
Caused by: MetaException(message:Could not connect to meta store using any of the URIs provided. Most recent failure: org.apache.thrift.transport.TTransportException: java.net.ConnectException: Connection refused (Connection refused)
        at org.apache.thrift.transport.TSocket.open(TSocket.java:226)
```
The `hivemetastore` service is not running. You can start the service with the command below. This command is for installations made using packages.
```
hive --service metastore
```

For tarball installations, you can start the hive metastore using the below command:

```
hive --service metastore &
```

====================================================================================

```
```
```
```
```
```
```
```
====================================================================================
```
```
```
```
```
```
```
```
====================================================================================
```
```
```
```
```
```
```
```
```
====================================================================================
```
```
```
```
```
```
```
```
```
```
====================================================================================
```
```
```
```
```
```
```
```
====================================================================================
```
```
```
```
```
```
```
```
```
====================================================================================
```
```
```
```
```
```
```
```
====================================================================================
