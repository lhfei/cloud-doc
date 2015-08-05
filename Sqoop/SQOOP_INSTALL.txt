--catalina.properties
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/common/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/common/lib/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/hdfs/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/hdfs/lib/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/mapreduce/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/mapreduce/lib/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/yarn/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/yarn/lib/*.jar,\
/usr/local/hadoop/hadoop-2.6.0/share/hadoop/tools/lib/*.jar



/usr/local/hadoop/hadoop-2.6.0/share/hadoop/common/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/common/lib/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/hdfs/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/hdfs/lib/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/mapreduce/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/mapreduce/lib/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/yarn/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/yarn/lib/*.jar,/usr/local/hadoop/hadoop-2.6.0/share/hadoop/tools/lib/*.jar

-- copy ${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-auth-2.6.0.jar to $SQOOP_HOME/server/lib

-- vi sqoop.properties 
# Hadoop configuration directory
org.apache.sqoop.submission.engine.mapreduce.configuration.directory=/usr/local/hadoop/hadoop-2.6.0/etc/hadoop

jdbc:mysql://ubuntu145.thinker.cn:3306/sqoop_db?createDatabaseIfNotExist=true

--
set server --host ubuntu144.thinker.cn  -p 12000 -w sqoop



--sqoo.properties
com.mysql.jdbc.Driver
jdbc:mysql://ubuntu145.thinker.cn:3306/sqoop?createDatabaseIfNotExist=true
sqoop
Ifeng01

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
>show connector
+----+------------------------+---------+------------------------------------------------------+----------------------+
| Id |          Name          | Version |                        Class                         | Supported Directions |
+----+------------------------+---------+------------------------------------------------------+----------------------+
| 1  | generic-jdbc-connector | 1.99.6  | org.apache.sqoop.connector.jdbc.GenericJdbcConnector | FROM/TO              |
| 2  | kite-connector         | 1.99.6  | org.apache.sqoop.connector.kite.KiteConnector        | FROM/TO              |
| 3  | hdfs-connector         | 1.99.6  | org.apache.sqoop.connector.hdfs.HdfsConnector        | FROM/TO              |
| 4  | kafka-connector        | 1.99.6  | org.apache.sqoop.connector.kafka.KafkaConnector      | TO                   |
+----+------------------------+---------+------------------------------------------------------+----------------------+
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
>create link -c 1
Creating link for connector with id 2
Please fill following values to create new link object
Name: MySQL-Link

Link configuration
JDBC Driver Class: com.mysql.jdbc.Driver
JDBC Connection String: jdbc:mysql://ubuntu146.thinker.cn:3306/vdn_dashboard
Username: sqoop
Password: Ifeng01
JDBC Connection Properties:
There are currently 0 values in the map:
entry#protocol=tcp
New link was successfully created with validation status OK and persistent id 1
-------------------------------------------------------------------------------------
>show link
+----+------------+--------------+------------------------+---------+
| Id |    Name    | Connector Id |     Connector Name     | Enabled |
+----+------------+--------------+------------------------+---------+
| 1  | MySQL-Link | 1            | generic-jdbc-connector | true    |
+----+------------+--------------+------------------------+---------+
-------------------------------------------------------------------------------------
>create link -c 3
Creating link for connector with id 3
Please fill following values to create new link object
Name: HDFS-Link

Link configuration

HDFS URI: hdfs://ubuntu144:9000/
Hadoop conf directory: /usr/local/hadoop/hadoop-2.6.0/etc/hadoop
New link was successfully created with validation status OK and persistent id 2
-------------------------------------------------------------------------------------
>show link
+----+------------+--------------+------------------------+---------+
| Id |    Name    | Connector Id |     Connector Name     | Enabled |
+----+------------+--------------+------------------------+---------+
| 1  | MySQL-Link | 1            | generic-jdbc-connector | true    |
| 2  | HDFS-Link  | 3            | hdfs-connector         | true    |
+----+------------+--------------+------------------------+---------+
-------------------------------------------------------------------------------------
sqoop export --connect jdbc:mysql://ubuntu146.thinker.cn:3306/vdn_dashboard/ --table VDN_IP_REPO --export-dir /user/hive/warehouse/vdn_ip_repo/IP_LIST.TXT  --input-fields-terminated-by '\t';
-------------------------------------------------------------------------------------
>create job -f 1 -t 2
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
sqoop:000> create link -c 2
Creating link for connector with id 2
Please fill following values to create new link object
Name: First Link

Link configuration
JDBC Driver Class: com.mysql.jdbc.Driver
JDBC Connection String: jdbc:mysql://mysql.server/database
Username: sqoop
Password: *****
JDBC Connection Properties:
There are currently 0 values in the map:
entry#protocol=tcp
New link was successfully created with validation status OK and persistent id 1






HDFS-Link
hdfs://114.80.177.144:9000

/usr/local/hadoop/hadoop-2.6.0/etc/hadoop


