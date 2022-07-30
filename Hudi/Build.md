# Apache Hudi

Apache Hudi (pronounced Hoodie) stands for `Hadoop Upserts Deletes and Incrementals`. Hudi manages the storage of large analytical datasets on DFS (Cloud stores, HDFS or any Hadoop FileSystem compatible storage).

[![Hudi logo](https://camo.githubusercontent.com/167d7939912a5b6487ee0c6c38374215ebd740386d5e61b10356b065243b61a4/68747470733a2f2f687564692e6170616368652e6f72672f6173736574732f696d616765732f687564692d6c6f676f2d6d656469756d2e706e67)](https://camo.githubusercontent.com/167d7939912a5b6487ee0c6c38374215ebd740386d5e61b10356b065243b61a4/68747470733a2f2f687564692e6170616368652e6f72672f6173736574732f696d616765732f687564692d6c6f676f2d6d656469756d2e706e67)

https://hudi.apache.org/

[![Build](https://github.com/apache/hudi/actions/workflows/bot.yml/badge.svg)](https://github.com/apache/hudi/actions/workflows/bot.yml) [![Test](https://camo.githubusercontent.com/b759d8e0a9d1ea82d7896ec6c7d5d19e28422241d0268cdedbda3f76aada30e8/68747470733a2f2f6465762e617a7572652e636f6d2f6170616368652d687564692d63692d6f72672f6170616368652d687564692d63692f5f617069732f6275696c642f7374617475732f617061636865687564692d63692e687564692d6d6972726f723f6272616e63684e616d653d6d6173746572)](https://dev.azure.com/apache-hudi-ci-org/apache-hudi-ci/_build/latest?definitionId=3&branchName=master) [![License](https://camo.githubusercontent.com/266dbf1c12e7e7f112914eb37138734857bde343e4fca6e01dfeb40553cf209a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d417061636865253230322d3445423142412e737667)](https://www.apache.org/licenses/LICENSE-2.0.html) [![Maven Central](https://camo.githubusercontent.com/df69173f13ef4d0f635ce44edab54db62bf67b3dd8fb5563909103a06a2061a4/68747470733a2f2f6d6176656e2d6261646765732e6865726f6b756170702e636f6d2f6d6176656e2d63656e7472616c2f6f72672e6170616368652e687564692f687564692f62616467652e737667)](http://search.maven.org/#search|ga|1|g%3A"org.apache.hudi") [![GitHub commit activity](https://camo.githubusercontent.com/9bf0a12f52edce12e8e50291b6e5219a4bbf2cab47530f25cf5c20d96f13851a/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f636f6d6d69742d61637469766974792f6d2f6170616368652f68756469)](https://camo.githubusercontent.com/9bf0a12f52edce12e8e50291b6e5219a4bbf2cab47530f25cf5c20d96f13851a/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f636f6d6d69742d61637469766974792f6d2f6170616368652f68756469) [![Join on Slack](https://camo.githubusercontent.com/5156f46f56293704f3912c08a3f4d41b7867603c586684791fd520a60ec12270/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f736c61636b2d253233687564692d3732656666383f6c6f676f3d736c61636b26636f6c6f723d343863363238266c6162656c3d4a6f696e2532306f6e253230536c61636b)](https://join.slack.com/t/apache-hudi/shared_invite/enQtODYyNDAxNzc5MTg2LTE5OTBlYmVhYjM0N2ZhOTJjOWM4YzBmMWU2MjZjMGE4NDc5ZDFiOGQ2N2VkYTVkNzU3ZDQ4OTI1NmFmYWQ0NzE) [![Twitter Follow](https://camo.githubusercontent.com/8da57181a370b9a9ae2bd3a36fe1580d0d9dc25c77dffb992d993786ed52c7cd/68747470733a2f2f696d672e736869656c64732e696f2f747769747465722f666f6c6c6f772f41706163686548756469)](https://camo.githubusercontent.com/8da57181a370b9a9ae2bd3a36fe1580d0d9dc25c77dffb992d993786ed52c7cd/68747470733a2f2f696d672e736869656c64732e696f2f747769747465722f666f6c6c6f772f41706163686548756469)

## Features

- Upsert support with fast, pluggable indexing
- Atomically publish data with rollback support
- Snapshot isolation between writer & queries
- Savepoints for data recovery
- Manages file sizes, layout using statistics
- Async compaction of row & columnar data
- Timeline metadata to track lineage
- Optimize data lake layout with clustering

Hudi supports three types of queries:

- **Snapshot Query** - Provides snapshot queries on real-time data, using a combination of columnar & row-based storage (e.g [Parquet](https://parquet.apache.org/) + [Avro](https://avro.apache.org/docs/current/mr.html)).
- **Incremental Query** - Provides a change stream with records inserted or updated after a point in time.
- **Read Optimized Query** - Provides excellent snapshot query performance via purely columnar storage (e.g. [Parquet](https://parquet.apache.org/)).

Learn more about Hudi at [https://hudi.apache.org](https://hudi.apache.org/)

## Building Apache Hudi from source

Prerequisites for building Apache Hudi:

- Unix-like system (like Linux, Mac OS X)
- Java 8 (Java 9 or 10 may work)
- Git
- Maven (>=3.3.1)

```shell
# Checkout code and build
git clone https://github.com/apache/hudi.git && cd hudi
mvn clean package -DskipTests

# Start command
spark-2.4.4-bin-hadoop2.7/bin/spark-shell \
  --jars `ls packaging/hudi-spark-bundle/target/hudi-spark-bundle_2.11-*.*.*-SNAPSHOT.jar` \
  --conf 'spark.serializer=org.apache.spark.serializer.KryoSerializer'
```

To build for integration tests that include `hudi-integ-test-bundle`, use `-Dintegration-tests`.

To build the Javadoc for all Java and Scala classes:

```
# Javadoc generated under target/site/apidocs
mvn clean javadoc:aggregate -Pjavadocs
```

### Build with different Spark versions

The default Spark version supported is 2.4.4. Refer to the table below for building with different Spark and Scala versions.

| Maven build options       | Expected Spark bundle jar name               | Notes                                            |
| ------------------------- | -------------------------------------------- | ------------------------------------------------ |
| (empty)                   | hudi-spark-bundle_2.11 (legacy bundle name)  | For Spark 2.4.4 and Scala 2.11 (default options) |
| `-Dspark2.4`              | hudi-spark2.4-bundle_2.11                    | For Spark 2.4.4 and Scala 2.11 (same as default) |
| `-Dspark2.4 -Dscala-2.12` | hudi-spark2.4-bundle_2.12                    | For Spark 2.4.4 and Scala 2.12                   |
| `-Dspark3.1 -Dscala-2.12` | hudi-spark3.1-bundle_2.12                    | For Spark 3.1.x and Scala 2.12                   |
| `-Dspark3.2 -Dscala-2.12` | hudi-spark3.2-bundle_2.12                    | For Spark 3.2.x and Scala 2.12                   |
| `-Dspark3`                | hudi-spark3-bundle_2.12 (legacy bundle name) | For Spark 3.2.x and Scala 2.12                   |
| `-Dscala-2.12`            | hudi-spark-bundle_2.12 (legacy bundle name)  | For Spark 2.4.4 and Scala 2.12                   |

For example,

```
# Build against Spark 3.2.x
mvn clean package -DskipTests -Dspark3.2 -Dscala-2.12

# Build against Spark 3.1.x
mvn clean package -DskipTests -Dspark3.1 -Dscala-2.12

# Build against Spark 2.4.4 and Scala 2.12
mvn clean package -DskipTests -Dspark2.4 -Dscala-2.12
```

#### What about "spark-avro" module?

Starting from versions 0.11, Hudi no longer requires `spark-avro` to be specified using `--packages`

### Build with different Flink versions

The default Flink version supported is 1.14. Refer to the table below for building with different Flink and Scala versions.

| Maven build options        | Expected Flink bundle jar name | Notes                                           |
| -------------------------- | ------------------------------ | ----------------------------------------------- |
| (empty)                    | hudi-flink1.14-bundle_2.11     | For Flink 1.14 and Scala 2.11 (default options) |
| `-Dflink1.14`              | hudi-flink1.14-bundle_2.11     | For Flink 1.14 and Scala 2.11 (same as default) |
| `-Dflink1.14 -Dscala-2.12` | hudi-flink1.14-bundle_2.12     | For Flink 1.14 and Scala 2.12                   |
| `-Dflink1.13`              | hudi-flink1.13-bundle_2.11     | For Flink 1.13 and Scala 2.11                   |
| `-Dflink1.13 -Dscala-2.12` | hudi-flink1.13-bundle_2.12     | For Flink 1.13 and Scala 2.12                   |

## Running Tests

Unit tests can be run with maven profile `unit-tests`.

```
mvn -Punit-tests test
```

Functional tests, which are tagged with `@Tag("functional")`, can be run with maven profile `functional-tests`.

```
mvn -Pfunctional-tests test
```

To run tests with spark event logging enabled, define the Spark event log directory. This allows visualizing test DAG and stages using Spark History Server UI.

```
mvn -Punit-tests test -DSPARK_EVLOG_DIR=/path/for/spark/event/log
```

## Quickstart

Please visit https://hudi.apache.org/docs/quick-start-guide.html to quickly explore Hudi's capabilities using spark-shell.