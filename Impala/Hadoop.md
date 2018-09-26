date

### NameNode:

`host-10-182-63-239`



host-192-168-45-160



### Secondary Namenode

`host-10-182-63-241`



host-192-168-45-161

### Job History Server

`host-10-182-63-245`



### Resources Manager

`host-10-182-63-239`



### Timeline Server

`host-10-182-63-250`



host-192-168-45-161



### Hive

`host-10-182-63-242`



### Zookeeper

```ini
host-10-182-63-239:2181,host-10-182-63-245:2181,host-10-182-63-250:2181
```




### Important

Create directory in **Zookeeper** for **ResourceManager**.

```
cd $ZOOKEEPER_HOME
./bin/zkCli.sh -server host-10-182-63-239:2181,host-10-182-63-245:2181,host-10-182-63-250:2181

# create 'yarn.resourcemanager.zk-state-store.parent-path' in yarn-site.html
create /rmstore null

create /rmstore/ZKRMStateRoot null
```



Create directory in HDFS for  `yarn.timeline-service.entity-group-fs-store.active-dir`

```
hdfs dfs -mkdir -p /ats/done/
```





### Hadoop Startup

To start a Hadoop cluster you will need to start both the HDFS and YARN cluster.

The first time you bring up HDFS, it must be formatted. Format a new distributed filesystem as *hdfs*:

```
[hdfs]$ $HADOOP_HOME/bin/hdfs namenode -format <cluster_name>
```

Start the HDFS NameNode with the following command on the designated node as *hdfs*:

```
[hdfs]$ $HADOOP_HOME/bin/hdfs --daemon start namenode
```

Start a HDFS DataNode with the following command on each designated node as *hdfs*:

```
[hdfs]$ $HADOOP_HOME/bin/hdfs --daemon start datanode
```

If `etc/hadoop/workers` and ssh trusted access is configured (see [Single Node Setup](https://hadoop.apache.org/docs/r3.1.1/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the HDFS processes can be started with a utility script. As *hdfs*:

```
[hdfs]$ $HADOOP_HOME/sbin/start-dfs.sh
```

Start the YARN with the following command, run on the designated ResourceManager as *yarn*:

```
[yarn]$ $HADOOP_HOME/bin/yarn --daemon start resourcemanager
```

Run a script to start a NodeManager on each designated host as *yarn*:

```
[yarn]$ $HADOOP_HOME/bin/yarn --daemon start nodemanager
```

Start a standalone WebAppProxy server. Run on the WebAppProxy server as *yarn*. If multiple servers are used with load balancing it should be run on each of them:

```
[yarn]$ $HADOOP_HOME/bin/yarn --daemon start proxyserver
```

If `etc/hadoop/workers` and ssh trusted access is configured (see [Single Node Setup](https://hadoop.apache.org/docs/r3.1.1/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the YARN processes can be started with a utility script. As *yarn*:

```
[yarn]$ $HADOOP_HOME/sbin/start-yarn.sh
```

Start the MapReduce JobHistory Server with the following command, run on the designated server as *mapred*:

```
[mapred]$ $HADOOP_HOME/bin/mapred --daemon start historyserver
```

### Hadoop Shutdown

Stop the NameNode with the following command, run on the designated NameNode as *hdfs*:

```
[hdfs]$ $HADOOP_HOME/bin/hdfs --daemon stop namenode
```

Run a script to stop a DataNode as *hdfs*:

```
[hdfs]$ $HADOOP_HOME/bin/hdfs --daemon stop datanode
```

If `etc/hadoop/workers` and ssh trusted access is configured (see [Single Node Setup](https://hadoop.apache.org/docs/r3.1.1/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the HDFS processes may be stopped with a utility script. As *hdfs*:

```
[hdfs]$ $HADOOP_HOME/sbin/stop-dfs.sh
```

Stop the ResourceManager with the following command, run on the designated ResourceManager as *yarn*:

```
[yarn]$ $HADOOP_HOME/bin/yarn --daemon stop resourcemanager
```

Run a script to stop a NodeManager on a worker as *yarn*:

```
[yarn]$ $HADOOP_HOME/bin/yarn --daemon stop nodemanager
```

If `etc/hadoop/workers` and ssh trusted access is configured (see [Single Node Setup](https://hadoop.apache.org/docs/r3.1.1/hadoop-project-dist/hadoop-common/SingleCluster.html)), all of the YARN processes can be stopped with a utility script. As *yarn*:

```
[yarn]$ $HADOOP_HOME/sbin/stop-yarn.sh
```

Stop the WebAppProxy server. Run on the WebAppProxy server as *yarn*. If multiple servers are used with load balancing it should be run on each of them:

```
[yarn]$ $HADOOP_HOME/bin/yarn stop proxyserver
```

Stop the MapReduce JobHistory Server with the following command, run on the designated server as *mapred*:

```
[mapred]$ $HADOOP_HOME/bin/mapred --daemon stop historyserver
```

## Web Interfaces

Once the Hadoop cluster is up and running check the web-ui of the components as described below:

| Daemon                      | Web Interface           | Notes                       |
| --------------------------- | ----------------------- | --------------------------- |
| NameNode                    | <http://nn_host:port/>  | Default HTTP port is 9870.  |
| ResourceManager             | <http://rm_host:port/>  | Default HTTP port is 8088.  |
| MapReduce JobHistory Server | <http://jhs_host:port/> | Default HTTP port is 19888. |