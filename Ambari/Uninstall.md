# Uninstalling HDP

Use the following instructions to uninstall HDP:

1. Stop all of the installed HDP services. See [Stopping HDP Services](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.3.2/bk_HDP_Reference_Guide/content/stopping_hdp_services.html) in the HDP Reference Guide.

2. If Knox is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove knox*`

   - For SLES:

     `zypper remove knox\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove knox*`

3. If Ranger is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove ranger\*`

   - For SLES:

     `zypper remove ranger\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove ranger\*`

4. If Kafka is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove kafka\*`

   - For SLES:

     `zypper remove kafka\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove kafka\*`

5. If Storm is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove storm\*`

   - For SLES:

     `zypper remove storm\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove storm\*`

6. If Hive is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove hive\*`

   - For SLES:

     `zypper remove hive\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove hive\*`

7. If HBase is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove hbase\*`

   - For SLES:

     `zypper remove hbase\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove hbase\*`

8. If Phoenix is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove phoenix\*`

   - For SLES:

     `zypper remove phoenix\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove phoenix\*`

9. If Accumulo is installed, run the following command on all the cluster nodes:

   - For RHEL/CentOS/Oracle Linux:

     `yum remove accumulo\*`

   - For SLES:

     `zypper remove accumulo\*`

   - For Ubuntu/Debian:

     `sudo apt-get remove accumulo\*`

10. If Tez is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove tez\*`

    - For SLES:

      `zypper remove tez\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove tez\*`

11. If ZooKeeper is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove zookeeper\*`

    - For SLES:

      `zypper remove zookeeper\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove zookeeper\*`

12. If Oozie is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove oozie\*`

    - For SLES:

      `zypper remove oozie\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove oozie\*`

13. If Pig is installed, run the following command on all the cluster nodes:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove pig\*`

    - For SLES:

      `zypper remove pig\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove pig\*`

14. If compression libraries are installed, run the following command on all the cluster nodes:

    `yum remove snappy\* yum remove hadooplzo\*`

15. If Knox is installed, run the following command on all the gateway host:

    - For RHEL/CentOS/Oracle Linux:

      `yum remove knox\*`

    - For SLES:

      `zypper remove knox\*`

    - For Ubuntu/Debian:

      `sudo apt-get remove knox\*`

16. Uninstall Hadoop. run the following command on all the cluster nodes:

    `yum remove hadoop\*`

17. Uninstall ExtJS libraries and MySQL connector. Run the following command on all the cluster nodes:

    `yum remove extjs-2.2-1 mysql-connector-java-5.0.8-1\*`



```
python /usr/lib/python2.6/site-packages/ambari_agent/HostCleanup.py --silent --skip=users
```













#### Article

After an unsuccessful upgrade, I was forced to completely remove HDP 2.4, Ambari 2.5 and install HDP 2.6. I wanted to avoid reinstalling the OS, so I took advantage of [this instruction](http://www.yourtechchick.com/hadoop/how-to-completely-remove-and-uninstall-hdp-components-hadoop-uninstall-on-linux-system/). Unfortunately, it is not complete. For the problem-free installation of HDP 2.6, you also need to do things like removing service users, cleaning the cron.

So here is my plan of action:

1. Stop all services in Ambari or kill them. In my case, Ambari damaged his database during downgrade and could not start. So I manually killed all the processes on all nodes:

   ```
   ps –u hdfs (see list of all services below)kill PID
   ```

   ​

2. Run python script on all cluster nodes

   ```
   python /usr/lib/python2.6/site-packages/ambari_agent/HostCleanup.py --silent --skip=users
   ```

   ​

3. Remove Hadoop packages on all nodes

   ```
   yum remove hive\*yum remove oozie\*yum remove pig\*yum remove zookeeper\*yum remove tez\*yum remove hbase\*yum remove ranger\*yum remove knox\*yum remove storm\*yum remove accumulo\*yum remove falcon\*yum remove ambari-metrics-hadoop-sink yum remove smartsense-hstyum remove slider_2_4_2_0_258yum remove ambari-metrics-monitoryum remove spark2_2_5_3_0_37-yarn-shuffleyum remove spark_2_5_3_0_37-yarn-shuffleyum remove ambari-infra-solr-client
   ```

   ​

4. Remove ambari-server (on ambari host) and ambari-agent (on all nodes)

   ```
   ambari-server stopambari-agent stopyum erase ambari-serveryum erase ambari-agent
   ```

   ​

5. Remove repositories on all nodes

   ```
   rm -rf /etc/yum.repos.d/ambari.repo /etc/yum.repos.d/HDP*yum clean all
   ```

   ​

6. Remove log folders on all nodes

   ```
   /usr/bin/rm -rf /var/log/ambari-agent
   /usr/bin/rm -rf /var/log/ambari-metrics-grafana
   /usr/bin/rm -rf /var/log/ambari-metrics-monitor
   /usr/bin/rm -rf /var/log/ambari-server/
   /usr/bin/rm -rf /var/log/falcon
   /usr/bin/rm -rf /var/log/flume
   /usr/bin/rm -rf /var/log/hadoop
   /usr/bin/rm -rf /var/log/hadoop-mapreduce
   /usr/bin/rm -rf /var/log/hadoop-yarn
   /usr/bin/rm -rf /var/log/hive
   /usr/bin/rm -rf /var/log/hive-hcatalog
   /usr/bin/rm -rf /var/log/hive2
   /usr/bin/rm -rf /var/log/hst
   /usr/bin/rm -rf /var/log/knox
   /usr/bin/rm -rf /var/log/oozie
   /usr/bin/rm -rf /var/log/solr
   /usr/bin/rm -rf /var/log/zookeeper
   ```

   ​



7. Remove Hadoop folders including HDFS data on all nodes

   ```
   /usr/bin/rm -rf /hadoop/*
   /usr/bin/rm -rf /hdfs/hadoop
   /usr/bin/rm -rf /hdfs/lost+found
   /usr/bin/rm -rf /hdfs/var
   /usr/bin/rm -rf /local/opt/hadoop
   /usr/bin/rm -rf /tmp/hadoop
   /usr/bin/rm -rf /usr/bin/hadoop
   /usr/bin/rm -rf /usr/hdp
   /usr/bin/rm -rf /var/hadoop
   ```

   ​

8. Remove config folders on all nodes

   ```
   /usr/bin/rm -rf /etc/ambari-agent
   /usr/bin/rm -rf /etc/ambari-metrics-grafana
   /usr/bin/rm -rf /etc/ambari-server
   /usr/bin/rm -rf /etc/ams-hbase
   /usr/bin/rm -rf /etc/falcon
   /usr/bin/rm -rf /etc/flume
   /usr/bin/rm -rf /etc/hadoop
   /usr/bin/rm -rf /etc/hadoop-httpfs
   /usr/bin/rm -rf /etc/hbase
   /usr/bin/rm -rf /etc/hive 
   /usr/bin/rm -rf /etc/hive-hcatalog
   /usr/bin/rm -rf /etc/hive-webhcat
   /usr/bin/rm -rf /etc/hive2
   /usr/bin/rm -rf /etc/hst
   /usr/bin/rm -rf /etc/knox 
   /usr/bin/rm -rf /etc/livy
   /usr/bin/rm -rf /etc/mahout 
   /usr/bin/rm -rf /etc/oozie
   /usr/bin/rm -rf /etc/phoenix
   /usr/bin/rm -rf /etc/pig 
   /usr/bin/rm -rf /etc/ranger-admin
   /usr/bin/rm -rf /etc/ranger-usersync
   /usr/bin/rm -rf /etc/spark2
   /usr/bin/rm -rf /etc/tez
   /usr/bin/rm -rf /etc/tez_hive2
   /usr/bin/rm -rf /etc/zookeeper
   ```

   ​

9. Remove PIDs on all nodes
   ```
   /usr/bin/rm -rf /var/run/ambari-agent
   /usr/bin/rm -rf /var/run/ambari-metrics-grafana
   /usr/bin/rm -rf /var/run/ambari-server
   /usr/bin/rm -rf /var/run/falcon
   /usr/bin/rm -rf /var/run/flume
   /usr/bin/rm -rf /var/run/hadoop 
   /usr/bin/rm -rf /var/run/hadoop-mapreduce
   /usr/bin/rm -rf /var/run/hadoop-yarn
   /usr/bin/rm -rf /var/run/hbase
   /usr/bin/rm -rf /var/run/hive
   /usr/bin/rm -rf /var/run/hive-hcatalog
   /usr/bin/rm -rf /var/run/hive2
   /usr/bin/rm -rf /var/run/hst
   /usr/bin/rm -rf /var/run/knox
   /usr/bin/rm -rf /var/run/oozie 
   /usr/bin/rm -rf /var/run/webhcat
   /usr/bin/rm -rf /var/run/zookeeper
   ```

10. Remove library folders on all nodes

    ```
    /usr/bin/rm -rf /usr/lib/ambari-agent
    /usr/bin/rm -rf /usr/lib/ambari-infra-solr-client
    /usr/bin/rm -rf /usr/lib/ambari-metrics-hadoop-sink
    /usr/bin/rm -rf /usr/lib/ambari-metrics-kafka-sink
    /usr/bin/rm -rf /usr/lib/ambari-server-backups
    /usr/bin/rm -rf /usr/lib/ams-hbase
    /usr/bin/rm -rf /usr/lib/mysql
    /usr/bin/rm -rf /var/lib/ambari-agent
    /usr/bin/rm -rf /var/lib/ambari-metrics-grafana
    /usr/bin/rm -rf /var/lib/ambari-server
    /usr/bin/rm -rf /var/lib/flume
    /usr/bin/rm -rf /var/lib/hadoop-hdfs
    /usr/bin/rm -rf /var/lib/hadoop-mapreduce
    /usr/bin/rm -rf /var/lib/hadoop-yarn 
    /usr/bin/rm -rf /var/lib/hive2
    /usr/bin/rm -rf /var/lib/knox
    /usr/bin/rm -rf /var/lib/smartsense
    /usr/bin/rm -rf /var/lib/storm
    ```

    ​

11. Clean folder /var/tmp/* on all nodes

    ```
    /usr/bin/rm -rf /var/tmp/*
    ```

12. Delete HST from cron on all nodes

    ```
    0 * * * * /usr/hdp/share/hst/bin/hst-scheduled-capture.sh sync0 
    2 * * 0 /usr/hdp/share/hst/bin/hst-scheduled-capture.sh
    ```

    ​

13. Remove databases. I remove the instances of MySQL and Postgres so that Ambari installed and configured fresh databases.

    ```
    yum remove mysql mysql-server
    yum erase postgresql
    /usr/bin/rm -rf /var/lib/pgsql
    /usr/bin/rm -rf /var/lib/mysql
    ```

    ​


14. Remove symlinks on all nodes. Especially check folders */usr/sbin* and */usr/lib/python2.6/site-packages*

    ```
    cd /usr/bin
    /usr/bin/rm -rf accumulo
    /usr/bin/rm -rf atlas-start
    /usr/bin/rm -rf atlas-stop
    /usr/bin/rm -rf beeline
    /usr/bin/rm -rf falcon
    /usr/bin/rm -rf flume-ng
    /usr/bin/rm -rf hbase
    /usr/bin/rm -rf hcat
    /usr/bin/rm -rf hdfs
    /usr/bin/rm -rf hive
    /usr/bin/rm -rf hiveserver2
    /usr/bin/rm -rf kafka
    /usr/bin/rm -rf mahout
    /usr/bin/rm -rf mapred
    /usr/bin/rm -rf oozie
    /usr/bin/rm -rf oozied.sh
    /usr/bin/rm -rf phoenix-psql
    /usr/bin/rm -rf phoenix-queryserver
    /usr/bin/rm -rf phoenix-sqlline
    /usr/bin/rm -rf phoenix-sqlline-thin
    /usr/bin/rm -rf pig
    /usr/bin/rm -rf python-wrap
    /usr/bin/rm -rf ranger-admin
    /usr/bin/rm -rf ranger-admin-start
    /usr/bin/rm -rf ranger-admin-stop
    /usr/bin/rm -rf ranger-kms
    /usr/bin/rm -rf ranger-usersync
    /usr/bin/rm -rf ranger-usersync-start
    /usr/bin/rm -rf ranger-usersync-stop
    /usr/bin/rm -rf slider
    /usr/bin/rm -rf sqoop
    /usr/bin/rm -rf sqoop-codegen
    /usr/bin/rm -rf sqoop-create-hive-table
    /usr/bin/rm -rf sqoop-eval
    /usr/bin/rm -rf sqoop-export
    /usr/bin/rm -rf sqoop-help
    /usr/bin/rm -rf sqoop-import
    /usr/bin/rm -rf sqoop-import-all-tables
    /usr/bin/rm -rf sqoop-job
    /usr/bin/rm -rf sqoop-list-databases
    /usr/bin/rm -rf sqoop-list-tables
    /usr/bin/rm -rf sqoop-merge
    /usr/bin/rm -rf sqoop-metastore
    /usr/bin/rm -rf sqoop-version
    /usr/bin/rm -rf storm
    /usr/bin/rm -rf storm-slider
    /usr/bin/rm -rf worker-lanucher
    /usr/bin/rm -rf yarn
    /usr/bin/rm -rf zookeeper-client
    /usr/bin/rm -rf zookeeper-server
    /usr/bin/rm -rf zookeeper-server-cleanup
    ```

    ​

15. Remove service users on all nodes

    ```
    userdel -r accumulo
    userdel -r ambari-qa
    userdel -r ams
    userdel -r falcon
    userdel -r flume
    userdel -r hbase
    userdel -r hcat
    userdel -r hdfs
    userdel -r hive
    userdel -r kafka
    userdel -r knox
    userdel -r mapred
    userdel -r oozie
    userdel -r ranger
    userdel -r spark
    userdel -r sqoop
    userdel -r storm
    userdel -r tez
    userdel -r yarn
    userdel -r zeppelin
    userdel -r zookeeper
    ```

    ​

16. Run **find / -name \**** on all nodes. You will definitely find several more files/folders. Remove them.

    ```
    find / -name *ambari*
    find / -name *accumulo*
    find / -name *atlas*
    find / -name *beeline*
    find / -name *falcon*
    find / -name *flume*
    find / -name *hadoop*
    find / -name *hbase*
    find / -name *hcat*
    find / -name *hdfs*
    find / -name *hdp*
    find / -name *hive*
    find / -name *hiveserver2*
    find / -name *kafka*
    find / -name *mahout*
    find / -name *mapred*
    find / -name *oozie*
    find / -name *phoenix*
    find / -name *pig*
    find / -name *ranger*
    find / -name *slider*
    find / -name *sqoop*
    find / -name *storm*
    find / -name *yarn*
    find / -name *zookeeper*
    ```

    ​

17. Reboot all nodes

    ```
    reboot
    ```

    ​

