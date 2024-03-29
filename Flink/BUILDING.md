



> Build

```shell
mvn clean install -DskipTests -Dfast -T5 -Dmaven.compile.fork=true  -Dscala-2.12 -Dhadoop.version=3.1.1 -Dcheckstyle.skip=true -Dcheckstyle.skip=true
```



```ini
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for Flink : 1.12.2:
[INFO] 
[INFO] Flink : Tools : Force Shading ...................... SUCCESS [  0.980 s]
[INFO] Flink : ............................................ SUCCESS [  2.139 s]
[INFO] Flink : Annotations ................................ SUCCESS [  1.431 s]
[INFO] Flink : Test utils : ............................... SUCCESS [  0.360 s]
[INFO] Flink : Test utils : Junit ......................... SUCCESS [  1.327 s]
[INFO] Flink : Metrics : .................................. SUCCESS [  0.358 s]
[INFO] Flink : Metrics : Core ............................. SUCCESS [  1.195 s]
[INFO] Flink : Core ....................................... SUCCESS [ 13.162 s]
[INFO] Flink : Java ....................................... SUCCESS [  3.028 s]
[INFO] Flink : Queryable state : .......................... SUCCESS [  0.369 s]
[INFO] Flink : Queryable state : Client Java .............. SUCCESS [  0.879 s]
[INFO] Flink : FileSystems : .............................. SUCCESS [  0.295 s]
[INFO] Flink : FileSystems : Hadoop FS .................... SUCCESS [  2.653 s]
[INFO] Flink : Runtime .................................... SUCCESS [02:38 min]
[INFO] Flink : Scala ...................................... SUCCESS [01:13 min]
[INFO] Flink : FileSystems : Mapr FS ...................... SUCCESS [  1.855 s]
[INFO] Flink : FileSystems : Hadoop FS shaded ............. SUCCESS [  7.119 s]
[INFO] Flink : FileSystems : S3 FS Base ................... SUCCESS [  1.690 s]
[INFO] Flink : FileSystems : S3 FS Hadoop ................. SUCCESS [  7.259 s]
[INFO] Flink : FileSystems : S3 FS Presto ................. SUCCESS [  7.679 s]
[INFO] Flink : FileSystems : Swift FS Hadoop .............. SUCCESS [ 20.919 s]
[INFO] Flink : FileSystems : OSS FS ....................... SUCCESS [ 10.508 s]
[INFO] Flink : FileSystems : Azure FS Hadoop .............. SUCCESS [ 11.975 s]
[INFO] Flink : Optimizer .................................. SUCCESS [  2.590 s]
[INFO] Flink : Connectors : ............................... SUCCESS [  0.327 s]
[INFO] Flink : Connectors : File Sink Common .............. SUCCESS [  0.639 s]
[INFO] Flink : Streaming Java ............................. SUCCESS [  8.982 s]
[INFO] Flink : Clients .................................... SUCCESS [  2.974 s]
[INFO] Flink : Test utils : Utils ......................... SUCCESS [  1.857 s]
[INFO] Flink : Runtime web ................................ SUCCESS [02:37 min]
[INFO] Flink : Examples : ................................. SUCCESS [  0.238 s]
[INFO] Flink : Examples : Batch ........................... SUCCESS [ 20.944 s]
[INFO] Flink : Connectors : Hadoop compatibility .......... SUCCESS [ 11.900 s]
[INFO] Flink : State backends : ........................... SUCCESS [  0.356 s]
[INFO] Flink : State backends : RocksDB ................... SUCCESS [  2.176 s]
[INFO] Flink : Tests ...................................... SUCCESS [ 25.013 s]
[INFO] Flink : Streaming Scala ............................ SUCCESS [ 36.919 s]
[INFO] Flink : Connectors : HCatalog ...................... SUCCESS [ 10.746 s]
[INFO] Flink : Test utils : Connectors .................... SUCCESS [  0.315 s]
[INFO] Flink : Connectors : Base .......................... SUCCESS [  0.854 s]
[INFO] Flink : Connectors : Files ......................... SUCCESS [  2.027 s]
[INFO] Flink : Table : .................................... SUCCESS [  0.372 s]
[INFO] Flink : Table : Common ............................. SUCCESS [  5.553 s]
[INFO] Flink : Table : API Java ........................... SUCCESS [  3.874 s]
[INFO] Flink : Table : API Java bridge .................... SUCCESS [  1.679 s]
[INFO] Flink : Table : API Scala .......................... SUCCESS [ 30.595 s]
[INFO] Flink : Table : API Scala bridge ................... SUCCESS [ 12.617 s]
[INFO] Flink : Table : SQL Parser ......................... SUCCESS [  8.792 s]
[INFO] Flink : Libraries : ................................ SUCCESS [  0.175 s]
[INFO] Flink : Libraries : CEP ............................ SUCCESS [  6.201 s]
[INFO] Flink : Table : Planner ............................ SUCCESS [02:08 min]
[INFO] Flink : Table : SQL Parser Hive .................... SUCCESS [ 11.253 s]
[INFO] Flink : Table : Runtime Blink ...................... SUCCESS [  8.820 s]
[INFO] Flink : Table : Planner Blink ...................... SUCCESS [02:32 min]
[INFO] Flink : Formats : .................................. SUCCESS [  0.105 s]
[INFO] Flink : Formats : Json ............................. SUCCESS [  2.075 s]
[INFO] Flink : Connectors : Elasticsearch base ............ SUCCESS [  2.533 s]
[INFO] Flink : Connectors : Elasticsearch 5 ............... SUCCESS [ 22.350 s]
[INFO] Flink : Connectors : Elasticsearch 6 ............... SUCCESS [  2.379 s]
[INFO] Flink : Connectors : Elasticsearch 7 ............... SUCCESS [  2.005 s]
[INFO] Flink : Connectors : HBase base .................... SUCCESS [  6.898 s]
[INFO] Flink : Connectors : HBase 1.4 ..................... SUCCESS [  6.239 s]
[INFO] Flink : Connectors : HBase 2.2 ..................... SUCCESS [  6.232 s]
[INFO] Flink : Formats : Hadoop bulk ...................... SUCCESS [  3.894 s]
[INFO] Flink : Formats : Orc .............................. SUCCESS [  2.513 s]
[INFO] Flink : Formats : Orc nohive ....................... SUCCESS [  1.879 s]
[INFO] Flink : Formats : Avro ............................. SUCCESS [  4.134 s]
[INFO] Flink : Formats : Parquet .......................... SUCCESS [  7.976 s]
[INFO] Flink : Formats : Csv .............................. SUCCESS [  1.075 s]
[INFO] Flink : Connectors : Hive .......................... SUCCESS [  8.883 s]
[INFO] Flink : Connectors : JDBC .......................... SUCCESS [  2.477 s]
[INFO] Flink : Connectors : RabbitMQ ...................... SUCCESS [  0.600 s]
[INFO] Flink : Connectors : Twitter ....................... SUCCESS [  3.877 s]
[INFO] Flink : Connectors : Nifi .......................... SUCCESS [  0.524 s]
[INFO] Flink : Connectors : Cassandra ..................... SUCCESS [  6.049 s]
[INFO] Flink : Metrics : JMX .............................. SUCCESS [  0.820 s]
[INFO] Flink : Connectors : Kafka ......................... SUCCESS [  4.892 s]
[INFO] Flink : Connectors : Google PubSub ................. SUCCESS [  1.764 s]
[INFO] Flink : Connectors : Kinesis ....................... SUCCESS [ 18.606 s]
[INFO] Flink : Connectors : SQL : Elasticsearch 6 ......... SUCCESS [ 10.903 s]
[INFO] Flink : Connectors : SQL : Elasticsearch 7 ......... SUCCESS [ 11.918 s]
[INFO] Flink : Connectors : SQL : HBase 1.4 ............... SUCCESS [ 14.240 s]
[INFO] Flink : Connectors : SQL : HBase 2.2 ............... SUCCESS [ 20.086 s]
[INFO] Flink : Connectors : SQL : Hive 1.2.2 .............. SUCCESS [  7.476 s]
[INFO] Flink : Connectors : SQL : Hive 2.2.0 .............. SUCCESS [  8.249 s]
[INFO] Flink : Connectors : SQL : Hive 2.3.6 .............. SUCCESS [  7.716 s]
[INFO] Flink : Connectors : SQL : Hive 3.1.2 .............. SUCCESS [  8.251 s]
[INFO] Flink : Connectors : SQL : Kafka ................... SUCCESS [  1.775 s]
[INFO] Flink : Connectors : SQL : Kinesis ................. SUCCESS [ 14.535 s]
[INFO] Flink : Formats : Avro confluent registry .......... SUCCESS [  0.706 s]
[INFO] Flink : Formats : Sequence file .................... SUCCESS [  1.156 s]
[INFO] Flink : Formats : Compress ......................... SUCCESS [  1.605 s]
[INFO] Flink : Formats : SQL Orc .......................... SUCCESS [  0.595 s]
[INFO] Flink : Formats : SQL Parquet ...................... SUCCESS [  1.443 s]
[INFO] Flink : Formats : SQL Avro ......................... SUCCESS [  2.421 s]
[INFO] Flink : Formats : SQL Avro Confluent Registry ...... SUCCESS [  1.458 s]
[INFO] Flink : Examples : Streaming ....................... SUCCESS [ 25.561 s]
[INFO] Flink : Examples : Table ........................... SUCCESS [ 22.520 s]
[INFO] Flink : Examples : Build Helper : .................. SUCCESS [  0.131 s]
[INFO] Flink : Examples : Build Helper : Streaming Twitter  SUCCESS [  1.148 s]
[INFO] Flink : Examples : Build Helper : Streaming State machine SUCCESS [  0.959 s]
[INFO] Flink : Examples : Build Helper : Streaming Google PubSub SUCCESS [  5.418 s]
[INFO] Flink : Container .................................. SUCCESS [  0.497 s]
[INFO] Flink : Queryable state : Runtime .................. SUCCESS [  2.135 s]
[INFO] Flink : Mesos ...................................... SUCCESS [ 55.373 s]
[INFO] Flink : Kubernetes ................................. SUCCESS [ 14.706 s]
[INFO] Flink : Yarn ....................................... SUCCESS [  5.792 s]
[INFO] Flink : Libraries : Gelly .......................... SUCCESS [  7.335 s]
[INFO] Flink : Libraries : Gelly scala .................... SUCCESS [ 23.046 s]
[INFO] Flink : Libraries : Gelly Examples ................. SUCCESS [ 13.854 s]
[INFO] Flink : External resources : ....................... SUCCESS [  0.354 s]
[INFO] Flink : External resources : GPU ................... SUCCESS [  0.389 s]
[INFO] Flink : Metrics : Dropwizard ....................... SUCCESS [  0.647 s]
[INFO] Flink : Metrics : Graphite ......................... SUCCESS [  0.361 s]
[INFO] Flink : Metrics : InfluxDB ......................... SUCCESS [  0.871 s]
[INFO] Flink : Metrics : Prometheus ....................... SUCCESS [  0.574 s]
[INFO] Flink : Metrics : StatsD ........................... SUCCESS [  0.469 s]
[INFO] Flink : Metrics : Datadog .......................... SUCCESS [  0.998 s]
[INFO] Flink : Metrics : Slf4j ............................ SUCCESS [  0.560 s]
[INFO] Flink : Libraries : CEP Scala ...................... SUCCESS [ 14.117 s]
[INFO] Flink : Table : Uber ............................... SUCCESS [  6.573 s]
[INFO] Flink : Table : Uber Blink ......................... SUCCESS [ 15.065 s]
[INFO] Flink : Python ..................................... SUCCESS [ 22.271 s]
[INFO] Flink : Table : SQL Client ......................... SUCCESS [  2.600 s]
[INFO] Flink : Libraries : State processor API ............ SUCCESS [  3.170 s]
[INFO] Flink : ML : ....................................... SUCCESS [  0.496 s]
[INFO] Flink : ML : API ................................... SUCCESS [  0.478 s]
[INFO] Flink : ML : Lib ................................... SUCCESS [  0.751 s]
[INFO] Flink : ML : Uber .................................. SUCCESS [  0.140 s]
[INFO] Flink : Dist ....................................... SUCCESS [ 16.954 s]
[INFO] Flink : Yarn Tests ................................. SUCCESS [  4.947 s]
[INFO] Flink : E2E Tests : ................................ SUCCESS [  0.754 s]
[INFO] Flink : E2E Tests : CLI ............................ SUCCESS [  0.372 s]
[INFO] Flink : E2E Tests : Parent Child classloading program SUCCESS [  0.336 s]
[INFO] Flink : E2E Tests : Parent Child classloading lib-package SUCCESS [  0.305 s]
[INFO] Flink : E2E Tests : Dataset allround ............... SUCCESS [  0.402 s]
[INFO] Flink : E2E Tests : Dataset Fine-grained recovery .. SUCCESS [  0.284 s]
[INFO] Flink : E2E Tests : Datastream allround ............ SUCCESS [  1.217 s]
[INFO] Flink : E2E Tests : Batch SQL ...................... SUCCESS [  0.416 s]
[INFO] Flink : E2E Tests : Stream SQL ..................... SUCCESS [  0.368 s]
[INFO] Flink : E2E Tests : Distributed cache via blob ..... SUCCESS [  0.267 s]
[INFO] Flink : E2E Tests : High parallelism iterations .... SUCCESS [  8.728 s]
[INFO] Flink : E2E Tests : Stream stateful job upgrade .... SUCCESS [  1.735 s]
[INFO] Flink : E2E Tests : Queryable state ................ SUCCESS [  2.586 s]
[INFO] Flink : E2E Tests : Local recovery and allocation .. SUCCESS [  0.543 s]
[INFO] Flink : E2E Tests : Elasticsearch 5 ................ SUCCESS [  7.977 s]
[INFO] Flink : E2E Tests : Elasticsearch 6 ................ SUCCESS [  3.883 s]
[INFO] Flink : Quickstart : ............................... SUCCESS [  1.005 s]
[INFO] Flink : Quickstart : Java .......................... SUCCESS [  0.613 s]
[INFO] Flink : Quickstart : Scala ......................... SUCCESS [  0.596 s]
[INFO] Flink : E2E Tests : Quickstart ..................... SUCCESS [  0.721 s]
[INFO] Flink : E2E Tests : Confluent schema registry ...... SUCCESS [  3.268 s]
[INFO] Flink : E2E Tests : Stream state TTL ............... SUCCESS [  5.382 s]
[INFO] Flink : E2E Tests : SQL client ..................... SUCCESS [  1.113 s]
[INFO] Flink : E2E Tests : File sink ...................... SUCCESS [  1.159 s]
[INFO] Flink : E2E Tests : State evolution ................ SUCCESS [  0.873 s]
[INFO] Flink : E2E Tests : RocksDB state memory control ... SUCCESS [  0.941 s]
[INFO] Flink : E2E Tests : Common ......................... SUCCESS [  1.133 s]
[INFO] Flink : E2E Tests : Metrics availability ........... SUCCESS [  0.377 s]
[INFO] Flink : E2E Tests : Metrics reporter prometheus .... SUCCESS [  0.368 s]
[INFO] Flink : E2E Tests : Heavy deployment ............... SUCCESS [  8.554 s]
[INFO] Flink : E2E Tests : Connectors : Google PubSub ..... SUCCESS [  1.100 s]
[INFO] Flink : E2E Tests : Streaming Kafka base ........... SUCCESS [  0.463 s]
[INFO] Flink : E2E Tests : Streaming Kafka ................ SUCCESS [  7.656 s]
[INFO] Flink : E2E Tests : Plugins : ...................... SUCCESS [  0.151 s]
[INFO] Flink : E2E Tests : Plugins : Dummy fs ............. SUCCESS [  0.165 s]
[INFO] Flink : E2E Tests : Plugins : Another dummy fs ..... SUCCESS [  0.201 s]
[INFO] Flink : E2E Tests : TPCH ........................... SUCCESS [  0.785 s]
[INFO] Flink : E2E Tests : Streaming Kinesis .............. SUCCESS [ 15.769 s]
[INFO] Flink : E2E Tests : Elasticsearch 7 ................ SUCCESS [  4.163 s]
[INFO] Flink : E2E Tests : Common Kafka ................... SUCCESS [  0.470 s]
[INFO] Flink : E2E Tests : TPCDS .......................... SUCCESS [  0.767 s]
[INFO] Flink : E2E Tests : Netty shuffle memory control ... SUCCESS [  0.278 s]
[INFO] Flink : E2E Tests : Python ......................... SUCCESS [  7.648 s]
[INFO] Flink : E2E Tests : HBase .......................... SUCCESS [  3.298 s]
[INFO] Flink : State backends : Heap spillable ............ SUCCESS [  0.819 s]
[INFO] Flink : Contrib : .................................. SUCCESS [  0.203 s]
[INFO] Flink : Contrib : Connectors : Wikiedits ........... SUCCESS [  0.972 s]
[INFO] Flink : FileSystems : Tests ........................ SUCCESS [  2.132 s]
[INFO] Flink : Docs ....................................... SUCCESS [  4.842 s]
[INFO] Flink : Walkthrough : .............................. SUCCESS [  0.994 s]
[INFO] Flink : Walkthrough : Common ....................... SUCCESS [  0.597 s]
[INFO] Flink : Walkthrough : Datastream Java .............. SUCCESS [  0.582 s]
[INFO] Flink : Walkthrough : Datastream Scala ............. SUCCESS [  0.544 s]
[INFO] Flink : Tools : CI : Java .......................... SUCCESS [  1.666 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  11:32 min (Wall Clock)
[INFO] Finished at: 2021-09-25T23:03:57+08:00
[INFO] ------------------------------------------------------------------------
```

