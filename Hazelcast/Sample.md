# Real-time Trade Monitor

A sample dashboard which uses [Hazelcast](https://github.com/hazelcast/hazelcast)
to ingest trades from Apache Kafka into a distributed map. It also performs
an aggregation on the trades, storing the results into a separate map.

These two maps are utilized by a live dashboard which offers drill down
functionality into viewing individual trades that make up the aggregation.

## How to run:

1. Build the project

```
mvn package
```

1. Create a topic on the Kafka cluster:

```shell
./bin/kafka-topics.sh --create --replication-factor 1 --partitions 4 --topic trades --bootstrap-server data-thinker-21:9092,data-thinker-24:9092,data-thinker-25:9092
```

2. Start the Kafka producer

```
java -jar trade-producer/target/trade-producer-5.0.jar data-thinker-21:9092,data-thinker-24:9092,data-thinker-25:9092 <trades per sec>
```

3. Start the Jet cluster. To configure cluster members you can edit 
`hazelcast.yaml` in the `jet-server/src/main/resources` folder.

```
java -jar jet-server/target/jet-server-5.0.jar
```

4. Run the queries

The cluster connection can be configured inside the `hazelcast-client.yaml` file.

* Load static data into map: (Stock names)
```
java -jar trade-queries/target/trade-queries-5.0.jar load-symbols
```

* Ingest trades from Kafka

```
java -jar trade-queries/target/trade-queries-5.0.jar ingest-trades data-thinker-21:9092,data-thinker-24:9092,data-thinker-25:9092
```
* Aggregate trades by symbol
```
java -jar trade-queries/target/trade-queries-5.0.jar aggregate-query data-thinker-21:9092,data-thinker-24:9092,data-thinker-25:9092
```

5. Start the front end

The cluster connection can be configured inside the `hazelcast-client.yaml` file.

```
java -jar webapp/target/webapp-5.0.jar 
```

Browse to localhost:9000 to see the dashboard.

## How to run using Hazelcast Cloud:

1. Create an Enterprise Hazelcast cluster at https://cloud.hazelcast.com/. Please pay attention to the additional
   cluster settings: the `Public Access` option must be turned on.

2. Open client configuration window on the cluster details page and grab:
   - Cluster group name;
   - Cluster discovery token. 
   
   If during the cluster creation you've turned on TLS encryption, you should also:
     - grab Keystore and truststore password;
     - download and extract Keystore file.

3. Modify Hazelcast client configs `trade-queries/src/main/resources/hazelcast-client.yaml` and
   `webapp/src/main/resources/hazelcast-client.yaml` 

If you're not using TLS encryption for your cluster, use the following minimal working configuration:
```
hazelcast-client:
  cluster-name: <CLUSTER_GROUP_NAME>
  instance-name: query-client
  properties:
    hazelcast.client.cloud.discovery.token: "<CLUSTER_DISCOVERY_TOKEN>"
```

For a cluster with TLS encryption, copy the `client.keystore` and `client.truststore` files downloaded on the 
previous step into `trade-queries/src/main/resources` and `webapp/src/main/resources` folders, or use absolute path 
to downloaded files in your client configuration. After that you should use the following configuration:
```
hazelcast-client:
  cluster-name: <CLUSTER_GROUP_NAME>
  instance-name: query-client
  network:
    ssl:
      enabled: true
      factory-class-name: com.hazelcast.nio.ssl.BasicSSLContextFactory
      properties:
        protocol: TLSv1.2
        mutualAuthentication: REQUIRED
        keyStore: trade-queries/src/main/resources/client.keystore
        keyStorePassword: "<KEYSTORE_AND_TRUSTSTORE_PASSWORD>"
        keyStoreType: jks
        trustStore: trade-queries/src/main/resources/client.truststore
        trustStorePassword: "<KEYSTORE_AND_TRUSTSTORE_PASSWORD>"
        trustStoreType: jks
  properties:
    hazelcast.client.cloud.discovery.token: "<CLUSTER_DISCOVERY_TOKEN>"
```

4. (Only for clusters with TLS encryption). Update the `trade-queries/pom.xml` and `webapp/pom.xml` in order to use
   enterprise client library which supports TLS enterprise feature:

Before:
```
<dependency>
   <groupId>com.hazelcast</groupId>
   <artifactId>hazelcast</artifactId>
   <version>${hazelcast.version}</version>
</dependency>   
```

After:
```
<dependency>
   <groupId>com.hazelcast</groupId>
   <artifactId>hazelcast-enterprise</artifactId>
   <version>${hazelcast.version}</version>
</dependency>   
```

5. We need to have Kafka cluster that is reachable by Hazelcast Cloud nodes. For demo purposes, the easiest way is
   to create the simplest Kafka cluster at https://confluent.cloud with defaults.

6. Create topic `trades` with 4 partitions. If you use https://confluent.cloud, go to Topics section in the UI.

7. Put all kafka consumer/producer properties in `trade-producer/src/main/resources/kafka.properties` and
   `trade-queries/src/main/resources/kafka.properties`. If you use https://confluent.cloud you can find them in:
   `Data Integration > Client > New Client section`. The CLUSTER_API_KEY and CLUSTER_API_SECRET placeholders
   must be replaced with the values available at: `Data integration > API Keys`.

For the Confluent.cloud the config should look like this:
```
# Required connection configs for Kafka producer, consumer, and admin
bootstrap.servers=change-me.us-west-2.aws.confluent.cloud:9092
security.protocol=SASL_SSL
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule   required username='<CLUSTER_API_KEY>'   password='<CLUSTER_API_SECRET>';
sasl.mechanism=PLAIN
# Required for correctness in Apache Kafka clients prior to 2.6
client.dns.lookup=use_all_dns_ips

# Best practice for Kafka producer to prevent data loss
acks=all
```

8. Build the project

```
mvn package
```

9. Start the Kafka producer

```
java -jar trade-producer/target/trade-producer-5.0.jar "" <trades per sec>
```

10. Run the queries

* Load static data into map: (Stock names)
```
java -jar trade-queries/target/trade-queries-5.0.jar load-symbols
```

* Ingest trades from Kafka

```
java -jar trade-queries/target/trade-queries-5.0.jar ingest-trades ""
```
* Aggregate trades by symbol
```
java -jar trade-queries/target/trade-queries-5.0.jar aggregate-query ""
```

11. Start the front end

```
java -jar webapp/target/webapp-5.0.jar 
```

12. Browse to [http://localhost:9000](http://localhost:9000) to see the dashboard