Socket Server Settings
======================

>Step 1: Download the code

```sh
>tar -xzf kafka_2.10-0.8.2.0.tgz
# add KAFKA_HOME to path:
```

>Step 2: Start the server

```sh
#optional: start zookeeper server
>bin/zookeeper-server-start.sh config/zookeeper.properties &

>bin/kafka-server-start.sh config/server.properties &

```

> Step 3: Create a topic

```sh
>bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
>bin/kafka-topics.sh --list --zookeeper localhost:2181
```
>Step 4: Send some messages

```sh
>bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
```

>Step 5: Start a consumer

```sh
>bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
```





### Cluster setting



#### Cluster Nodes

```ini
11.10.1.1	node1
11.10.1.2	node2
11.10.1.3	node3
```



### Kafka Configuration

> node1

```ini
broker.id=0
log.dirs=/tmp/kafka-logs-1
port=9093
advertised.host.name = localhost
zookeeper.connect=node1:2181,node2:2182,node3:2183
```

> node2

```ini
broker.id=1
log.dirs=/tmp/kafka-logs-1
port=9093
advertised.host.name = localhost
zookeeper.connect=node1:2181,node2:2182,node3:2183
```

> node3

```ini
broker.id=2
log.dirs=/tmp/kafka-logs-1
port=9093
advertised.host.name = localhost
zookeeper.connect=node1:2181,node2:2182,node3:2183
```


























































































