### Build

```shell
git clone https://github.com/confluentinc/schema-registry.git

# get the latest release version
git checkout -b v7.0.0 v7.0.0

# build from source
mvn clean package -e -DskipTests
```



```ini
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for kafka-schema-registry-parent 7.0.0:
[INFO] 
[INFO] kafka-schema-registry-parent ....................... SUCCESS [  3.297 s]
[INFO] kafka-schema-registry-client ....................... SUCCESS [ 14.679 s]
[INFO] kafka-json-schema-provider ......................... SUCCESS [  8.075 s]
[INFO] kafka-protobuf-types ............................... SUCCESS [  4.701 s]
[INFO] kafka-protobuf-provider ............................ SUCCESS [  9.133 s]
[INFO] kafka-schema-serializer ............................ SUCCESS [  6.931 s]
[INFO] kafka-avro-serializer .............................. SUCCESS [  5.886 s]
[INFO] kafka-schema-registry .............................. SUCCESS [ 17.673 s]
[INFO] kafka-json-serializer .............................. SUCCESS [  6.066 s]
[INFO] kafka-connect-avro-data ............................ SUCCESS [  9.914 s]
[INFO] kafka-connect-avro-converter ....................... SUCCESS [  4.991 s]
[INFO] kafka-schema-registry-package ...................... SUCCESS [ 11.227 s]
[INFO] kafka-streams-avro-serde ........................... SUCCESS [  3.069 s]
[INFO] kafka-json-schema-serializer ....................... SUCCESS [  4.239 s]
[INFO] kafka-connect-json-schema-converter ................ SUCCESS [  8.722 s]
[INFO] kafka-streams-json-schema-serde .................... SUCCESS [  2.909 s]
[INFO] kafka-protobuf-serializer .......................... SUCCESS [  7.076 s]
[INFO] kafka-connect-protobuf-converter ................... SUCCESS [  9.894 s]
[INFO] kafka-streams-protobuf-serde ....................... SUCCESS [  4.601 s]
[INFO] kafka-serde-tools-package .......................... SUCCESS [  6.749 s]
[INFO] maven-plugin ....................................... SUCCESS [  8.806 s]
[INFO] client-console-scripts ............................. SUCCESS [  0.092 s]
[INFO] schema-registry-console-scripts .................... SUCCESS [  0.066 s]
[INFO] kafka-schema-registry-benchmark .................... SUCCESS [ 18.387 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  02:57 min
[INFO] Finished at: 2021-11-06T20:40:19+08:00
[INFO] ------------------------------------------------------------------------
```

