

```sh
Error: org.apache.hadoop.mapreduce.task.reduce.Shuffle$ShuffleError: error in shuffle in fetcher####1
        at org.apache.hadoop.mapreduce.task.reduce.Shuffle.run(Shuffle.java:134)
        at org.apache.hadoop.mapred.ReduceTask.run(ReduceTask.java:376)
        at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:163)
        at java.security.AccessController.doPrivileged(Native Method)
        at javax.security.auth.Subject.doAs(Subject.java:422)
        at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1628)
        at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:158)
Caused by: java.io.IOException: Exceeded MAX_FAILED_UNIQUE_FETCHES; bailing-out.
        at org.apache.hadoop.mapreduce.task.reduce.ShuffleSchedulerImpl.checkReducerHealth(ShuffleSchedulerImpl.java:357)
        at 
org.apache.hadoop.mapreduce.task.reduce.ShuffleSchedulerImpl.copyFailed(ShuffleSchedulerImpl.java:279)
        at org.apache.hadoop.mapreduce.task.reduce.Fetcher.copyFromHost(Fetcher.java:308)
        at org.apache.hadoop.mapreduce.task.reduce.Fetcher.run(Fetcher.java:193)
```

#### beyond virtual memory limits
--------------------------------------------------------------
15/03/25 09:30:22 INFO mapreduce.Job: Task Id : attempt_1427246602072_0001_m_000006_2, Status : FAILED
Container [pid=4420,containerID=container_1427246602072_0001_01_000097] is running beyond virtual memory limits. Current usage: 144.3 MB of 1 GB physical memory used; 22.3 GB of 2.1 GB virtual memory used. Killing container.
Dump of the process-tree for container_1427246602072_0001_01_000097 :

####mapred-site.xml
    <property>
        <name>mapreduce.map.memory.mb</name>
		<value>4096</value>
    </property>
    <property>
        <name>mapreduce.reduce.memory.mb</name>
		<value>8192</value>
    </property>
	
    <property>
	<name>mapreduce.map.java.opts</name>
	<value>-Xmx4096m</value>
    </property>
    <property>
	<name>mapreduce.reduce.java.opts</name>
	<value>-Xmx8192m</value>
    </property>

#### yarn-site.xml
	<property>
	    <name>yarn.nodemanager.vmem-pmem-ratio</name>
	    <value>2.1</value>	
	</property>
--------------------------------------------------------------
--------------------------------------------------------------
#### Job {job_id} running in uber mode : false
  map 0% reduce 0%
--------------------------------------------------------------

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

#### Dynamic add a new data node
--------------------------------------------------------------
	####in the new node:
	>sbin/hadoop-daemon.sh --script hdfs start datanode
	>sbin/yarn-daemon.sh start nodemanager
--------------------------------------------------------------
--------------------------------------------------------------

####Caused by: java.io.IOException: Exceeded MAX_FAILED_UNIQUE_FETCHES; bailing-out.
--------------------------------------------------------------

--------------------------------------------------------------
Container killed on request. Exit code is 143
--------------------------------------------------------------
--------------------------------------------------------------
#### 配置Hadoop集群：java.net.NoRouteToHostException: No route to host问题的解决

```sh
  ####1 check master nodes can ping to all data nodes
  >ping datanode1
  ####2 check slave nodes can ping to master nodes
  >ping masternode
  
  ####3 disable firewall
  >sudo /etc/init.d/iptables stop
  >sudo systemctl disable firewalld
  >sudo service iptables stop
  
  ####4 open hdfs port, for example: 9000、8050、 50010,45454,46440
  >sudo /sbin/iptables -I INPUT -p tcp --dport 50010 -j ACCEPT
```
#### Error: GC overhead limit exceeded

```sh
```
#### is running beyond physical memory limits.

```sh
  ~In mapred-site.xml:
	~mapreduce.map.memory.mb: 4096
	~mapreduce.reduce.memory.mb: 8192
```

#### Loading data from HDFS into Hive tables:
Loading data to table dwd.dwd_flow_sdk_phone_event_day partition (dt=20151205)
Failed with exception java.lang.IllegalArgumentException: Unknown codec: com.hadoop.compression.lzo.LzoCodec
FAILED: Execution Error, return code 1 from org.apache.hadoop.hive.ql.exec.MoveTask

>yum install lzo lzo-devel hadooplzo hadooplzo-native

```sh

```


#### Caused by: java.io.IOException: Couldn't run retriable-command:

```sh
>
```

#### Caused by: java.lang.ClassNotFoundException: org.apache.hadoop.hive.hbase.HiveHBaseTableInputFormat

```sh
>
```


#### java.lang.Exception: java.lang.IllegalArgumentException: SequenceFile doesn't work with GzipCodec without native-hadoop code

```sh
```


#### History Server

```sh
$ sbin/mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver
```