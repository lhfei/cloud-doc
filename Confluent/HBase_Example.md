

## Sink



### Configure Data Sink Properties

Navegate to `etc/kafka-connect-hbase/sink-quickstart-hbase.properties`

```ini
name=kafka-cdc-hbase
connector.class=io.svectors.hbase.sink.HBaseSinkConnector
tasks.max=1
topics=mysql-211.kafka_conn.orders
zookeeper.quorum=host-10-182-61-102,host-10-182-60-250,host-10-182-60-239
event.parser.class=io.svectors.hbase.parser.AvroEventParser
hbase.mysql-211.kafka_conn.orders.rowkey.columns=id
hbase.mysql-211.kafka_conn.orders.rowkey.delimiter=|
hbase.mysql-211.kafka_conn.orders.family=base
hbase.mysql-211.kafka_conn.orders.base.columns=product, quantity, price
```



### Load `mysql-sink` Connector

On Kafka-connect node,`10.182.93.75:8083`

```sh
cd $CONFLUENT_HOME

confluent load kafka-cdc-hbase -d etc/kafka-connect-hbase/sink-quickstart-hbase.properties 

-----------------------------------------
{
  "type": null,
  "tasks": [],
  "config": {
    "name": "kafka-cdc-hbase",
    "hbase.mysql-211.kafka_conn.orders.family": "base",
    "hbase.mysql-211.kafka_conn.orders.base.columns": "product,quantity,price",
    "connector.class": "io.svectors.hbase.sink.HBaseSinkConnector",
    "tasks.max": "1",
    "topics": "mysql-211.kafka_conn.orders",
    "zookeeper.quorum": "host-10-182-61-102,host-10-182-60-250,host-10-182-60-239",
    "event.parser.class": "io.svectors.hbase.parser.AvroEventParser",
    "hbase.mysql-211.kafka_conn.orders.rowkey.columns": "id",
    "hbase.mysql-211.kafka_conn.orders.rowkey.delimiter": "|"
  },
  "name": "kafka-cdc-hbase"
}
```



Validate it by `curl` on  host`10.182.93.75`

```sh
curl -s http://10.182.93.75:8083/connectors
["kafka-cdc-hbase"]
```



### Producer a record into the `mysql-employees` topic

Next, navigate to schema-registry-server[10.182.93.73] and start the Avro console producer to import a few records to Kafka:

```sh
./bin/kafka-avro-console-producer --broker-list authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092 --topic mysql-211.kafka_conn.orders \
    --property value.schema='{"type":"record","name":"Envelope","fields":[{"name":"product","type":"string"},{"name":"quantity","type":"int"},{"name":"price","type":"double"},{"name":"id","type":"string"}]}'
```



Then in the console producer, type in:

```json
{"product": "Clothes", "quantity": 700, "price": 700, "id": "PK_700"}
{"product": "Clothes", "quantity": 701, "price": 701, "id": "PK_701"}
{"product": "Clothes", "quantity": 702, "price": 702, "id": "PK_702"}
{"product": "Clothes", "quantity": 703, "price": 703, "id": "PK_703"}
{"product": "Clothes", "quantity": 704, "price": 704, "id": "PK_704"}
{"product": "Clothes", "quantity": 705, "price": 705, "id": "PK_705"}
{"product": "Clothes", "quantity": 706, "price": 706, "id": "PK_706"}
{"product": "Clothes", "quantity": 707, "price": 707, "id": "PK_707"}
{"product": "Clothes", "quantity": 708, "price": 708, "id": "PK_708"}
{"product": "Clothes", "quantity": 709, "price": 709, "id": "PK_709"}
```

The three records entered are published to the Kafka topic test_hdfs in Avro format.

```sh
./bin/kafka-avro-console-consumer --bootstrap-server authserve-23119819:9092,authserve-519d7886:9092,authserve-d0f49892:9092,authserve-ed0ad87d:9092  --topic mysql-211.kafka_conn.orders --from-beginning
```

