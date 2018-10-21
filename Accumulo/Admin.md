





### Reset Root Passwd

```shell
su accumulo
ACCUMULO_CONF_DIR=/etc/accumulo/conf/server accumulo init --reset-security
```





## NoAuthException: KeeperErrorCode = NoAuth for /accumulo/ca8f1eff-042c-46b6-9365-261e98fc6f0e/masters/goal_state

`su` to `accumulo` user and `cd` to **$ACCUMULO_HOE**

```shell
[accumulo@host-10-182-61-125 accumulo]$ ./bin/accumulo org.apache.accumulo.server.util.ChangeSecret
old zookeeper password: Accumulo@Instance
new zookeeper password: 
2018-09-30 10:56:54,184 [client.ClientConfiguration] INFO : Loaded client configuration file /usr/hdp/current/accumulo-client/conf/client.conf
2018-09-30 10:56:54,186 [client.ClientConfiguration] INFO : Loaded client configuration file /etc/accumulo/conf/client.conf
2018-09-30 10:56:55,767 [fs.VolumeManagerImpl] WARN : dfs.datanode.synconclose set to false in hdfs-site.xml: data loss is possible on hard system reset or power loss
New instance id is 937ff8b1-a1ad-4428-82a9-2f51dbb7e5f3
Be sure to put your new secret in accumulo-site.xml
```

