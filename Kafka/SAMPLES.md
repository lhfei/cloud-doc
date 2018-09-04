
```
$>bin/kafka-server-start.sh config/server.properties

$>bin/kafka-topics.sh --create --zookeeper master1.cloud.cn:2181 --replication-factor 1 --partitions 1 --topic ai-predict

 -----------------------------
 Created topic "ai-predict".

$>bin/kafka-topics.sh --list --zookeeper master1.cloud.cn:2181
 -----------------------------
 ai-predict
 


# send message
$>bin/kafka-console-producer.sh --broker-list master1.cloud.cn:9092 --topic ai-predict


# Start a consumer

$>bin/kafka-console-consumer.sh --bootstrap-server master1.cloud.cn:9092 --topic ai-predict --from-beginning

```

