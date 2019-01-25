

```sh
./bin/confluent-hub install confluentinc/kafka-connect-jdbc:5.1.0 --component-dir share/java/kafka-connect-jdbc/ --worker-configs etc/kafka-connect-jdbc/sink-quickstart-sqlite.properties 
 
Component's license: 
Confluent Community License 
http://www.confluent.io/confluent-community-license 
I agree to the software license agreement (yN) y

Downloading component Kafka Connect JDBC 5.1.0, provided by Confluent, Inc. from Confluent Hub and installing into share/java/kafka-connect-jdbc/ 
Do you want to uninstall existing version 5.1.0? (yN) n

Component is already installed. If you want to uninstall existing version, confirm or run the command with "--no-prompt" option 
 
Error: Component is already installed 
```







```sh
./bin/confluent-hub install confluentinc/kafka-connect-datagen:0.1.1 --component-dir share/java/kafka-connect-datagen/ --worker-configs etc/kafka-connect-datagen/sink-quickstart-sqlite.properties 
```





```sh
./bin/confluent-hub install confluentinc/kafka-connect-hdfs:5.1.0 --component-dir share/java/kafka-connect-hdfs/ --worker-configs etc/kafka-connect-hdfs/sink-quickstart-hdfs.properties 
```





```shell
./bin/kafka-avro-console-producer --broker-list 10.182.93.76:9092 --topic test_hdfs --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}'



./bin/kafka-avro-console-consumer --bootstrap-server 10.182.93.76:9092  --topic test_hdfs --from-beginning
```





# kafka connect分布式部署

------

- Apache Kafka 消息分发组件，数据采集后先入Kafka
- Schema Registry Schema管理服务，消息出入kafka、入hdfs时，给数据做序列化/反序列化处理。
- Kafka Connect 提供kafka到其他存储的管道服务，此次焦点是从kafka到hdfs，并建立相关HIVE表。
- Kafka Rest Proxy 提供kafka的Rest API服务。
- Kafka Clients 提供Client编程所需SDK。
- 说明：以上服务除Apache kafka由Linkedin始创并开源，其他组件皆由Confluent公司开发并开源。上图解决方案由confluent提供。

------

## 基本逻辑步骤

------

- 数据通过Kafka Rest/Kafka Client写入Kafka；
- kafka Connect任务作为consumer从kafka订阅数据；
- kafka Connect任务建立HIVE表和hdfs文件的映射关系；
- kafka connect任务收到数据后，以指定格式，写入指定hdfs目录;

------

## 实际操作：

### 启动kafka服务

- 首先进行集群间ssh免密登陆
- 后期为了测压可控，自己单独搭建了，在所有节点启动

#### 安装zookeeper

具体安装见博文[ZOOKEEPER安装及测试](https://my.oschina.net/112612/blog/1584832)

#### 安装kafka

可以采取集成或自己单独搭建

- kafka connect集成：

在路径 */confluent/etc/kafka路径下修改server.properties，进行如下相应的修改

```
/*
1.修改A、B、C三台服务器上配置
2.配置文件中broker.id值分别修改为0、1、2
*/
broker.id=2
listeners=PLAINTEXT://A:9092
log.dirs=/usr/local/kafka/logs
# The default number of log partitions per topic. More partitions allow greater
# parallelism for consumption, but this will also result in more files across
# the brokers.
num.partitions=3
zookeeper.connect=A:2181,B:2181,C:2181
```

然后启动kafka：

```
nohup ./bin/kafka-server-start.sh ./config/server.properties > /dev/null 2>&1 &
```

- 单独安装：

1. 下载kafka安装包[下载链接](http://kafka.apache.org/)，并解压到software目录下：
2. 到config目录下修改server.properties,具体修改和上述相同 然后进入kfka目录启动：

```
./bin/kafka-server-start.sh -daemon ./config/server.properties &
```

- 服务说明 :kafka服务无Leader概念，服务访问端口为9092
- 进行kafka集群验证

1. 新建一个topic：

```
./kafka-topics.sh -zookeeper A:2181,B:2181,C:2181 -topic connect-test -replication-factor 2 -partitions 3 -create
```

1. 在一个节点中进入bin目录，新建一个consumer：

```
./kafka-console-consumer.sh -zookeeperA:2015,B:2015,C:2015 -topic connect-test
```

1. 在另一个节点中进入bin目录，新建一个producer：

```
./kafka-console-producer.sh -broker-list A:9092,B:9092,C:9092 -topic connect-test
```

1. 之后再生成者终端发送数据，如果在消费者端有消息过来，则说明集群搭建成功： 生产者端：

   ![输入图片说明](https://static.oschina.net/uploads/img/201802/01204327_wbIz.png)

2. 消费者端：

   ![输入图片说明](https://static.oschina.net/uploads/img/201802/01204350_1Rrh.png)

#### 安装Schema Register并启动该服务

1.所有节点都进入路径*/software/confluent/etc/schema-registry下找到schema-registry.properties文件，并进行如下修改

```
listeners=http://0.0.0.0:8081
kafkastore.connection.url=A:2015,B:2015,C:2015
kafkastore.topic=_schemas
debug=false
```

然后启动：

```
./bin/schema-registry-start ./etc/schema-registry/schema-registry.properties &
```

- 服务说明 Schema Register服务端口为8081

#### 安装启动Kafka Rest API服务

1. 所有节点进入路径*/software/confluent/etc/kafka-rest下找到配置文件kafka-rest.properties，并做如下修改

```
// 修改schema服务器地址和zookeeper服务器地址
id=kafka-rest-test-server
schema.registry.url=http://localhost:8081
zookeeper.connect=A:2015,B:2015,C:2015
```

启动：

```
./bin/kafka-rest-start ./etc/kafka-rest/kafka-rest.properties &
```

#### 启动Kafka connect服务

1. 进入路径*/software/confluent/etc/schema-registry下找到connect-avro-distributed.properties并做如下修改：

```
/*
修改如下配置项:
1.bootstrap.servers, 所有kafka broker的地址
2.group.id 标志connect集群，集群内配一致
3.key.converter.schema.registry.url，schema服务地址
4.value.converter.schema.registry.url，schema服务地址
*/
bootstrap.servers=A:9092,B:9092,C:9092
# The group ID is a unique identifier for the set of workers that form a single Kafka Connect
# cluster
group.id=connect-cluster
```

- 启动命令：

```
./bin/connect-distributed  ./etc/kafka/connect-distributed.properties > connect-distribute.log &
```

### 传输到hdfs实验

1. 在/etc/kafka-connect-hdfs新建connect 这个是在主节点上新建的C,进入路径/software/confluent/etc/kafka-connect-hdfs下新建quickstart-hdfs.properties，并做如下修改

```
name=hdfs-sink
connector.class=io.confluent.connect.hdfs.HdfsSinkConnector
tasks.max=1
topics=test_hdfs
hdfs.url=hdfs://C:9000
flush.size=3            
```

1. 然后在C上启动该connector：

```
confluent load hdfs-sink -d etc/kafka-connect-hdfs/quickstart-hdfs.properties
```

1. 检查启动的connector：

```
curl localhost:8083/connectors | jq
```

1. 显示：

```
[
  "hdfs-sink"
]
```

即启动成功，接下来即可以进行生产测试了

- 生产测试 然后在C上启动生产者：

```
./kafka-avro-console-producer --broker-list A:9092,B:9092,C:9092 --topic test-hdfs --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}'
#输入以下代码
{"f1":"agastf"}
{"f1":"gaserwsagf"}
```

最后进入hdfs查看是否生成该文件

![输入图片说明](https://static.oschina.net/uploads/img/201802/08115855_qGud.png)

继续进入查看都是avro文件： ![输入图片说明](https://static.oschina.net/uploads/img/201802/08120052_1ERT.png)

avro文件需要下载解析jar[jar下载](http://central.maven.org/maven2/org/apache/avro/avro-tools/1.8.2/avro-tools-1.8.2.jar)

然后将hdfs中的avro文件拷贝到本地进行查看

```
hadoop fs -copyToLocal /topics/test_hdfs/partition=0/test_hdfs+0+0000000000+0000000002.avro /tmp
java -jar avro-tools-1.8.2.jar tojson /tmptest_hdfs+0+0000000000+0000000002.avro  //查看数据
```