

### Hosts

```ini
10.182.19.70	host-10-182-19-70
10.182.19.93	host-10-182-19-93
10.182.25.225	host-10-182-25-225
```



### Zookeeper

> zoo.cfg

```ini
clientPort=2181
initLimit=10
autopurge.purgeInterval=24
syncLimit=5
tickTime=3000
dataDir=/hadoop/zookeeper
autopurge.snapRetainCount=30
server.1=host-10-182-19-70:2888:3888
server.2=host-10-182-19-93:2888:3888
server.3=host-10-182-25-225:2888:3888
```



### Kafka

> server.properties

```properties
# Edited by Hefei Li. 
# Mon Sep  9 09:17:24 2019
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
fetch.purgatory.purge.interval.requests=10000
#kafka.metrics.reporters=kafka.metrics.KafkaMetricsReporter
leader.imbalance.check.interval.seconds=300
leader.imbalance.per.broker.percentage=10
listeners=PLAINTEXT://host-10-182-19-70:6667
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
zookeeper.connect=host-10-182-19-70:2181,host-10-182-19-93:2181,host-10-182-25-225:2181
zookeeper.connection.timeout.ms=25000
zookeeper.session.timeout.ms=30000
zookeeper.sync.time.ms=2000
```

Replace `listeners=PLAINTEXT://${HOST_NAME}0:6667` on all hosts.



### Kafka Connect

