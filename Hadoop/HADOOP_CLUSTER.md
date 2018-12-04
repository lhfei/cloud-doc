Step 1: 
​	
	Edited the hosts on each machine (Required)
	-------------------------------------------------------------
	114.80.177.124     ubuntu124
	114.80.177.125     ubuntu125
	114.80.177.126     ubuntu126
	114.80.177.127     ubuntu127
	
	114.80.177.132     ubuntu132
	114.80.177.133     ubuntu133
	114.80.177.134     ubuntu134
	114.80.177.135     ubuntu135
	114.80.177.136     ubuntu136
	114.80.177.137     ubuntu137
	
	114.80.177.144     ubuntu144
	114.80.177.145     ubuntu145
	114.80.177.146     ubuntu146
	114.80.177.147     ubuntu147
	-------------------------------------------------------------
Step 2:
​	
	Created an ssh key-pair without a password on each  
	machine, and copy the namenode key to all datanode.
	-------------------------------------------------------------
	# All machine
	>ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
	>cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
	# checked is okay on each machine:
	>ssh ubuntu14[4|5|6|7]
	
	# Just on namenode machine:
	>ssh-copy-id -i ~/.ssh/id_dsa.pub cloudland@ubuntu145
	>ssh-copy-id -i ~/.ssh/id_dsa.pub cloudland@ubuntu146
	>ssh-copy-id -i ~/.ssh/id_dsa.pub cloudland@ubuntu147
	#checked is okay on namenode:
	>ssh ubuntu145
	>ssh ubuntu146
	>ssh ubuntu147
	-------------------------------------------------------------	
	
	-------------------------------------------------------------
Step 3:	

	Installed JDK and Hadoop:
	-------------------------------------------------------------	
	JAVA_HOME=/usr/local/java/jdk1.8.0_40
	JRE_HOME=/usr/local/java/jdk1.8.0_40/jre
	MAVEN_HOME=/usr/local/maven/apache-maven-3.2.5
	
	# Cloud
	HADOOP_HOME=/usr/local/hadoop/hadoop-2.6.0
	HIVE_HOME=/usr/local/hive/apache-hive-1.1.0-bin
	PIG_HOME=/usr/local/pig/pig-0.14.0
	
	PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin:$MAVEN_HOME/bin:$HADOOP_HOME/bin:$HIVE_HOME/bin:$PIG_HOME/bin
	
	export JAVA_HOME
	export JRE_HOME
	export MAVEN_HOME
	export HADOOP_HOME
	export HIVE_HOME
	export PIG_HOME
	
	export PATH
	
	-------------------------------------------------------------

Step 4:
​	
	Modified the *-site.xml
	-------------------------------------------------------------
	<!-- core-site.xml -->
	<property>
	    <name>fs.defaultFS</name>
	    <value>hdfs://ubuntu144:9000</value>
	</property>
	<property>
	    <name>hadoop.tmp.dir</name>
	    <value>/home/cloudland/data/hadoop/tmp/${user.name}</value>
	</property>
	
	<!-- yarn-site.xml -->
	<property>
	    <name>yarn.resourcemanager.hostname</name>
	    <value>ubuntu144</value>
	</property>
	<property>
	    <name>yarn.resourcemanager.scheduler.address</name>
	    <value>ubuntu144:8030</value>
	</property>
	<property>
	    <name>yarn.resourcemanager.resource-tracker.address</name>
	    <value>ubuntu144:8031</value>
	</property>
	<property>
	    <name>yarn.resourcemanager.address</name>
	    <value>ubuntu144:8032</value>
	</property>
	<property>
	    <name>yarn.resourcemanager.admin.address</name>
	    <value>ubuntu144:8033</value>
	</property>
	<property>
	    <name>yarn.resourcemanager.webapp.address</name>
	    <value>0.0.0.0:8088</value>
	</property>
	<property>
	    <name>yarn.nodemanager.aux-services</name>
	    <value>mapreduce_shuffle</value>
	</property>
	<property>
	    <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
	    <value>org.apache.hadoop.mapred.ShuffleHandler</value>
	</property>
	<property>
		<name>yarn.nodemanager.resource.memory-mb</name>
		<value>8192</value>
	</property>
	
	<property>
	    <name>yarn.nodemanager.vmem-pmem-ratio</name>
	    <value>2.1</value>	
	</property>


    <!-- hdfs-site.xml -->
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>file:/home/cloudland/data/hadoop/hdfs/namenode</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>file:/home/cloudland/data/hadoop/hdfs/datanode</value>
    </property>
    
    <!-- mapred-site.xml -->
    <property>
    	<name>mapreduce.jobtracker.address</name>
    	<value>ubuntu144:54311</value>
    	<description>The host and port that the MapReduce job tracker runs
    		at. If “local”, then jobs are run in-process as a single map
    		and reduce task.
    	</description>
    </property>
    <property>
    	<name>mapreduce.framework.name</name>
    	<value>yarn</value>
    	<description>The framework for running mapreduce jobs</description>
    </property>	
    <property>
    	<name>mapred.child.java.opts</name>
    	<value>-Xmx2048m</value>
    	<!-- Not marked as final so jobs can include JVM debugging options -->	
    </property>
    
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
    
    -------------------------------------------------------------

Step 5	
​	Created the name and data directory
​	# created it on namenode machine:
​	>mkdir -p /home/cloudland/data/hadoop/hdfs/namenode
​	>chmod -R cloudland:cloudland /home/cloudland/data
​	
	# created it on each datanode machine:
	>mkdir -p /home/cloudland/data/hadoop/hdfs/datanode
	>chmod -R cloudland:cloudland /home/cloudland/data
	-------------------------------------------------------------	

Step 6: Make sure date is clear
​	rm -rf /home/cloudland/data/hadoop/hdfs/datanode/*
​	
Step 7:
​	
	Start the cluster.
	#Entry the $HADOOP_HOME path
	>bin/hdfs namenode -format
	#start dfs and yarn services.
	>sbin/start-dfs.sh
	>sbin/start-yarn.sh
	-------------------------------------------------------------	

-----------------------
# mapred classpath
>mapred classpath	


	bin/hdfs dfs -mkdir -p /user/cloudland/input
	bin/hdfs dfs -chown -R cloudland:cloudland /user
	bin/hdfs dfs -chmod g+w /user



### Hadoop Startup

To start a Hadoop cluster you will need to start both the HDFS and YARN cluster.

The first time you bring up HDFS, it must be formatted. Format a new distributed filesystem as *hdfs*:

```
[hdfs]$ $HADOOP_PREFIX/bin/hdfs namenode -format <cluster_name>
```

Start the HDFS NameNode with the following command on the designated node as *hdfs*:

```
[hdfs]$ $HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
```

Start a HDFS DataNode with the following command on each designated node as *hdfs*:

```
[hdfs]$ $HADOOP_PREFIX/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
```

If `etc/hadoop/slaves` and ssh trusted access is configured (see [Single Node Setup](http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the HDFS processes can be started with a utility script. As *hdfs*:

```
[hdfs]$ $HADOOP_PREFIX/sbin/start-dfs.sh
```

Start the YARN with the following command, run on the designated ResourceManager as *yarn*:

```
[yarn]$ $HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
```

Run a script to start a NodeManager on each designated host as *yarn*:

```
[yarn]$ $HADOOP_YARN_HOME/sbin/yarn-daemons.sh --config $HADOOP_CONF_DIR start nodemanager
```

Start a standalone WebAppProxy server. Run on the WebAppProxy server as *yarn*. If multiple servers are used with load balancing it should be run on each of them:

```
[yarn]$ $HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start proxyserver
```

If `etc/hadoop/slaves` and ssh trusted access is configured (see [Single Node Setup](http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the YARN processes can be started with a utility script. As *yarn*:

```
[yarn]$ $HADOOP_PREFIX/sbin/start-yarn.sh
```

Start the MapReduce JobHistory Server with the following command, run on the designated server as *mapred*:

```
[mapred]$ $HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver
```

### Hadoop Shutdown

Stop the NameNode with the following command, run on the designated NameNode as *hdfs*:

```
[hdfs]$ $HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs stop namenode
```

Run a script to stop a DataNode as *hdfs*:

```
[hdfs]$ $HADOOP_PREFIX/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs stop datanode
```

If `etc/hadoop/slaves` and ssh trusted access is configured (see [Single Node Setup](http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the HDFS processes may be stopped with a utility script. As *hdfs*:

```
[hdfs]$ $HADOOP_PREFIX/sbin/stop-dfs.sh
```

Stop the ResourceManager with the following command, run on the designated ResourceManager as *yarn*:

```
[yarn]$ $HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR stop resourcemanager
```

Run a script to stop a NodeManager on a slave as *yarn*:

```
[yarn]$ $HADOOP_YARN_HOME/sbin/yarn-daemons.sh --config $HADOOP_CONF_DIR stop nodemanager
```

If `etc/hadoop/slaves` and ssh trusted access is configured (see [Single Node Setup](http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the YARN processes can be stopped with a utility script. As *yarn*:

```
[yarn]$ $HADOOP_PREFIX/sbin/stop-yarn.sh
```

Stop the WebAppProxy server. Run on the WebAppProxy server as *yarn*. If multiple servers are used with load balancing it should be run on each of them:

```
[yarn]$ $HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR stop proxyserver
```

Stop the MapReduce JobHistory Server with the following command, run on the designated server as *mapred*:

```
[mapred]$ $HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR stop historyserver
```

## Web Interfaces

Once the Hadoop cluster is up and running check the web-ui of the components as described below:

| Daemon                      | Web Interface           | Notes                       |
| --------------------------- | ----------------------- | --------------------------- |
| NameNode                    | <http://nn_host:port/>  | Default HTTP port is 50070. |
| ResourceManager             | <http://rm_host:port/>  | Default HTTP port is 8088.  |
| MapReduce JobHistory Server | <http://jhs_host:port/> | Default HTTP port is 19888. |