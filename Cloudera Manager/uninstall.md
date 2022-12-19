



```shell
#!/bin/bash

# 停止CM服务
service cloudera-scm-server stop
service cloudera-scm-agent stop

# 卸载CM软件包
yum -y remove cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server

# 卸载装载点
umount cm_processes
umount cm_processes
umount cm_processes

# 删除文件
rm -rf /var/log/*
rm -rf /opt/cloudera*
rm -rf /etc/systemd/system/multi-user.target.wants/cloudera*
rm -rf /etc/default/cloudera*
rm -rf /etc/cloudera*
rm -rf /var/lib/cloudera*
rm -rf /var/log/cloudera*
rm -rf /usr/lib/systemd/system/cloudera*
rm -rf /run/cloudera*
rm -rf /sys/fs/cgroup/systemd/system.slice/cloudera*
rm -rf /etc/security/limits.d/cloudera*
rm -rf /var/lib/yum/repos/x86_64/7/cloudera*
rm -rf /var/cache/yum/x86_64/7/cloudera*
rm -rf /tmp/*

rm -rf /var/lib/hadoop-* 
rm -rf /var/lib/impala 
rm -rf /var/lib/solr 
rm -rf /var/lib/zookeeper 
rm -rf /var/lib/hue 
rm -rf /var/lib/oozie 
rm -rf /var/lib/pgsql 
rm -rf /var/lib/sqoop2 
rm -rf /data/dfs/  
rm -rf /data/impala/ 
rm -rf /data/yarn/  
rm -rf /dfs/ 
rm -rf /impala/ 
rm -rf /yarn/  
rm -rf /var/run/hadoop-*/ 
rm -rf /var/run/hdfs-*/ 
rm -rf /usr/bin/hadoop* 
rm -rf /usr/bin/zookeeper* 
rm -rf /usr/bin/hbase* 
rm -rf /usr/bin/hive* 
rm -rf /usr/bin/hdfs 
rm -rf /usr/bin/mapred 
rm -rf /usr/bin/yarn 
rm -rf /usr/bin/sqoop* 
rm -rf /usr/bin/oozie 
rm -rf /etc/hadoop* 
rm -rf /etc/zookeeper* 
rm -rf /etc/hive* 
rm -rf /etc/hue 
rm -rf /etc/impala 
rm -rf /etc/sqoop* 
rm -rf /etc/oozie 
rm -rf /etc/hbase* 
rm -rf /etc/hcatalog 

rm -rf /var/lib/alternatives/impala-conf
rm -rf /var/lib/alternatives/impalad
rm -rf /var/lib/alternatives/impala-collect-diagnostics
rm -rf /var/lib/alternatives/impala-shell
rm -rf /var/lib/alternatives/impala-collect-minidumps

rm -rf /etc/alternatives/impala-shell
rm -rf /etc/alternatives/impalad
rm -rf /etc/alternatives/impala-collect-diagnostics
rm -rf /etc/alternatives/impala-conf
rm -rf /etc/alternatives/impala-collect-minidumps

rm -rf /var/log/impala*

rm -rf /var/lib/alternatives/zookeeper-client
rm -rf /var/lib/alternatives/zookeeper-server
rm -rf /var/lib/alternatives/zookeeper-conf
rm -rf /var/lib/alternatives/zookeeper-server-initialize
rm -rf /var/lib/alternatives/zookeeper-server-cleanup
rm -rf /var/lib/alternatives/zookeeper-security-migration

rm -rf /etc/alternatives/zookeeper-conf
rm -rf /etc/alternatives/zookeeper-server
rm -rf /etc/alternatives/zookeeper-server-cleanup
rm -rf /etc/alternatives/zookeeper-server-initialize
rm -rf /etc/alternatives/zookeeper-security-migration
rm -rf /etc/alternatives/zookeeper-client
rm -rf /var/log/zookeeper

# 重建数据库
mysql -uroot -p123456 -e "drop database if exists scm;drop database if exists hive;drop database if exists oozie;drop database if exists hue;create database scm DEFAULT CHARACTER SET utf8;create database hive DEFAULT CHARACTER SET utf8;create database oozie DEFAULT CHARACTER SET utf8;create database hue DEFAULT CHARACTER SET utf8;"

# 删除用户和组
userdel -r cloudera-scm
userdel -r ambari-qa  
userdel -r appmon  
userdel -r falcon  
userdel -r gpadmin  
userdel -r hcat  
userdel -r hive        
userdel -r kafka  
userdel -r mapred     
userdel -r spark  
userdel -r tez   
userdel -r yarn      
userdel -r zookeeper
userdel -r ams        
userdel -r atlas   
userdel -r flume   
userdel -r hbase    
userdel -r hdfs  
userdel -r infra-solr  
userdel -r livy   
userdel -r mongodb  
userdel -r oozie  
userdel -r sqoop  
userdel -r zeppelin
userdel -r impala
userdel -r kudu
userdel -r hadoop

groupdel hadoop
groupdel cloudera-scm
groupdel ambari-qa  
groupdel appmon  
groupdel falcon  
groupdel gpadmin  
groupdel hcat  
groupdel hive        
groupdel kafka  
groupdel mapred     
groupdel spark  
groupdel tez   
groupdel yarn      
groupdel zookeeper
groupdel ams        
groupdel atlas   
groupdel flume   
groupdel hbase    
groupdel hdfs  
groupdel infra-solr  
groupdel livy   
groupdel mongodb  
groupdel oozie  
groupdel sqoop  
groupdel zeppelin
groupdel impala
groupdel kudu

# 删除其它节点上的CDH
ssh root@172.16.1.125 /root/remove_cloudera.sh
ssh root@172.16.1.126 /root/remove_cloudera.sh
ssh root@172.16.1.127 /root/remove_cloudera.sh
```













https://cloud.tencent.com/developer/article/1537431