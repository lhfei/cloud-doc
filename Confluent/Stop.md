

### Stop Services



#### Safety

```sh
${CONFLUENT_HOME}/bin/zookeeper-server-stop ${CONFLUENT_HOME}/etc/kafka/zookeeper.properties
```



```sh
${CONFLUENT_HOME}/bin/kafka-server-stop ${CONFLUENT_HOME}/etc/kafka/server.properties
```



```sh
${CONFLUENT_HOME}/bin/schema-registry-stop ${CONFLUENT_HOME}/etc/schema-registry/schema-registry.properties


${CONFLUENT_HOME}/bin/control-center-stop ${CONFLUENT_HOME}/etc/confluent-control-center/control-center.properties

${CONFLUENT_HOME}/bin/kafka-rest-stop ${CONFLUENT_HOME}/etc/kafka-rest/kafka-rest.properties


${CONFLUENT_HOME}/bin/ksql-server-stop ${CONFLUENT_HOME}/etc/ksql/ksql-server.properties
```



#### quickly

```sh
s_ports=(2181 9021 9092 8081 8082 8083 8088); for s_port in ${s_ports[@]:0}; do for pid in `lsof -i :$s_port | awk '{print $2}'` ; do kill -9 $pid ; done; done;

rm -rf /export/app_data/confluent-control-center/*

rm -rf /export/app_data/zookeeper/version-*

rm -rf /tmp/kafka-logs/*

rm -rf ${CONFLUENT_HOME}/logs/*

confluent destroy
```



### Clean Data

> Clean CP Data

The Confluent Control Center data dir in `etc/confluent-control-center/control-center.properties`

```sh
rm -rf /export/app_data/confluent-control-center/*
```



> Clean Zookeeper data



```sh
rm -rf /export/app_data/zookeeper/version-*
```



> Clean Kafka data

```sh
rm -rf /tmp/kafka-logs/*
```



> Clean Confluent Platform logs

```sh
rm -rf ${CONFLUENT_HOME}/logs/*
```



```sh
confluent destroy
```

