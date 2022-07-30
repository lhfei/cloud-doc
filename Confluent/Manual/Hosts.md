

### Zookeeper

> Hosts

| dlink-app-02 | 10.0.0.16 |
| ------------ | --------- |
| dlink-app-06 | 10.0.0.20 |
| dlink-app-05 | 10.0.0.21 |

> zookeeper-env.sh

```ini
export JAVA_HOME=/export/cloud/jdk1.8.0_331
export ZOOKEEPER_HOME=/export/cloud/apache-zookeeper-3.7.1-bin
export ZOO_LOG_DIR=/export/var/log/zookeeper
export ZOOPIDFILE=/var/run/zookeeper/zookeeper_server.pid
export SERVER_JVMFLAGS=-Xmx1024m
export JAVA=$JAVA_HOME/bin/java
#export CLASSPATH=$CLASSPATH:/usr/share/zookeeper/*
```

> zoo.cfg

```ini
clientPort=2181
autopurge.purgeInterval=24
syncLimit=5
quorum.cnxn.threads.size=20
initLimit=10
dataDir=/export/hadoop/zookeeper
tickTime=3000
autopurge.snapRetainCount=30
quorum.auth.enableSasl=false

server.1=dlink-app-02:2888:3888
server.2=dlink-app-05:2888:3888
server.3=dlink-app-06:2888:3888
```





### Kafka

> hosts

| dlink-hadoop-15 | 10.0.0.25 |
| --------------- | --------- |
| dlink-hadoop-16 | 10.0.0.23 |
| dlink-hadoop-17 | 10.0.0.26 |

> kafka-env.sh

```shell
#!/bin/bash

# The java implementation to use.
export JAVA_HOME=/export/cloud/jdk1.8.0_331
export PATH=$PATH:$JAVA_HOME/bin
export PID_DIR=/var/run/kafka
export LOG_DIR=/export/var/log/kafka

export KAFKA_KERBEROS_PARAMS=

```



> server.properties

```ini
##################### Confluent Metrics Reporter #######################
# Confluent Control Center and Confluent Auto Data Balancer integration
#
# Uncomment the following lines to publish monitoring data for
# Confluent Control Center and Confluent Auto Data Balancer
# If you are using a dedicated metrics cluster, also adjust the settings
# to point to your metrics Kafka cluster.
metric.reporters=io.confluent.metrics.reporter.ConfluentMetricsReporter
confluent.metrics.reporter.bootstrap.servers=dlink-hadoop-15:6667,dlink-hadoop-16:6667,dlink-hadoop-17:6667
#
# Uncomment the following line if the metrics cluster has a single broker
confluent.metrics.reporter.topic.replicas=1

broker.id.generation.enable=true
auto.create.topics.enable=true
auto.leader.rebalance.enable=true
compression.type=producer
controlled.shutdown.enable=true
controlled.shutdown.max.retries=3
controlled.shutdown.retry.backoff.ms=5000
controller.message.queue.size=10
controller.socket.timeout.ms=30000
default.replication.factor=1
delete.topic.enable=true
external.kafka.metrics.exclude.prefix=kafka.network.RequestMetrics,kafka.server.DelayedOperationPurgatory,kafka.server.BrokerTopicMetrics.BytesRejectedPerSec
external.kafka.metrics.include.prefix=kafka.network.RequestMetrics.ResponseQueueTimeMs.request.OffsetCommit.98percentile,kafka.network.RequestMetrics.ResponseQueueTimeMs.request.Offsets.95percentile,kafka.network.RequestMetrics.ResponseSendTimeMs.request.Fetch.95percentile,kafka.network.RequestMetrics.RequestsPerSec.request
fetch.purgatory.purge.interval.requests=10000
kafka.ganglia.metrics.group=kafka
kafka.ganglia.metrics.host=localhost
kafka.ganglia.metrics.port=8671
kafka.ganglia.metrics.reporter.enabled=true
#kafka.metrics.reporters=org.apache.hadoop.metrics2.sink.kafka.KafkaTimelineMetricsReporter
kafka.timeline.metrics.host_in_memory_aggregation=false
kafka.timeline.metrics.host_in_memory_aggregation_port=61888
kafka.timeline.metrics.host_in_memory_aggregation_protocol=http
kafka.timeline.metrics.hosts=dlink-hadoop-15
kafka.timeline.metrics.maxRowCacheSize=10000
kafka.timeline.metrics.port=6188
kafka.timeline.metrics.protocol=http
kafka.timeline.metrics.reporter.enabled=true
kafka.timeline.metrics.reporter.sendInterval=5900
#kafka.timeline.metrics.truststore.password=bigdata
#kafka.timeline.metrics.truststore.path=/etc/security/clientKeys/all.jks
#kafka.timeline.metrics.truststore.type=jks
leader.imbalance.check.interval.seconds=300
leader.imbalance.per.broker.percentage=10
listeners=PLAINTEXT://dlink-hadoop-15:6667
log.cleanup.interval.mins=10
log.dirs=/export/kafka-logs
log.index.interval.bytes=4096
log.index.size.max.bytes=10485760
log.retention.bytes=-1
log.retention.check.interval.ms=600000
log.retention.hours=168
log.roll.hours=168
log.segment.bytes=1073741824
message.max.bytes=1000000
min.insync.replicas=1
num.io.threads=8
num.network.threads=3
num.partitions=1
num.recovery.threads.per.data.dir=1
num.replica.fetchers=1
offset.metadata.max.bytes=4096
offsets.commit.required.acks=-1
offsets.commit.timeout.ms=5000
offsets.load.buffer.size=5242880
offsets.retention.check.interval.ms=600000
offsets.retention.minutes=86400000
offsets.topic.compression.codec=0
offsets.topic.num.partitions=50
offsets.topic.replication.factor=3
offsets.topic.segment.bytes=104857600
port=6667
producer.metrics.enable=false
producer.purgatory.purge.interval.requests=10000
queued.max.requests=500
replica.fetch.max.bytes=1048576
replica.fetch.min.bytes=1
replica.fetch.wait.max.ms=500
replica.high.watermark.checkpoint.interval.ms=5000
replica.lag.max.messages=4000
replica.lag.time.max.ms=10000
replica.socket.receive.buffer.bytes=65536
replica.socket.timeout.ms=30000
sasl.enabled.mechanisms=GSSAPI
sasl.mechanism.inter.broker.protocol=GSSAPI
security.inter.broker.protocol=PLAINTEXT
socket.receive.buffer.bytes=102400
socket.request.max.bytes=104857600
socket.send.buffer.bytes=102400
ssl.client.auth=none
ssl.key.password=
ssl.keystore.location=
ssl.keystore.password=
ssl.truststore.location=
ssl.truststore.password=
zookeeper.connect=dlink-app-02:2181,dlink-app-05:2181,dlink-app-06:2181
zookeeper.connection.timeout.ms=25000
zookeeper.session.timeout.ms=30000
zookeeper.sync.time.ms=2000
```

- dlink-hadoop-16

  ```ini
  listeners=PLAINTEXT://dlink-hadoop-16:6667
  ```

- dlink-hadoop-17

  ```ini
  listeners=PLAINTEXT://dlink-hadoop-17:6667
  ```

  