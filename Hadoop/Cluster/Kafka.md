



```shell
data_dir="/export/hadoop/kafka-logs"
mkdir -p ${data_dir}
chown -R hdfs:hadoop ${data_dir}

data_dir="/export/var/run/kafka"
mkdir -p ${data_dir}
chown -R hdfs:hadoop ${data_dir}

data_dir="/export/var/log/kafka"
mkdir -p ${data_dir}
chown -R hdfs:hadoop ${data_dir}
```



