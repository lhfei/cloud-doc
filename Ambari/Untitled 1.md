## [Completely uninstall HDP and Ambari ](https://community.cloudera.com/t5/Community-Articles/Completely-uninstall-HDP-and-Ambari/ta-p/245451)



Labels

- ### [Apache Ambari](https://community.cloudera.com/t5/Community-Articles/tkb-p/CommunityArticles/label-name/apache ambari?labels=apache+ambari)

-  

- ### [Hortonworks Data Platform (HDP)](https://community.cloudera.com/t5/Community-Articles/tkb-p/CommunityArticles/label-name/hortonworks data platform (hdp)?labels=hortonworks+data+platform+(hdp))

[![img](https://xgkfq28377.i.lithium.com/t5/image/serverpage/avatar-name/hominid/avatar-theme/chrome/avatar-collection/Monsters/avatar-display-size/profile/version/2?xdesc=1.0)](https://community.cloudera.com/t5/user/viewprofilepage/user-id/43760)



After an unsuccessful upgrade, I was forced to completely remove HDP 2.4, Ambari 2.5 and install HDP 2.6. I wanted to avoid reinstalling the OS, so I took advantage of [this instruction](http://www.yourtechchick.com/hadoop/how-to-completely-remove-and-uninstall-hdp-components-hadoop-uninstall-on-linux-system/). Unfortunately, it is not complete. For the problem-free installation of HDP 2.6, you also need to do things like removing service users, cleaning the cron.

So here is my plan of action:

1. Stop all services in Ambari or kill them. In my case, Ambari damaged his database during downgrade and could not start. So I manually killed all the processes on all nodes:

```
ps -u | grep hdfs (see list of all services below)
kill PID
```

2. Run python script on all cluster nodes

```
/usr/lib/ambari-agent/lib/ambari_agent/HostCleanup.py --silent --skip=users
```

3. Remove Hadoop packages on all nodes

```
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
sudo yum remove -y atlas-metadata_\*
sudo yum remove -y libarchive-\*
sudo yum remove -y druid_\*
sudo yum remove -y smartmontools-\*
sudo yum remove -y libsmartcols-\*
sudo yum remove -y ambari-metrics-collector-\*
sudo yum remove -y hdp-select-\*
```

4. Remove ambari-server (on ambari host) and ambari-agent (on all nodes)

```
sudo ambari-server stop
sudo ambari-agent stop
sudo yum erase -y ambari-server
sudo yum erase -y ambari-agent
```

5. Remove repositories on all nodes

```
rm -rf /etc/yum.repos.d/ambari.repo /etc/yum.repos.d/HDP*
yum clean all
```

6. Remove log folders on all nodes

```
rm -rf /var/log/ambari-agent
rm -rf /var/log/ambari-metrics-grafana
rm -rf /var/log/ambari-metrics-monitor
rm -rf /var/log/ambari-server/
rm -rf /var/log/falcon
rm -rf /var/log/flume
rm -rf /var/log/hadoop
rm -rf /var/log/hadoop-mapreduce
rm -rf /var/log/hadoop-yarn
rm -rf /var/log/hive
rm -rf /var/log/hive-hcatalog
rm -rf /var/log/hive2
rm -rf /var/log/hst
rm -rf /var/log/knox
rm -rf /var/log/oozie
rm -rf /var/log/solr
rm -rf /var/log/zookeeper
```



```ini
rm -rf /export/var/log/ambari-agent
rm -rf /export/var/log/ambari-metrics-grafana
rm -rf /export/var/log/ambari-metrics-monitor
rm -rf /export/var/log/ambari-server/
rm -rf /export/var/log/falcon
rm -rf /export/var/log/flume
rm -rf /export/var/log/hadoop
rm -rf /export/var/log/hadoop-mapreduce
rm -rf /export/var/log/hadoop-yarn
rm -rf /export/var/log/hive
rm -rf /export/var/log/hive-hcatalog
rm -rf /export/var/log/hive2
rm -rf /export/var/log/hst
rm -rf /export/var/log/knox
rm -rf /export/var/log/oozie
rm -rf /export/var/log/solr
rm -rf /export/var/log/zookeeper
```



7. Remove Hadoop folders including HDFS data on all nodes

```
rm -rf /hadoop/*
rm -rf /hdfs/hadoop
rm -rf /hdfs/lost+found
rm -rf /hdfs/var
rm -rf /local/opt/hadoop
rm -rf /tmp/hadoop
rm -rf /usr/bin/hadoop
rm -rf /usr/hdp
rm -rf /var/hadoop
```

8. Remove config folders on all nodes

```
sudo rm -rf /etc/ambari-agent
sudo rm -rf /etc/ambari-metrics-grafana
sudo rm -rf /etc/ambari-server
sudo rm -rf /etc/ams-hbase
sudo rm -rf /etc/kafka
sudo rm -rf /etc/falcon
sudo rm -rf /etc/flume
sudo rm -rf /etc/hadoop
sudo rm -rf /etc/hadoop-httpfs
sudo rm -rf /etc/hbase
sudo rm -rf /etc/hive 
sudo rm -rf /etc/hive-hcatalog
sudo rm -rf /etc/hive-webhcat
sudo rm -rf /etc/hive2
sudo rm -rf /etc/hive_llap
sudo rm -rf /etc/hst
sudo rm -rf /etc/knox 
sudo rm -rf /etc/livy
sudo rm -rf /etc/mahout 
sudo rm -rf /etc/oozie
sudo rm -rf /etc/phoenix
sudo rm -rf /etc/pig 
sudo rm -rf /etc/ranger-admin
sudo rm -rf /etc/ranger-usersync
sudo rm -rf /etc/spark2
sudo rm -rf /etc/tez
sudo rm -rf /etc/tez_hive2
sudo rm -rf /etc/zookeeper
```

9. Remove PIDs on all nodes

```
sudo rm -rf /var/run/ambari-agent
sudo rm -rf /var/run/ambari-metrics-grafana
sudo rm -rf /var/run/ambari-server
sudo rm -rf /var/run/falcon
sudo rm -rf /var/run/flume
sudo rm -rf /var/run/hadoop 
sudo rm -rf /var/run/hadoop-mapreduce
sudo rm -rf /var/run/hadoop-yarn
sudo rm -rf /var/run/hbase
sudo rm -rf /var/run/hive
sudo rm -rf /var/run/hive-hcatalog
sudo rm -rf /var/run/hive2
sudo rm -rf /var/run/hst
sudo rm -rf /var/run/knox
sudo rm -rf /var/run/oozie 
sudo rm -rf /var/run/webhcat
sudo rm -rf /var/run/zookeeper
```

10. Remove library folders on all nodes

```
sudo rm -rf /usr/lib/ambari-*
sudo rm -rf /usr/lib/ambari-agent
sudo rm -rf /usr/lib/ambari-infra-solr-client
sudo rm -rf /usr/lib/ambari-metrics-hadoop-sink
sudo rm -rf /usr/lib/ambari-metrics-kafka-sink
sudo rm -rf /usr/lib/ambari-server-backups
sudo rm -rf /usr/lib/ams-hbase
sudo rm -rf /usr/lib/mysql
sudo rm -rf /var/lib/ambari-agent
sudo rm -rf /var/lib/ambari-metrics-grafana
sudo rm -rf /var/lib/ambari-server
sudo rm -rf /var/lib/flume
sudo rm -rf /var/lib/hadoop-hdfs
sudo rm -rf /var/lib/hadoop-mapreduce
sudo rm -rf /var/lib/hadoop-yarn 
sudo rm -rf /var/lib/hive2
sudo rm -rf /var/lib/knox
sudo rm -rf /var/lib/smartsense
sudo rm -rf /var/lib/storm
```

11. Clean folder /var/tmp/* on all nodes

```
sudo rm -rf /var/tmp/*
```

12. Delete HST from cron on all nodes

```
0 * * * * /usr/hdp/share/hst/bin/hst-scheduled-capture.sh sync
0 2 * * 0 /usr/hdp/share/hst/bin/hst-scheduled-capture.sh
```

13. Remove databases. I remove the instances of MySQL and Postgres so that Ambari installed and configured fresh databases.

```
yum remove mysql mysql-server
yum erase postgresql
rm -rf /var/lib/pgsql
rm -rf /var/lib/mysql
```

14. Remove symlinks on all nodes. Especially check folders */usr/sbin* and */usr/lib/python2.6/site-packages*

```
cd /usr/bin

sudo rm -rf accumulo
sudo rm -rf atlas-start
sudo rm -rf atlas-stop
sudo rm -rf beeline
sudo rm -rf falcon
sudo rm -rf flume-ng
sudo rm -rf hbase
sudo rm -rf hcat
sudo rm -rf hdfs
sudo rm -rf hive
sudo rm -rf hiveserver2
sudo rm -rf kafka
sudo rm -rf mahout
sudo rm -rf mapred
sudo rm -rf oozie
sudo rm -rf oozied.sh
sudo rm -rf phoenix-psql
sudo rm -rf phoenix-queryserver
sudo rm -rf phoenix-sqlline
sudo rm -rf phoenix-sqlline-thin
sudo rm -rf pig
sudo rm -rf python-wrap
sudo rm -rf ranger-admin
sudo rm -rf ranger-admin-start
sudo rm -rf ranger-admin-stop
sudo rm -rf ranger-kms
sudo rm -rf ranger-usersync
sudo rm -rf ranger-usersync-start
sudo rm -rf ranger-usersync-stop
sudo rm -rf slider
sudo rm -rf sqoop
sudo rm -rf sqoop-codegen
sudo rm -rf sqoop-create-hive-table
sudo rm -rf sqoop-eval
sudo rm -rf sqoop-export
sudo rm -rf sqoop-help
sudo rm -rf sqoop-import
sudo rm -rf sqoop-import-all-tables
sudo rm -rf sqoop-job
sudo rm -rf sqoop-list-databases
sudo rm -rf sqoop-list-tables
sudo rm -rf sqoop-merge
sudo rm -rf sqoop-metastore
sudo rm -rf sqoop-version
sudo rm -rf storm
sudo rm -rf storm-slider
sudo rm -rf worker-lanucher
sudo rm -rf yarn
sudo rm -rf zookeeper-client
sudo rm -rf zookeeper-server
sudo rm -rf zookeeper-server-cleanup
```

15. Remove service users on all nodes

```
sudo userdel -r accumulo
sudo userdel -r ambari-qa
sudo userdel -r ams
sudo userdel -r falcon
sudo userdel -r flume
sudo userdel -r hbase
sudo userdel -r hcat
sudo userdel -r hdfs
sudo userdel -r hive
sudo userdel -r kafka
sudo userdel -r knox
sudo userdel -r mapred
sudo userdel -r oozie
sudo userdel -r ranger
sudo userdel -r spark
sudo userdel -r sqoop
sudo userdel -r storm
sudo userdel -r tez
sudo userdel -r yarn
sudo userdel -r zeppelin
sudo userdel -r zookeeper
```

16. Run find / -name ** on all nodes. You will definitely find several more files/folders. Remove them.

```
sudo find / -name *ambari*
sudo find / -name *accumulo*
sudo find / -name *atlas*
sudo find / -name *beeline*
sudo find / -name *falcon*
sudo find / -name *flume*
sudo find / -name *hadoop*
sudo find / -name *hbase*
sudo find / -name *hcat*
sudo find / -name *hdfs*
sudo find / -name *hdp*
sudo find / -name *hive*
sudo find / -name *hiveserver2*
sudo find / -name *kafka*
sudo find / -name *mahout*
sudo find / -name *mapred*
sudo find / -name *oozie*
sudo find / -name *phoenix*
sudo find / -name *pig*
sudo find / -name *ranger*
sudo find / -name *slider*
sudo find / -name *sqoop*
sudo find / -name *storm*
sudo find / -name *yarn*
sudo find / -name *zookeeper*
```

17. Reboot all nodes

```
reboot
```