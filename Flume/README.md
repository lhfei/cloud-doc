

# Naming the Components

```ini
*agent_name*.sources = source_name
*agent_name*.sinks = sink_name 
*agent_name*.channels = channel_name 
```


Flume supports various sources, sinks, and channels. They are listed in the table given below.

             Sources         |            Channels        |         Sinks     |
-----------------------------|----------------------------| ------------------|
Avro Source                  | Memory Channel             | HDFS Sink         |
Thrift Source		         | JDBC Channel               | Hive Sink         |
Exec Source		             | Kafka Channel              | Logger Sink       |
JMS Source		             | File Channel               | Avro Sink         |
Spooling Directory Source    | Spillable Memory Channel   | Thrift Sink       |
Twitter 1% firehose Source   | Pseudo Transaction Channel | IRC Sink          |
Kafka Source		         |				              | File Roll Sink    |
NetCat Source		         |				              | Null Sink         |
Sequence Generator Source    |				              | HBaseSink         |
Syslog Sources		         |				              | AsyncHBaseSink    |
Syslog TCP Source	         |				              | MorphlineSolrSink |
Multiport Syslog TCP Source  |				              | ElasticSearchSink |
Syslog UDP Source	         |				              | Kite Dataset Sink |
HTTP Source		             |				              | Kafka Sink        |
Stress Source		         |				              |		              |
Legacy Sources		         |				              |		              |
Thrift Legacy Source	     |				              |		              |
Custom Source		         |				              |		              |
Scribe Source		         |				              |		              |



```
```

##1.Describing the Source

Each source will have a separate list of properties. The property named “type” is common to every source, and it is used to specify the type of the source we are using.

Along with the property "type", it is needed to provide the values of all the **required** properties of a particular source to configure it, as shown below.

```ini
agent_name.sources. source_name.type = value 
agent_name.sources. source_name.property2 = value 
agent_name.sources. source_name.property3 = value 
```

##2.Describing the Sink

Just like the source, each sink will have a separate list of properties. The property named “type” is common to every sink, and it is used to specify the type of the sink we are using. Along with the property “type”, it is needed to provide values to all the required properties of a particular sink to configure it, as shown below.

```ini
agent_name.sinks. sink_name.type = value 
agent_name.sinks. sink_name.property2 = value 
agent_name.sinks. sink_name.property3 = value
```

##3.Describing the Channel
Flume provides various channels to transfer data between sources and sinks. Therefore, along with the sources and the channels, it is needed to describe the channel used in the agent.

To describe each channel, you need to set the required properties, as shown below.

```ini
agent_name.channels.channel_name.type = value 
agent_name.channels.channel_name. property2 = value 
agent_name.channels.channel_name. property3 = value 
```

##4.Binding the Source and the Sink to the Channel
Since the channels connect the sources and sinks, it is required to bind both of them to the channel, as shown below.

agent_name.sources.source_name.channels = channel_name 
agent_name.sinks.sink_name.channels = channel_name 
The following example shows how to bind the sources and the sinks to a channel. Here, we consider **twitter source**, **memory channel**, and **HDFS sink**.

```ini
TwitterAgent.sources.Twitter.channels = MemChannel
TwitterAgent.sinks.HDFS.channels = MemChannel 
```


##5.Starting a Flume Agent
After configuration, we have to start the Flume agent. It is done as follows −

```sh
$ bin/flume-ng agent --conf ./conf/ -f conf/twitter.conf 
Dflume.root.logger=DEBUG,console -n TwitterAgent 
```
>**where −**

- agent − Command to start the Flume agent

- --conf ,-c<conf> − Use configuration file in the conf directory

- -f<file> − Specifies a config file path, if missing

- --name, -n <name> − Name of the twitter agent

- -D property =value − Sets a Java system property value.


# Examples

## 1.NetCat Source

Given below is an example of the configuration file. Copy this content and save as **netcat.conf** in the conf folder of Flume.

```ini
# Naming the components on the current agent
NetcatAgent.sources = Netcat   
NetcatAgent.channels = MemChannel 
NetcatAgent.sinks = LoggerSink  

# Describing/Configuring the source 
NetcatAgent.sources.Netcat.type = netcat 
NetcatAgent.sources.Netcat.bind = localhost
NetcatAgent.sources.Netcat.port = 56565  

# Describing/Configuring the sink 
NetcatAgent.sinks.LoggerSink.type = logger  

# Describing/Configuring the channel 
NetcatAgent.channels.MemChannel.type = memory 
NetcatAgent.channels.MemChannel.capacity = 1000 
NetcatAgent.channels.MemChannel.transactionCapacity = 100 
 
# Bind the source and sink to the channel 
NetcatAgent.sources.Netcat.channels = MemChannel
NetcatAgent.sinks.LoggerSink.channel = MemChannel
```

Browse through the Flume home directory and execute the application as shown below.

```sh
$ cd $FLUME_HOME
$ ./bin/flume-ng agent --conf $FLUME_CONF --conf-file $FLUME_CONF/netcat.conf 
   --name NetcatAgent -Dflume.root.logger=INFO,console
```


```sh
$ curl telnet://localhost:56565 
```


##2.Sequence Generator Source

Given below is an example of the configuration file. Copy this content and save as seq_gen .conf in the conf folder of Flume.

```ini
# Naming the components on the current agent 

SeqGenAgent.sources = SeqSource   
SeqGenAgent.channels = MemChannel 
SeqGenAgent.sinks = HDFS 
 
# Describing/Configuring the source 
SeqGenAgent.sources.SeqSource.type = seq
  
# Describing/Configuring the sink
SeqGenAgent.sinks.HDFS.type = hdfs 
SeqGenAgent.sinks.HDFS.hdfs.path = hdfs://localhost:9000/user/Hadoop/seqgen_data/
SeqGenAgent.sinks.HDFS.hdfs.filePrefix = log 
SeqGenAgent.sinks.HDFS.hdfs.rollInterval = 0
SeqGenAgent.sinks.HDFS.hdfs.rollCount = 10000
SeqGenAgent.sinks.HDFS.hdfs.fileType = DataStream 
 
# Describing/Configuring the channel 
SeqGenAgent.channels.MemChannel.type = memory 
SeqGenAgent.channels.MemChannel.capacity = 1000 
SeqGenAgent.channels.MemChannel.transactionCapacity = 100 
 
# Binding the source and sink to the channel 
SeqGenAgent.sources.SeqSource.channels = MemChannel
SeqGenAgent.sinks.HDFS.channel = MemChannel 

```


Browse through the Flume home directory and execute the application as shown below.

```sh
$ cd $FLUME_HOME 
$./bin/flume-ng agent --conf $FLUME_CONF --conf-file $FLUME_CONF/seq_gen.conf 
   --name SeqGenAgent 
```



##3.File Roll Sink


```ini
# Naming the components on the current agent
NetcatAgent.sources = Netcat   
NetcatAgent.channels = MemChannel 
NetcatAgent.sinks = LoggerSink  

# Describing/Configuring the source 
NetcatAgent.sources.Netcat.type = netcat 
NetcatAgent.sources.Netcat.bind = localhost
NetcatAgent.sources.Netcat.port = 56565  

# Describing/Configuring the sink 
NetcatAgent.sinks.LoggerSink.type = file_roll  

# Describing/Configuring the channel 
NetcatAgent.channels.MemChannel.type = memory 
NetcatAgent.channels.MemChannel.capacity = 1000 
NetcatAgent.channels.MemChannel.transactionCapacity = 100 

# Bind the source and sink to the channel 
NetcatAgent.sources.Netcat.channels = MemChannel
NetcatAgent.sinks.LoggerSink.channel = MemChannel

# Out put directory
NetcatAgent.sinks.LoggerSink.sink.directory = /home/admin/app_server/log.txt


```


1. An example configuration file, describing a single-node Flume deployment. This configuration lets a user generate events and subsequently logs them to the console.

```ini
# example.conf: A single-node Flume configuration

# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = netcat
a1.sources.r1.bind = localhost
a1.sources.r1.port = 44444

# Describe the sink
a1.sinks.k1.type = logger

# Use a channel which buffers events in memory
a1.channels.c1.type = memory
a1.channels.c1.capacity = 1000
a1.channels.c1.transactionCapacity = 100

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

```sh
$ bin/flume-ng agent --conf conf --conf-file example.conf --name a1 -Dflume.root.logger=INFO,console
```

```sh
$ telnet localhost 44444
    ------------------------------------------------
    Trying 127.0.0.1...
    Connected to localhost.localdomain (127.0.0.1).
    Escape character is '^]'.
    Hello world! <ENTER>
    OK
```
----


2.
```ini
# list the sources, sinks and channels in the agent
agent_foo.sources = avro-AppSrv-source1
agent_foo.sinks = hdfs-Cluster1-sink1 avro-forward-sink2
agent_foo.channels = mem-channel-1 file-channel-2

# set channels for source
agent_foo.sources.avro-AppSrv-source1.channels = mem-channel-1 file-channel-2

# set channel for sinks
agent_foo.sinks.hdfs-Cluster1-sink1.channel = mem-channel-1
agent_foo.sinks.avro-forward-sink2.channel = file-channel-2

# channel selector configuration
agent_foo.sources.avro-AppSrv-source1.selector.type = multiplexing
agent_foo.sources.avro-AppSrv-source1.selector.header = State
agent_foo.sources.avro-AppSrv-source1.selector.mapping.CA = mem-channel-1
agent_foo.sources.avro-AppSrv-source1.selector.mapping.AZ = file-channel-2
agent_foo.sources.avro-AppSrv-source1.selector.mapping.NY = mem-channel-1 file-channel-2
agent_foo.sources.avro-AppSrv-source1.selector.default = mem-channel-1
```