### Build

```shell
git https://github.com/confluentinc/ksql.git

# get the latest release version
git checkout -b v7.0.0 v7.0.0

# build from source
mvn clean package -e -DskipTests
```



```ini
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for ksqldb-parent 7.0.0:
[INFO] 
[INFO] ksqldb-parent ...................................... SUCCESS [  2.867 s]
[INFO] ksqldb-test-util ................................... SUCCESS [ 16.823 s]
[INFO] ksqldb-udf ......................................... SUCCESS [ 12.681 s]
[INFO] ksqldb-common ...................................... SUCCESS [ 18.509 s]
[INFO] ksqlDB UDF / UDAF :: Quickstart .................... SUCCESS [ 11.083 s]
[INFO] ksqldb-serde ....................................... SUCCESS [ 15.058 s]
[INFO] ksqldb-engine-common ............................... SUCCESS [ 11.950 s]
[INFO] ksqldb-rest-model .................................. SUCCESS [ 14.076 s]
[INFO] ksqldb-execution ................................... SUCCESS [ 18.473 s]
[INFO] ksqldb-metastore ................................... SUCCESS [ 14.814 s]
[INFO] ksqldb-parser ...................................... SUCCESS [ 13.060 s]
[INFO] ksqldb-streams ..................................... SUCCESS [ 21.286 s]
[INFO] ksqldb-engine ...................................... SUCCESS [ 38.842 s]
[INFO] ksqldb-rest-client ................................. SUCCESS [ 15.620 s]
[INFO] ksqldb-version-metrics-client ...................... SUCCESS [ 17.770 s]
[INFO] ksqldb-rest-app .................................... SUCCESS [ 56.670 s]
[INFO] ksqldb-api-client .................................. SUCCESS [ 13.896 s]
[INFO] ksqldb-tools ....................................... SUCCESS [ 31.554 s]
[INFO] ksqldb-cli ......................................... SUCCESS [ 35.710 s]
[INFO] ksqldb-examples .................................... SUCCESS [ 33.338 s]
[INFO] ksqldb-console-scripts ............................. SUCCESS [  0.075 s]
[INFO] ksqldb-etc ......................................... SUCCESS [  0.065 s]
[INFO] ksqldb-functional-tests ............................ SUCCESS [ 44.008 s]
[INFO] ksqldb-package ..................................... SUCCESS [  8.299 s]
[INFO] ksqldb-benchmark ................................... SUCCESS [ 40.723 s]
[INFO] ksqlDB RocksDB Config Setter ....................... SUCCESS [ 11.808 s]
[INFO] ksqldb-docker ...................................... SUCCESS [ 10.202 s]
[INFO] ksqldb-api-reactive-streams-tck .................... SUCCESS [  9.281 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  08:59 min
[INFO] Finished at: 2021-11-06T20:44:14+08:00
[INFO] ------------------------------------------------------------------------
```

