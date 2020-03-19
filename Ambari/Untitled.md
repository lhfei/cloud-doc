





```shell
useradd lhfei -d /home/lhfei -s /bin/bash -g supdev hadoop


```





```shell
sudo yum remove -y hive\*
sudo yum remove -y oozie\*
sudo yum remove -y pig\*
sudo yum remove -y zookeeper\*
sudo yum remove -y tez\*
sudo yum remove -y hbase\*
sudo yum remove -y ranger\*
sudo yum remove -y knox\*
sudo yum remove -y storm\*
sudo yum remove -y accumulo\*
sudo yum remove -y falcon\*
sudo yum remove -y ambari-metrics-hadoop-sink 
sudo yum remove -y smartsense-hst
sudo yum remove -y slider_2_4_2_0_258
sudo yum remove -y ambari-metrics-monitor
sudo yum remove -y spark2_\*
sudo yum remove -y spark-\*
sudo yum remove -y ambari-infra-solr-client
sudo yum remove -y ambari-infra-solr
sudo yum remove -y ambari-metrics-grafana
sudo yum remove -y atlas-metadata_\*
sudo yum remove -y libarchive-\*
sudo yum remove -y druid_\*
sudo yum remove -y smartmontools-\*
sudo yum remove -y libsmartcols-\*
sudo yum remove -y ambari-metrics-collector-\*
sudo yum remove -y hdp-select-\*
sudo yum remove -y bigtop-jsvc




rm -rf /export/grid/12/var/log/ambari-agent
rm -rf /export/grid/12/var/log/ambari-metrics-grafana
rm -rf /export/grid/12/var/log/ambari-metrics-monitor
rm -rf /export/grid/12/var/log/ambari-server/
rm -rf /export/grid/12/var/log/falcon
rm -rf /export/grid/12/var/log/flume
rm -rf /export/grid/12/var/log/hadoop/*
rm -rf /export/grid/12/var/log/hadoop-mapreduce
rm -rf /export/grid/12/var/log/hadoop-yarn
rm -rf /export/grid/12/var/log/hive
rm -rf /export/grid/12/var/log/hive-hcatalog
rm -rf /export/grid/12/var/log/hive2
rm -rf /export/grid/12/var/log/hst
rm -rf /export/grid/12/var/log/knox
rm -rf /export/grid/12/var/log/oozie
rm -rf /export/grid/12/var/log/solr
rm -rf /export/grid/12/var/log/zookeeper
rm -rf /export/grid/12/var/log/kafka
rm -rf /export/grid/12/kafka-logs
```

