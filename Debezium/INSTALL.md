# Installing Debezium

There are several ways to install and use Debezium connectors, so we’ve documented a few of the most common ways to do this. The latest released version of Debezium is 0.9.1.Final.

## Installing a Debezium Connector

If you’ve already installed [Zookeeper](https://zookeeper.apache.org/), [Kafka](http://kafka.apache.org/), and [Kafka Connect](http://kafka.apache.org/documentation.html#connect), then using one of Debezium’s connectors is easy. Simply download one or more connector plugin archives (see below), extract their files into your Kafka Connect environment, and add the parent directory of the extracted plugin(s) to [Kafka Connect’s plugin path](https://docs.confluent.io/current/connect/userguide.html#installing-plugins). If not the case yet, specify the plugin path in your worker configuration (e.g. *connect-distributed.properties*) using the `plugin.path` property. As an example, let’s assume you have downloaded the Debezium MySQL connector archive and extracted its contents to */kafka/connect/debezium-connector-mysql*. Then you’d specify the following in the worker config:

```sh
plugin.path=/kafka/connect
```

Restart your Kafka Connect process to pick up the new JARs.

The connector plugins are available from Maven:

- [MySQL Connector plugin archive](https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/0.9.1.Final/debezium-connector-mysql-0.9.1.Final-plugin.tar.gz)
- [Postgres Connector plugin archive](https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/0.9.1.Final/debezium-connector-postgres-0.9.1.Final-plugin.tar.gz)
- [MongoDB Connector plugin archive](https://repo1.maven.org/maven2/io/debezium/debezium-connector-mongodb/0.9.1.Final/debezium-connector-mongodb-0.9.1.Final-plugin.tar.gz)
- [Oracle Connector plugin archive](https://repo1.maven.org/maven2/io/debezium/debezium-connector-oracle/0.9.1.Final/debezium-connector-oracle-0.9.1.Final-plugin.tar.gz) (tech preview)
- [SQL Server Connector plugin archive](https://repo1.maven.org/maven2/io/debezium/debezium-connector-sqlserver/0.9.1.Final/debezium-connector-sqlserver-0.9.1.Final-plugin.tar.gz) (tech preview)

If immutable containers are your thing, then check out [Debezium’s Docker images](https://hub.docker.com/r/debezium/) for Zookeeper, Kafka, and Kafka Connect with the MySQL and MongoDB connectors already pre-installed and ready to go. Our [tutorial](http://debezium.io/docs/tutorial) even walks you through using these images, and this is a great way to learn what Debezium is all about. You can even [run Debezium on Kubernetes and OpenShift](https://debezium.io/blog/2016/05/31/Debezium-on-Kubernetes/).

By default, the directory */kafka/connect* is used as plugin directory by the Debezium Docker image for Kafka Connect. So any additional connectors you may wish to use should be added to that directory. Alternatively, you can add further directories to the plugin path by specifying the `KAFKA_CONNECT_PLUGINS_DIR` environment variable when starting the container (e.g. `-e KAFKA_CONNECT_PLUGINS_DIR=/kafka/connect/,/path/to/further/plugins`). When using the Docker image for Kafka Connect provided by Confluent, you can specify the `CONNECT_PLUGIN_PATH` environment variable to achieve the same.

Not that Java 8 or later is required to run the Debezium connectors.

### Consuming Snapshot Releases

Debezium executes nightly builds and deployments into the Sonatype snapshot repository. If you want to try latest and fresh or verify a bug fix you are interested in, then use plugins from [oss.sonatype.org](https://oss.sonatype.org/content/repositories/snapshots/io/debezium/). The installation procedure is the same as for regular releases.

## Using a Debezium Connector

To use a connector to produce change events for a particular source server/cluster, simply create a configuration file for the [MySQL Connector](https://debezium.io/docs/connectors/mysql/#configuration) or [MongoDB Connector](https://debezium.io/docs/connectors/mongodb/#configuration), and use the [Kafka Connect REST API](https://docs.confluent.io/5.0.1/connect/restapi.html) to add that connector configuration to your Kafka Connect cluster. When the connector starts, it will connect to the source and produce events for each inserted, updated, and deleted row or document. See the Debezium documentation for the [MySQL Connector](https://debezium.io/docs/connectors/mysql/) and [MongoDB Connector](https://debezium.io/docs/connectors/mongodb/).

## Configuring Debezium Topics

Debezium uses (either via Kafka Connect or directly) multiple topics for storing data. The topics have to be either created by an administrator or by Kafka itself by enabling auto-creation for topics. There are certain limitations and recommendations which apply to topics:

- Database history topic (for MySQL connector)
  - Infinite (or very long) retention (no compaction!)
  - Replication factor at least 3 for production
  - Single partition
- Other topics
  - Optionally, [log compaction](https://kafka.apache.org/documentation/#compaction) enabled (if you wish to only keep the *last* change event for a given record); in this case the `min.compaction.lag.ms` and `delete.retention.ms` topic-level settings in Apache Kafka should be configured, so that consumers have enough time to receive all events and delete markers; specifically, these values should be larger than the maximum downtime you anticipate for the sink connectors, e.g. when updating them
  - Replicated in production
  - Single partition
    - You can relax the single partition rule but your application must handle out-of-order events for different rows in database (events for a single row are still totally ordered). If multiple partitions are used, Kafka will determine the partition by hashing the key by default. Other partition strategies require using SMTs to set the partition number for each record.

## Using the Debezium Libraries

Although Debezium is really intended to be used as turnkey services, all of Debezium’s JARs and other artifacts are available in [Maven Central](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22io.debezium%22). For example, you might want to use our [MySQL DDL parser](https://debezium.io/blog/2016/04/15/parsing-ddl/) from our MySQL connector library to parse those DDL statements in your consumers of the MySQL schema change topics.

We do provide a small library so applications can [embed any Kafka Connect connector](https://debezium.io/docs/embedded/) and consume data change events read directly from the source system. This provides a much lighter weight system (since Zookeeper, Kafka, and Kafka Connect services are not needed), but as a consequence is not as fault tolerant or reliable since the application must manage and maintain all state normally kept inside Kafka’s distributed and replicated logs. It’s perfect for use in tests, and with careful consideration it may be useful in some applications.