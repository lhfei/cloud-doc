

### Hosts

```
10.182.60.8      host-10-182-60-8
10.182.60.113    host-10-182-60-113
10.182.60.142    host-10-182-60-142
10.182.60.149    host-10-182-60-149
```



### Zookeeper Client

```
host-10-182-60-8:2181,host-10-182-60-113:2181,host-10-182-60-142:2181,host-10-182-60-149:2181
```



### Connect to Drill Shell



```shell
jdbc:drill:zk=<zk1host>:<port> select * from sys.drillbits;
```



```shell
sqlline –u jdbc:drill:[schema=<storage plugin>;]zk=<zk name>[:<port>][,<zk name2>[:<port>]... ]
```



```shell
bin/sqlline –u jdbc:drill:schema=dfs;zk=centos26
```



```shell
bin/sqlline –u jdbc:drill:zk=cento23,zk=centos24,zk=centos26:5181
```



#### Full Example

```
# connect to JDBC
./bin/sqlline -u jdbc:drill:zk=host-10-182-60-8:2181,host-10-182-60-113:2181,host-10-182-60-142:2181,host-10-182-60-149:2181
```



```sh
./bin/drill-conf jdbc:drill:zk=host-10-182-60-8:2181,host-10-182-60-113:2181,host-10-182-60-142:2181,host-10-182-60-149:2181

```



```sh
./bin/drill-conf jdbc:drill:zk=JXQ-23-239-102.h.chinabank.com.cn:2181,JXQ-23-239-126.h.chinabank.com.cn:2181
```





`Tips`: 

​	Type `.quit` or use `Ctrl`+`D` to exist the sqline terminal. 

### Support HDFS NN HA

Copy `hdfs-site.xml` to `DRILL_HOME/conf` on each drillbits node. And then restart the drillbits service on each of those nodes

```sh
cd $DRILL_HOME
ln -s $HADOOP_CONF_DIR/hdfs-site.xml hdfs-site.xml

# restart all drillbits nodes
```

