



### Install 



### MySQL

The MySQL server must be configured to use a *row-level* binary log, which is described in more detail in the [MySQL documentation](http://dev.mysql.com/doc/refman/5.7/en/replication-options.html). This is most often done in the MySQL server configuration file, and will look similar to the following fragment:

```ini
server-id         = 211
log_bin           = mysql-bin
binlog_format     = row
binlog_row_image  = full
expire_logs_days  = 10
```

where:

- the value for [`server-id`](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_server_id) must be unique for each server and replication client within the MySQL cluster. When we set up the connector, we’ll also assign the connector a unique server ID.
- the value for [`log_bin`](http://dev.mysql.com/doc/refman/5.7/en/replication-options-binary-log.html#sysvar_log_bin) is the base name for the sequence of binlog files.
- the value for [`binlog_format`](http://dev.mysql.com/doc/refman/5.7/en/replication-options-binary-log.html#sysvar_binlog_format) must be set to `row` or `ROW`.
- the value for [`binlog_row_image`](https://dev.mysql.com/doc/refman/5.7/en/replication-options-binary-log.html#sysvar_binlog_row_image) must be set to `full` or `FULL`.
- the value for [`expire_log_days`](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_expire_logs_days) is the number of days for automatic binary log file removal. The default is 0, which means "no automatic removal," so be sure to set a value that is appropriate for your environment.



Create a user for connector:

```sql
CREATE USER 'debezium'@'localhost' IDENTIFIED BY 'Debezium_1473';

GRANT ALL ON kafka_conn.* TO 'debezium'@'10.182.93.72' IDENTIFIED BY 'Debezium_1473';
GRANT ALL ON kafka_conn.* TO 'debezium'@'%' IDENTIFIED BY 'Debezium_1473';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'debezium' IDENTIFIED BY 'Debezium_1473';

FLUSH PRIVILEGES;
```



### Install your connector

Use the [Confluent Hub client](https://docs.confluent.io/current/confluent-hub/client.html) to install this connector with:

```sh
confluent-hub install debezium/debezium-connector-mysql:0.8.3
```

Or download the ZIP file and extract it into one of the directories that is listed on the Connect worker's plugin.path configuration properties. This must be done on each of the installations where Connect will be run. See [here](https://docs.confluent.io/current/connect/userguide.html#installing-plugins) for more detailed instructions.

Edit file `etc/debezium-connector-mysql/quickstart-mysql.properties `

```ini
{
  "name": "mysql-source-demo-orders",
  "config": {
    "database.hostname": "10.182.93.72",
    "database.whitelist": "kafka_conn",
    "table.whitelist": "",
    "database.server.name": "mysql-server-211",
    "database.server.id": "211",
    "database.password": "Debezium_1473",
    "database.user": "debezium",
    "database.port": "3306",
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "database.history.kafka.bootstrap.servers": "authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092",
    "database.history.kafka.topic": "dbhistory.mysql-server-1",
    "include.schema.changes": "true",
	"transforms.InsertSourceDetails.static.value": "Debezium CDC from MySQL on asgard",
    "transforms.InsertSourceDetails.static.field": "messagesource",
    "transforms": "unwrap,InsertTopic,InsertSourceDetails",
    "transforms.unwrap.type": "io.debezium.transforms.UnwrapFromEnvelope",
    "transforms.InsertTopic.type": "org.apache.kafka.connect.transforms.InsertField$Value",
    "transforms.InsertTopic.topic.field": "messagetopic",
    "transforms.InsertSourceDetails.type": "org.apache.kafka.connect.transforms.InsertField$Value"
  }
}
```





```sh
curl -X POST -H "Content-Type: application/json" --data @etc/debezium-connector-mysql/quickstart-mysql.properties http://10.182.93.75:8083/connectors
```



```sh
./bin/confluent load mysql-source-demo-orders -d etc/debezium-connector-mysql/quickstart-mysql.properties 

--------------------------------------------------------------
This CLI is intended for development only, not for production
https://docs.confluent.io/current/cli/index.html
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
        "transforms.changetopic.type": "org.apache.kafka.connect.transforms.RegexRouter",
        "transforms.changetopic.regex": "(.*)",
        "transforms.changetopic.replacement": "$1-smt",
        "name": "mysql-source-demo-orders"
    },
    "tasks": [],
    "type": null
}
```



Check topic if auto created:

```sh
${CONFLUENT_HOME}/bin/kafka-topics --list --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181
```



And output like this:

```ini
... ...
mysql-server-211-smt
mysql-server-211.kafka_conn
mysql-server-211.kafka_conn.orders-smt
```





```sh
./bin/kafka-avro-console-consumer --bootstrap-server authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092  --topic mysql-server-211.kafka_conn.orders --from-beginning
```





```sql
insert into orders (product, quantity, price, id) values ('Clothes', 700, 700, 700);
insert into orders (product, quantity, price, id) values ('Clothes', 701, 701, 701);
insert into orders (product, quantity, price, id) values ('Clothes', 702, 702, 702);
insert into orders (product, quantity, price, id) values ('Clothes', 703, 703, 703);
insert into orders (product, quantity, price, id) values ('Clothes', 704, 704, 704);
insert into orders (product, quantity, price, id) values ('Clothes', 705, 705, 705);
insert into orders (product, quantity, price, id) values ('Clothes', 706, 706, 706);
insert into orders (product, quantity, price, id) values ('Clothes', 707, 707, 707);
insert into orders (product, quantity, price, id) values ('Clothes', 708, 708, 708);
insert into orders (product, quantity, price, id) values ('Clothes', 709, 709, 709);
```

