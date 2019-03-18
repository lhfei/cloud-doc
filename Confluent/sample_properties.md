## unwrap

```json
{
    "name": "mysql-source-demo-orders",
    "config": {
        "connector.class": "io.debezium.connector.mysql.MySqlConnector",
        "tasks.max": "1",
        "database.hostname": "10.182.93.72",
        "database.port": "3306",
        "database.user": "root",
        "database.password": "Lhfeilaile@01",
        "database.server.id": "211",
        "database.server.name": "mysql-server-1",
        "database.whitelist": "kafka_conn",
        "database.history.kafka.bootstrap.servers": "authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092",
        "database.history.kafka.topic": "mysql-source-orders"
    }
}
```



```json
{
  "name": "mysql-source-demo-orders",
  "config": {
    "database.hostname": "10.182.93.72",
    "database.whitelist": "kafka_conn",
    "table.whitelist": "",
    "database.server.name": "mysql-211",
    "database.server.id": "211",
    "database.password": "Debezium_1473",
    "database.user": "debezium",
    "database.port": "3306",
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "database.history.kafka.bootstrap.servers": "authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092",
    "database.history.kafka.topic": "mysql-211.kafka_conn",
    "include.schema.changes": "true",
    "transforms": "unwrap,InsertTopic,InsertSourceDetails",
    "transforms.unwrap.type": "io.debezium.transforms.UnwrapFromEnvelope",
    "transforms.InsertTopic.type": "org.apache.kafka.connect.transforms.InsertField$Value",
    "transforms.InsertSourceDetails.type": "org.apache.kafka.connect.transforms.InsertField$Value",
    "transforms.InsertTopic.topic.field": "messagetopic",
    "transforms.InsertSourceDetails.static.field": "messagesource",
    "transforms.InsertSourceDetails.static.value": "Debezium CDC from MySQL"
  }
}
```



## route
```json
{
    "name": "mysql-source-demo-orders",
    "config": {
        "connector.class": "io.debezium.connector.mysql.MySqlConnector",
        "tasks.max": "1",
        "database.hostname": "10.182.93.72",
        "database.port": "3306",
        "database.user": "debezium",
        "database.password": "Debezium_1473",
        "database.server.id": "211",
        "database.server.name": "mysql-211",
        "database.whitelist": "kafka_conn",
        "database.history.kafka.bootstrap.servers": "authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092",
        "database.history.kafka.topic": "mysql-211.kafka_conn",
        "transforms": "route",
        "transforms.route.type": "org.apache.kafka.connect.transforms.RegexRouter",
        "transforms.route.regex": "(.+)\.(.+)\.(.+)",
        "transforms.route.replacement": "$1.$2.$3"
    }
}
```



```json
{
  "name": "mysql-source-demo-orders",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "database.hostname": "10.182.93.72",
    "database.whitelist": "kafka_conn",
    "database.server.name": "mysql-server-211",
    "database.server.id": "211",
    "database.password": "Debezium_1473",
    "database.user": "debezium",
    "database.port": "3306",
    "database.history.kafka.bootstrap.servers": "authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092",
    "database.history.kafka.topic": "mysql-server-211.kafka_conn",
    "include.schema.changes": "true",
    "transforms": "unwrap,changetopic",
    "transforms.unwrap.type": "io.debezium.transforms.UnwrapFromEnvelope",
    "transforms.changetopic.type":"org.apache.kafka.connect.transforms.RegexRouter",
    "transforms.changetopic.regex":"(.*)",
    "transforms.changetopic.replacement":"$1-smt"
  }
}
```



