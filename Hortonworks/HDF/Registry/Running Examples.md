## Running Kafka Example

SchemaRegistry makes it very easy to integrate with Kafka, Storm and Nifi and any other systems. We’ve an example code on how to integrate with kafka [here](https://github.com/hortonworks/registry/blob/master/examples/schema-registry/avro/src/main/java/com/hortonworks/registries/schemaregistry/examples/avro/TruckEventsKafkaAvroSerDesApp.java).

To run this example, follow the steps below

## Download and Start Apache Kafka

1. Download kafka 0.10.0.1 or higher from [here](http://kafka.apache.org/downloads).
2. $KAFKA_HOME/bin/zoookeeper-server-start.sh config/zookeeper.properties
3. $KAFKA_HOME/bin/kafka-server-start.sh config/server.properties
4. $KAFKA_HOME/bin/kafka-topics.sh –zookeeper localhost:2181 –topic truck_events_stream –partitions 1 –replication-factor 1 –create
5. $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server master1.cloud.cn:9092 --topic truck_events_stream --from-beginning

## Run producer to register schema and send data

1. cd $REGISTRY_HOME/examples/schema-registry/avro
2. To send messages to topic “truck_events_stream”

```
java -jar avro-examples-0.4.0-SNAPSHOT.jar -d data/truck_events_json -p data/kafka-producer.props -sm -s data/truck_events.avsc
```

## Kafka Producer Integration with SchemaRegistry

1. Any client integration code must make a dependency on schema-registry-serdes

```
<dependency>
  <groupId>com.hortonworks.registries</groupId>
  <artifactId>schema-registry-serdes</artifactId>
</dependency>
```

1. For KafkaProducer, user need to add the following config

```
config.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
config.putAll(SchemaRegistryClient.Configuration.SCHEMA_REGISTRY_URL.name(), props.get(SCHEMA_REGISTRY_URL));
config.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
config.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, KafkaAvroSerializer.class.getName());

```

Important settings from the above are **schema.registry.url**:

> This should be set to where the registry server is running ex: <http://localhost:9090/api/v1>

- **key.serializer**:

  *StringSerializer* is used in the above example.

- **value.serializer**:

  *com.hortonworks.registries.schemaregistry.serdes.avro.kafka.KafkaAvroSerializer* is used in the above example. This serializer has integration with schema registry. It will take the producer config and retrieves schema.registry.url and the topic name to find out the schema. If there is no schema defined it will publish a first version of that schema.

## Run consumer to retrieve schema and deserialze the messages

1. cd $REGISTRY_HOME/examples/schema-registry/avro
2. To consume messages from topic “truck_events_stream”

```
java -jar avro-examples-0.4.0-SNAPSHOT.jar -cm -c data/kafka-consumer.props
```

## Kafka Consumer Integration with SchemaRegistry

1. Any client integration code must make a dependency on schema-registry-serdes

```
<dependency>
  <groupId>com.hortonworks.registries</groupId>
  <artifactId>schema-registry-serdes</artifactId>
</dependency>

```

1. For KafkaConsumer, user need to add the following to config

```
config.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
config.putAll(SchemaRegistryClient.Configuration.SCHEMA_REGISTRY_URL.name(), props.get(SCHEMA_REGISTRY_URL));
config.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
config.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, KafkaAvroDeserializer.class.getName());

```

Important settings from the above are

- **schema.registry.url**:

  This should be set to where the registry server is running ex: <http://localhost:9090/api/v1>

- **key.serializer**:

  *StringSerializer* is used in the above example.

- **value.serializer**:

  *com.hortonworks.registries.schemaregistry.serdes.avro.kafka.KafkaAvroSerializer* is used in the above example.

This deserializer tries to find schema.id in the message paylod. If it finds schema.id, makes a call to schemaregistry to fetch the avro schema. If it doesn’t find schema.id it falls back to using topic name to fetch a schema.