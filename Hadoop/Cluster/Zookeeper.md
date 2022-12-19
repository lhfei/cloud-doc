```ini
server.1=data-thinker-24:2888:3888
server.2=data-thinker-21:2888:3888
server.3=data-thinker-25:2888:3888
```





```shell
data_dir="/export/hadoop/zookeeper"
mkdir -p ${data_dir}
chown -R hdfs:hadoop ${data_dir}


data_dir="/export/var/log/zookeeper"
mkdir -p ${data_dir}
chown -R hdfs:hadoop ${data_dir}

data_dir="/export/var/run/zookeeper"
mkdir -p ${data_dir}
chown -R hdfs:hadoop ${data_dir}
```

