# Ambari


+ Ambari Env
  `/var/lib/ambari-{server|agent}`

	 Ambari Conf	

  `/etc/ambari-{server|agent}`


#Step1: Download the Ambari repository on the Ambari Server host
	
	cd /etc/apt/sources.list.d
	sudo wget http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.1/ambari.list
	#sudo wget "http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.0/ambari.list"
	
	#sudo wget "http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.0/ambari.list " -O /etc/apt/sources.list.d/ambari.list
	
	sudo wget "http://public-repo-1.hortonworks.com/ambari/ubuntu12/1.x/updates/1.7.0/ambari.list"
	
	sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
	sudo apt-get update
	sudo apt-get install ambari-server

#Step 2: Install, Setup, and Start Ambari Server

	sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
	sudo apt-get update
	sudo apt-get install ambari-server


	sudo pg_createcluster 9.3 main --start
	
	sudo ambari-server setup
	sudo ambari-server start
	
	------------------------
	-- Add JDBC Driver to ambari-server classpath, and the name must be as mysql-connector-java.jar
	------------------------
	ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java-5.1.32.jar
	ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java.jar
	------------------------

#Step 3: Deploy Cluster using Ambari Web UI
	Open up a web browser and go to http://<ambari-server-host>:8080.
	Log in with username admin and password admin and follow on-screen instructions.
	
	
	## check log
	
	/var/log/ambari-server/ambari-server.pid
	/var/log/ambari-server/ambari-server.out
	/var/log/ambari-server/ambari-server.log


​	

-- CentOS

#check status
>sestatus

# disable
>vi /etc/selinux/config
SELINUX=disabled

>vi /etc/yum/pluginconf.d/refresh-packagekit.conf
# append
enabled=0
>vi /etc/profile
# append
umask 022





# Install MySQL Connector
>yum install mysql-connector-java



ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java-5.1.35.jar


# Changing the Default Ambari Server Port
/etc/ambari-server/conf/ambari.properties

## 8. Optional: Change the Ambari Server Port

By default Ambari uses port 8080 for access to Ambari Web and the REST API. If you want to change the port number, you need to edit the Ambari properties file.

| ![[Important]](https://ambari.apache.org/1.2.5/installing-hadoop-using-ambari/common/images/admon/important.png) | Important |
| :----------------------------------------------------------- | --------- |
| Ambari Server should not be running when you do this: either make the edits before you start Ambari Server the first time or bring the server down to make the edits. |           |

1. On the Ambari Server host, open `/etc/ambari-server/conf/ambari.properties` with a text editor.

2. Add the client API port property and set it to your desired port value:

   ```
   client.api.port=<port_number>
   ```

3. Start (or re-start) the Ambari Server. You can now access Ambari Web via the newly configured port:

   ```
   http://{your.ambari.server}:<port_number>
   ```

#Required Software:

#NodeJS
>sudo apt-get install nodejs
>sudo apt-get install npm

#create a symbolic  link
>sudo ln -s /usr/bin/nodejs /usr/bin/node
	#check 
	>node -v
	>npm -v

#brunch
>npm install -g brunch@1.7.17


################################################################
FAQs
# Loading....
sudo cp -rf ./public-static/* /usr/lib/ambari-server/web/


#Two-way SSL authentication is turned off on the server
	# Open /etc/ambari-server/conf/ambari.properties file ,
	# Add the following property
	security.server.two_way_ssl = true



/etc/yum/pluginconf.d/refresh-packagekit.conf
http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.4.0.0/HDP-2.4.0.0-centos6-rpm.tar.gz
http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/centos6/HDPUTILS-1.1.0.20-centos6.tar.gz
http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/centos6/HDPUTILS-1.1.0.20-centos6.tar.gz
http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.0/ambari-2.2.1.0-centos6.tar.gz



# FQDNs
127.0.0.1    thinker.ifeng.com


sudo wget -nv http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.0/ambari.list -O /etc/apt/sources/list.d/ambari.list

sudo wget -nv "http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.0.0/ambari.list" -O /etc/apt/sources/list.d/ambari.list

sudo apt-get install ambari-server ambari-log4j


/usr/local/java/jdk1.8.0_40

-------------------------------------------------------------------
-------------------------------------------------------------------
admin/Lhfei@01
-------------------------------------------------------------------
-------------------------------------------------------------------
cd /etc/apt/sources.list.d


wget -nv http://public-repo-1.hortonworks.com/HDP/ubuntu12/HDP-2.2.4.2-ubuntu12-deb.tar.gz
wget -nv http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/ubuntu12/HDP-UTILS-1.1.0.20-ubuntu12.tar.gz
-------------------------------------------------------------------

wget -nv http://public-repo-1.hortonworks.com/HDP/ubuntu12/2.x/updates/2.2.4.2/hdp.list -O /etc/apt/sources.list.d/HDP.list
-------------------------------------------------------------------


http://dogdogfish.com/2014/04/26/installing-hadoop-2-4-on-ubuntu-14-04/

#hosts
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1

-------------------------------------------------------------------
-------------------------------------------------------------------

############# Hive
-------------------------------------------------------------------
-------------------------------------------------------------------
Database Name		: hive
Database Username	: hive
Database Password	: hive
-------------------------------------------------------------------
-------------------------------------------------------------------
114.80.177.132:3306
############# Oozie
-------------------------------------------------------------------
-------------------------------------------------------------------
Oozie data dir		: /hadoop/oozie/data
Database Name		: oozie
Database Username	: oozie
Database Password	: oozie

sudo ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java-5.1.37-bin.jar

###Confirm that .jar is in the Java share directory.
### And the jar name must be name to mysql-connector-java.jar

>ls /usr/share/java/mysql-connector-java.jar
-------------------------------------------------------------------
-------------------------------------------------------------------

############# Knox
-------------------------------------------------------------------
-------------------------------------------------------------------
Knox Gateway host	: thinker.lhfei.cn
Knox Master Secret	: Lhfei
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
############ Clean Scripte


python /usr/lib/python2.6/site-packages/ambari_agent/HostCleanup.py --silent --skip=users

python /usr/lib/python2.6/site-packages/ambari_agent/HostCleanup.py --silent --skip=users

-------------------------------------------------------------------
-------------------------------------------------------------------
http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/centos6/HDP-UTILS-1.1.0.20-centos6.tar.gz

http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.3.2.0/HDP-2.3.2.0-centos6-rpm.tar.gz

http://public-repo-1.hortonworks.com/HDP/tools/2.3.2.0/hdp_manual_install_rpm_helper_files-2.3.2.0.2950.tar.gz
-------------------------------------------------------------------

-------------------------------------------------------------------
-- Uninstall HDP												---
-------------------------------------------------------------------

-------------------------
-- Stoping HDP Services	|
-------------------------

-------------------------------------------------------------------
sudo service ranger-admin stop
sudo service ranger-usersync stop


su -l knox -c "/usr/hdp/current/knox-server/bin/gateway.sh stop"

su -l oozie -c "/usr/hdp/current/oozie-server/bin/oozied.sh stop"

su -l hcat -c "/usr/hdp/current/hive-webhcat/sbin/webhcat_server.sh stop"

ps aux | awk '{print $1,$2}' | grep hive | awk '{print $2}' | xargs kill >/dev/null 2>&1


su -l hbase -c "/usr/hdp/current/hbase-regionserver/bin/hbase-daemon.sh stop regionserver"
su -l hbase -c "/usr/hdp/current/hbase-master/bin/hbase-daemon.sh stop master"


su -l yarn -c "/usr/hdp/current/hadoop-yarn-nodemanager/sbin/yarn-daemon.sh stop nodemanager"
su -l yarn -c "/usr/hdp/current/hadoop-mapreduce-historyserver/sbin/mr-jobhistory-daemon.sh stop historyserver"
su -l yarn -c "/usr/hdp/current/hadoop-yarn-resourcemanager/sbin/yarn-daemon.sh stop resourcemanager"


su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-datanode/../hadoop/sbin/hadoop-daemon.sh stop datanode"
su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh stop secondarynamenode"
su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh stop namenode"
su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh stop zkfc"

/usr/hdp/current/hadoop-hdfs-journalnode/../hadoop/sbin/hadoop-daemon.sh stop journalnode


su - zookeeper -c "export ZOOCFGDIR=/usr/hdp/current/zookeeper-server/conf ; export ZOOCFG=zoo.cfg; source /usr/hdp/current/zookeeper-server/conf/zookeeper-env.sh ; /usr/hdp/current/zookeeper-server/bin/zkServer.sh stop"


sudo /usr/bin/supervisorctl
storm-drpc RUNNING pid 9801, uptime 0:03:20
storm-nimbus RUNNING pid 9802, uptime 0:03:20
storm-ui RUNNING pid 9800, uptime 0:03:20
supervisor> stop storm-nimbus
storm-nimbus: stopped

su kafka/usr/hdp/current/kafka-broker/bin/kafka stop
-------------------------------------------------------------------

-------------------------
-- Uninstall HDP 		|
-------------------------
-------------------------------------------------------------------
yum remove knox*

yum remove ranger\*

yum remove kafka\*

yum remove storm\*

yum remove hive\*

yum remove hbase\*

yum remove phoenix\*

yum remove accumulo\*

yum remove tez\*

yum remove zookeeper\*

yum remove oozie\*

yum remove pig\*

yum remove snappy\* 

yum remove hadooplzo\*

yum remove hadoop\*

yum remove extjs-2.2-1
-------------------------------------------------------------------


sudo -u hdfs bin/hdfs dfs -put /usr/hdp/current/hadoop-client/mapreduce.tar.gz /hdp/apps/2.3.2.0-2950/mapreduce/

bin/hdfs dfs -put /usr/hdp/current/hadoop-client/mapreduce.tar.gz /hdp/apps/2.3.2.0-2950/mapreduce/


 There are 0 datanode(s) running and no node(s) are excluded in this operation.
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
 /usr/hdp/current/hadoop-client/sbin/hadoop-daemon.sh --config /usr/hdp/current/hadoop-client/conf start datanode
 /usr/hdp/current/hadoop-client/sbin/hadoop-daemon.sh --config /usr/hdp/current/hadoop-client/conf stop datanode
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
hive.exec.post.hooks Class not found:org.apache.atlas.hive.hook.HiveHook

-------------------------------------------------------------------
-------------------------------------------------------------------
[Errno 2] No such file or directory: '/usr/hdp/current/slider-client/conf'
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
WARNING: Use "yarn jar" to launch YARN applications.

Logging initialized using configuration in file:/etc/hive/2.3.2.0-2950/0/hive-log4j.properties
Exception in thread "main" java.lang.RuntimeException: java.io.IOException: Previous writer likely failed to write hdfs://centos124.thinker.cn:8020/user/hdfs/.hiveJars/hive-exec-1.2.1.2.3.2.0-2950-a97c953db414a4f792d868e2b0417578a61ccfa368048016926117b641b07f34.jar. Failing because I am unlikely to write too.
        at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:535)
        at org.apache.hadoop.hive.cli.CliDriver.run(CliDriver.java:677)
        at org.apache.hadoop.hive.cli.CliDriver.main(CliDriver.java:621)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:497)
        at org.apache.hadoop.util.RunJar.run(RunJar.java:221)
        at org.apache.hadoop.util.RunJar.main(RunJar.java:136)
Caused by: java.io.IOException: Previous writer likely failed to write hdfs://centos124.thinker.cn:8020/user/hdfs/.hiveJars/hive-exec-1.2.1.2.3.2.0-2950-a97c953db414a4f792d868e2b0417578a61ccfa368048016926117b641b07f34.jar. Failing because I am unlikely to write too.
        at org.apache.hadoop.hive.ql.exec.tez.DagUtils.localizeResource(DagUtils.java:980)
        at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.createJarLocalResource(TezSessionState.java:350)
        at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.open(TezSessionState.java:152)
        at org.apache.hadoop.hive.ql.exec.tez.TezSessionState.open(TezSessionState.java:117)
        at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:532)
		
		
## 
HiveServer2 can not be started. Start it will resloved
-------------------------------------------------------------------
-------------------------------------------------------------------

http://stackoverflow.com/questions/32759933/hive-internal-error-java-lang-classnotfoundexceptionorg-apache-atlas-hive-hook

http://stackoverflow.com/questions/32759933/hive-internal-error-java-lang-classnotfoundexceptionorg-apache-atlas-hive-hook/32824977#32824977

## miss hive-bridge-0.5.0.2.3.2.0-2950.jar
hdp  HIVE java.lang.ClassNotFoundException: org.apache.atlas.hive.hook.HiveHook
## 
bin/hdfs dfs -put /usr/hdp/2.3.2.0-2950/atlas/hook/hive/* /user/oozie/share/lib/lib_20151101195614/hive/

add jar /usr/hdp/2.3.2.0-2950/hive/lib/hive-bridge-0.5.0.2.3.2.0-2950.jar

bin/hdfs dfs -chown oozie atlas-client-0.5.0.2.3.2.0-2950.jar
bin/hdfs dfs -chown oozie atlas-typesystem-0.5.0.2.3.2.0-2950.jar
bin/hdfs dfs -chown oozie hive-bridge-0.5.0.2.3.2.0-2950.jar
bin/hdfs dfs -chown oozie json4s-ast_2.10-3.2.11.jar
bin/hdfs dfs -chown oozie json4s-core_2.10-3.2.11.jar
bin/hdfs dfs -chown oozie json4s-native_2.10-3.2.11.jar
bin/hdfs dfs -chown oozie scala-compiler-2.10.4.jar
bin/hdfs dfs -chown oozie scala-library-2.10.4.jar
bin/hdfs dfs -chown oozie scalap-2.10.4.jar
bin/hdfs dfs -chown oozie scala-reflect-2.10.4.jar
-------------------------------------------------------------------
-------------------------------------------------------------------
com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQ L server version for the right syntax to use near 'OPTION SQL_SELECT_LIMIT=DEFAULT' at line 1 

# MySQL Driver not matched the MySQL Server .

updating the soft link /usr/share/java/mysql-connector-java.jar -> mysql-connector-java-5.1.37-bin.jar 
-------------------------------------------------------------------

1 Getting Ready
-------------------------------------------------------------------
# Check the Maximum Open File Descriptors

>ulimit -Sn
>ulimit -Hn
#run the following command to set it to a suitable default:
>ulimit -n 10000
-------------------------------------------------------------------
# Enable NTP on the Cluster and on the Browser Host

>chkconfig ntpd on

#Configuring iptables
>/etc/init.d/iptables stop

# Disable SELinux and PackageKit and check the umask Value

>
>vi /etc/selinux/config
#To permanently disable SELinux set SELINUX=disableds

>vi /etc/yum/pluginconf.d/refresh-packagekit.conf
# Make the following change:

enabled=0

# Permanently changing the umask for all interactive users /etc/profile
>umask 0022
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
############################ Upgrade ##############################
-------------------------------------------------------------------
wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.2.0/ambari.repo -O /etc/yum.repos.d/ambari.repo




## add Grafana
curl -u admin:admin -H "X-Requested-By:ambari" -i -X POST http://master1.cloud.com:8080/api/v1/clusters/CLOUD_MASTER/services/AMBARI_METRICS/components/METRICS_GRAFANA
## remove Grafana
curl -u admin:admin -H "X-Requested-By: ambari" -X DELETE  http://master1.cloud.com:8080/api/v1/clusters/CLOUD_MASTER/services/AMBARI_METRICS/components/METRICS_GRAFANA


curl -u admin:admin -H "X-Requested-By:ambari" -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"METRICS_GRAFANA"}}]}' http://master1.cloud.com:8080/api/v1/clusters/CLOUD_MASTER/hosts?Hosts/host_name=master1.cloud.com
-------------------------------------------------------------------
Jira: https://issues.apache.org/jira/browse/AMBARI-11696
## Unknown column 'suspended' in 'field list'
ALTER TABLE `ambari_master`.`upgrade`   
  ADD COLUMN `suspended` TINYINT(1) NULL AFTER `suspended`;
-------------------------------------------------------------------
##
raise Fail("Configuration parameter '" + self.name + "' was not found in configurations dictionary!")
resource_management.core.exceptions.Fail: Configuration parameter 'managed_hdfs_resource_property_names' was not found in configurations dictionary!
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
-------------------------------------------------------------------
VERSION=`hdp-select status hadoop-client | sed 's/hadoop-client - \([0-9]\.[0-9]\).*/\1/'`

sudo git clone https://github.com/hortonworks-gallery/ambari-zeppelin-service.git /var/lib/ambari-server/resources/stacks/HDP/$VERSION/services/ZEPPELIN
-------------------------------------------------------------------



- [x] error: cannot open Packages database in /var/lib/rpm

  This is quite the messy situation. You may fix this by cleaning out rpm database. To fix this problem, try:

  ```sh
  # rm -f /var/lib/rpm/__db*
  # db_verify /var/lib/rpm/Packages
  # rpm --rebuilddb
  # yum clean all
  ```

  Verify that error has gone with the following yum command

  ```sh
  # yum update
  ```

