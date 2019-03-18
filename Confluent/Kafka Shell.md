

### List Topics

```sh
${CONFLUENT_HOME}/bin/kafka-topics --list --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181
```



### Delete Topic

```sh
${CONFLUENT_HOME}/bin/kafka-topics --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181 --delete --topic mysql-source-orders
```



### Create a Topic

```sh
${CONFLUENT_HOME}/bin/kafka-topics --create --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181 \
--replication-factor 1 --partitions 1 --topic mysql-source-orders
```

