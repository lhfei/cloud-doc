

### Kafka Broker

```
listeners: PLAINTEXT://localhost:6667
```





```
host-10-182-61-102:2181,host-10-182-60-250:2181,host-10-182-60-239:2181


bin/kafka-topics.sh --create --zookeeper host-10-182-61-102:2181,host-10-182-60-250:2181,host-10-182-60-239:2181 --replication-factor 1 --partitions 1 --topic kafka-benchmark


====
ATLAS_ENTITIES
ATLAS_HOOK
__consumer_offsets
ad-events
ambari_kafka_service_check
kafka-benchmark
====

## send msg
bin/kafka-console-producer.sh --broker-list host-10-182-75-167:6667,host-10-182-75-169:6667,host-10-182-75-176:6667,host-10-182-75-181:6667 --topic kafka-benchmark



## received msg
bin/kafka-console-consumer.sh --bootstrap-server host-10-182-75-167:6667,host-10-182-75-169:6667,host-10-182-75-176:6667,host-10-182-75-181:6667 --topic kafka-benchmark --from-beginning
```

