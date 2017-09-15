FAQs
====


>## MR

Container complete event for unknown container id *container_1496195987638_0582_01_000008*



> ## HistoryServer

#### port[10020] connection refused

History Server default port is ```10020```.

```xml
 <property>
    <name>mapreduce.jobhistory.address</name>
    <value>{HISTORY_SERVER_HOSTNAME}:10020</value>
  </property>
  
 <property>
    <name>mapreduce.jobhistory.webapp.address</name>
    <value>{HISTORY_SERVER_HOSTNAME}:19888</value>
 </property>
```

Start Historyserver command:

```sh
$sbin/mr-jobhistory-daemon.sh --config {YOUR_HADOOP_CONF_DIR} start historyserver
```
