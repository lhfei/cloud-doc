### 1. Zookeeper

> Start

```shell
./bin/zookeeper-server-start  ./etc/kafka/zookeeper.properties &
```

> Stop

```shell
./bin/zookeeper-server-stop  ./etc/kafka/zookeeper.properties
```



### 2. Kafka

> Start

```shell
./bin/kafka-server-start ./etc/kafka/server.properties &
```

> Stop

```shell
./bin/kafka-server-stop ./etc/kafka/server.properties
```



### 3. Schema Registry

> Start

```shell
./bin/schema-registry-start ./etc/schema-registry/schema-registry.properties &
```

> Stop

```shell
./bin/schema-registry-stop ./etc/schema-registry/schema-registry.properties
```



### 4. Control Center

> Start

```shell
./bin/control-center-start ./etc/confluent-control-center/control-center-production.properties &
```

> Stop

```shell
./bin/control-center-stop ./etc/confluent-control-center/control-center-production.properties
```



### 5. Kafka Connect

> Start

```shell
./bin/connect-distributed ./etc/schema-registry/connect-avro-distributed.properties &
```

> Stop

```shell

```



### 6 Confluent REST Proxy

> Start

```shell
./bin/kafka-rest-start ./etc/kafka-rest/kafka-rest.properties &
```

> Stop

```shell
./bin/kafka-rest-stop ./etc/kafka-rest/kafka-rest.properties
```



### 7 KsqlDB

> Start

```shell
./bin/ksql-server-start ./etc/ksqldb/ksql-server.properties &
```

> Stop

```shell
./bin/ksql-server-stop ./etc/ksqldb/ksql-server.properties
```



