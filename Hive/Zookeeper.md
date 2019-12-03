

```sh
/usr/hdp/current/zookeeper-client/bin/zkCli.sh -server host-192-168-45-169:2181,host-192-168-45-170:2181,host-192-168-45-171:2181,host-192-168-45-172:2181,host-192-168-45-173:2181
```

 

## create hiveserver2 node

```
# open a zookeeper terminal
/usr/hdp/current/zookeeper-client/bin/zkCli.sh -server host-192-168-45-169:2181,host-192-168-45-170:2181,host-192-168-45-171:2181,host-192-168-45-172:2181,host-192-168-45-173:2181

# create '/hiveserver2' node, and set hiveserver2 ip as value
# hiveserver2 at 192.168.45.173
create /hiveserver2 192.168.45.173

# create a sub node in /hiveserver2, and set some values as below
# check your hive_version by `hive --version`
# hive_version = 3.1.0.3.0.1.0-187

create /hiveserver2/serverUri=host-192-168-45-173:10000;version=3.1.0.3.0.1.0-187;sequence=0000000001 hive.server2.instance.uri=host-192-168-45-173:10000;hive.server2.authentication=NONE;hive.server2.transport.mode=binary;hive.server2.thrift.sasl.qop=auth;hive.server2.thrift.bind.host=host-192-168-45-173;hive.server2.thrift.port=10000;hive.server2.use.SSL=false

```



### Check port status

```shell
sudo lsof -i -P | grep -i "listen"
```

