Delete Topic

```shell
./bin/kafka-topics.sh --delete --topic trades --bootstrap-server 11.91.142.3:9092,11.91.142.4:9092,11.91.142.5:9092
```

```shell
./bin/kafka-configs.sh --zookeeper 11.91.142.3:2181,11.91.142.4:2181,11.91.142.5:2181 --alter --entity-type topics --add-config retention.ms=1000 --entity-name trades
```





#### Create Topic

```shell
./bin/kafka-topics.sh --create --replication-factor 1 --partitions 4 --topic trades --bootstrap-server 11.91.142.3:9092,11.91.142.4:9092,11.91.142.5:9092
```





### List Topics

```shell
./bin/kafka-topics.sh --list --bootstrap-server 11.91.142.3:9092,11.91.142.4:9092,11.91.142.5:9092
```





```shell
bin/kafka-console-producer.sh --broker-list 11.91.142.3:9092,11.91.142.4:9092,11.91.142.5:9092 --topic lhfei
```



```shell
bin/kafka-console-consumer.sh --bootstrap-server 11.91.142.3:9092,11.91.142.4:9092,11.91.142.5:9092 --topic lhfei --from-beginning
```

