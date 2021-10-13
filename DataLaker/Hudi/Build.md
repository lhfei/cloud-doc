

```shell
mvn clean package -DskipTests -Dscala-2.12 -Dhadoop.version=3.1.1 -Dcheckstyle.skip=true
```



### 1. Prepare

1. https://packages.confluent.io/maven/io/confluent/kafka-schema-registry-client/5.3.4/kafka-schema-registry-client-5.3.4.jar

   ```shell
   mvn install:install-file -Dfile=./kafka-schema-registry-client-5.3.4.jar -DgroupId=io.confluent -DartifactId=kafka-schema-registry-client -Dversion=5.3.4 -Dpackaging=jar
   ```

2. https://packages.confluent.io/maven/io/confluent/kafka-avro-serializer/5.3.4/kafka-avro-serializer-5.3.4.jar

   ```shell
   mvn install:install-file -Dfile=./kafka-avro-serializer-5.3.4.jar -DgroupId=io.confluent -DartifactId=kafka-avro-serializer -Dversion=5.3.4 -Dpackaging=jar
   ```

   

3. https://packages.confluent.io/maven/io/confluent/common-config/5.3.4/common-config-5.3.4.jar

   ```shell
   mvn install:install-file -Dfile=./common-config-5.3.4.jar -DgroupId=io.confluent -DartifactId=common-config -Dversion=5.3.4 -Dpackaging=jar
   ```

   

4. https://packages.confluent.io/maven/io/confluent/common-utils/5.3.4/common-utils-5.3.4.jar

   ```shell
   mvn install:install-file -Dfile=./common-utils-5.3.4.jar -DgroupId=io.confluent -DartifactId=common-utils -Dversion=5.3.4 -Dpackaging=jar
   ```

   

5. ...



### 2. Build Source

```shell
mvn clean install -DskipTests=true -Dfast -T5 -Dmaven.compile.fork=true  -Dscala-2.12 -Dhadoop.version=3.1.1 -Dcheckstyle.skip=true -Dhive.version=3.1.0 -Dflink.version=1.12.2
```



```ini
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for Hudi 0.9.0:
[INFO] 
[INFO] Hudi ............................................... SUCCESS [  1.381 s]
[INFO] hudi-common ........................................ SUCCESS [  8.419 s]
[INFO] hudi-timeline-service .............................. SUCCESS [  4.160 s]
[INFO] hudi-client ........................................ SUCCESS [  0.074 s]
[INFO] hudi-client-common ................................. SUCCESS [ 15.335 s]
[INFO] hudi-hadoop-mr ..................................... SUCCESS [  6.689 s]
[INFO] hudi-spark-client .................................. SUCCESS [ 20.938 s]
[INFO] hudi-sync-common ................................... SUCCESS [  3.159 s]
[INFO] hudi-hive-sync ..................................... SUCCESS [ 10.370 s]
[INFO] hudi-spark-datasource .............................. SUCCESS [  0.070 s]
[INFO] hudi-spark-common_2.12 ............................. SUCCESS [ 11.684 s]
[INFO] hudi-spark2_2.12 ................................... SUCCESS [ 18.903 s]
[INFO] hudi-spark_2.12 .................................... SUCCESS [ 33.248 s]
[INFO] hudi-utilities_2.12 ................................ SUCCESS [  6.488 s]
[INFO] hudi-utilities-bundle_2.12 ......................... SUCCESS [ 15.698 s]
[INFO] hudi-cli ........................................... SUCCESS [ 16.810 s]
[INFO] hudi-java-client ................................... SUCCESS [  6.858 s]
[INFO] hudi-flink-client .................................. SUCCESS [ 17.330 s]
[INFO] hudi-spark3_2.12 ................................... SUCCESS [ 14.276 s]
[INFO] hudi-dla-sync ...................................... SUCCESS [  4.554 s]
[INFO] hudi-sync .......................................... SUCCESS [  0.057 s]
[INFO] hudi-hadoop-mr-bundle .............................. SUCCESS [ 12.231 s]
[INFO] hudi-hive-sync-bundle .............................. SUCCESS [  5.610 s]
[INFO] hudi-spark-bundle_2.12 ............................. SUCCESS [ 14.380 s]
[INFO] hudi-presto-bundle ................................. SUCCESS [ 10.636 s]
[INFO] hudi-timeline-server-bundle ........................ SUCCESS [ 11.848 s]
[INFO] hudi-hadoop-docker ................................. SUCCESS [  2.895 s]
[INFO] hudi-hadoop-base-docker ............................ SUCCESS [  3.675 s]
[INFO] hudi-hadoop-namenode-docker ........................ SUCCESS [  3.409 s]
[INFO] hudi-hadoop-datanode-docker ........................ SUCCESS [  3.415 s]
[INFO] hudi-hadoop-history-docker ......................... SUCCESS [  3.375 s]
[INFO] hudi-hadoop-hive-docker ............................ SUCCESS [  4.078 s]
[INFO] hudi-hadoop-sparkbase-docker ....................... SUCCESS [  3.250 s]
[INFO] hudi-hadoop-sparkmaster-docker ..................... SUCCESS [  2.809 s]
[INFO] hudi-hadoop-sparkworker-docker ..................... SUCCESS [  3.040 s]
[INFO] hudi-hadoop-sparkadhoc-docker ...................... SUCCESS [  3.122 s]
[INFO] hudi-hadoop-presto-docker .......................... SUCCESS [  3.198 s]
[INFO] hudi-integ-test .................................... SUCCESS [ 14.986 s]
[INFO] hudi-integ-test-bundle ............................. SUCCESS [ 35.208 s]
[INFO] hudi-examples ...................................... SUCCESS [  7.703 s]
[INFO] hudi-flink_2.12 .................................... SUCCESS [  6.078 s]
[INFO] hudi-flink-bundle_2.12 ............................. SUCCESS [ 23.386 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  03:08 min (Wall Clock)
[INFO] Finished at: 2021-09-25T17:45:45+08:00
[INFO] ------------------------------------------------------------------------
```

