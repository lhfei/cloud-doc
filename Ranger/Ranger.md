





#### Recommended Changes

Based on your configuration changes, Ambari is recommending the following dependent configuration changes.
Ambari will update all checked configuration changes to the **Recommended Value**. Uncheck any configuration to retain the **Current Value**.

|      | Property                                 | Service | Config Group                      | File Name                      | Current ValueRecommended Value           |
| ---- | ---------------------------------------- | ------- | --------------------------------- | ------------------------------ | ---------------------------------------- |
|      | dfs.datanode.data.dir                    | HDFS    | [Default](javascript:void(null);) | hdfs-site                      | /hadoop/hdfs/data/hadoop/hdfs/data,/home/hadoop/hdfs/data |
|      | dfs.namenode.name.dir                    | HDFS    | [Default](javascript:void(null);) | hdfs-site                      | /hadoop/hdfs/namenode/hadoop/hdfs/namenode,/home/hadoop/hdfs/namenode |
|      | ranger-hdfs-plugin-enabled               | HDFS    | [Default](javascript:void(null);) | ranger-hdfs-plugin-properties  | Property undefinedNo                     |
|      | ranger.plugin.hdfs.policy.rest.url       | HDFS    | [Default](javascript:void(null);) | ranger-hdfs-security           | Property undefinedhttp://openldap.jd.com:6080 |
|      | xasecure.audit.destination.hdfs          | HDFS    | [Default](javascript:void(null);) | ranger-hdfs-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.hdfs.dir      | HDFS    | [Default](javascript:void(null);) | ranger-hdfs-audit              | Property undefinedhdfs://openldap.jd.com:8020/ranger/audit |
|      | xasecure.audit.destination.solr          | HDFS    | [Default](javascript:void(null);) | ranger-hdfs-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.solr.urls     | HDFS    | [Default](javascript:void(null);) | ranger-hdfs-audit              | Property undefined                       |
|      | xasecure.audit.destination.solr.zookeepers | HDFS    | [Default](javascript:void(null);) | ranger-hdfs-audit              | Property undefinedNONE                   |
|      | ranger-yarn-plugin-enabled               | YARN    | [Default](javascript:void(null);) | ranger-yarn-plugin-properties  | Property undefinedNo                     |
|      | ranger.plugin.yarn.policy.rest.url       | YARN    | [Default](javascript:void(null);) | ranger-yarn-security           | Property undefinedhttp://openldap.jd.com:6080 |
|      | xasecure.audit.destination.hdfs          | YARN    | [Default](javascript:void(null);) | ranger-yarn-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.hdfs.dir      | YARN    | [Default](javascript:void(null);) | ranger-yarn-audit              | Property undefinedhdfs://openldap.jd.com:8020/ranger/audit |
|      | xasecure.audit.destination.solr          | YARN    | [Default](javascript:void(null);) | ranger-yarn-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.solr.urls     | YARN    | [Default](javascript:void(null);) | ranger-yarn-audit              | Property undefined                       |
|      | xasecure.audit.destination.solr.zookeepers | YARN    | [Default](javascript:void(null);) | ranger-yarn-audit              | Property undefinedNONE                   |
|      | yarn.nodemanager.local-dirs              | YARN    | [Default](javascript:void(null);) | yarn-site                      | /hadoop/yarn/local/hadoop/yarn/local,/home/hadoop/yarn/local |
|      | yarn.nodemanager.log-dirs                | YARN    | [Default](javascript:void(null);) | yarn-site                      | /hadoop/yarn/log/hadoop/yarn/log,/home/hadoop/yarn/log |
|      | ranger.plugin.hive.policy.rest.url       | Hive    | [Default](javascript:void(null);) | ranger-hive-security           | Property undefinedhttp://openldap.jd.com:6080 |
|      | xasecure.audit.destination.hdfs          | Hive    | [Default](javascript:void(null);) | ranger-hive-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.hdfs.dir      | Hive    | [Default](javascript:void(null);) | ranger-hive-audit              | Property undefinedhdfs://openldap.jd.com:8020/ranger/audit |
|      | xasecure.audit.destination.solr          | Hive    | [Default](javascript:void(null);) | ranger-hive-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.solr.urls     | Hive    | [Default](javascript:void(null);) | ranger-hive-audit              | Property undefined                       |
|      | xasecure.audit.destination.solr.zookeepers | Hive    | [Default](javascript:void(null);) | ranger-hive-audit              | Property undefinedNONE                   |
|      | policy_user                              | HBase   | [Default](javascript:void(null);) | ranger-hbase-plugin-properties | Property undefinedambari-qa              |
|      | ranger-hbase-plugin-enabled              | HBase   | [Default](javascript:void(null);) | ranger-hbase-plugin-properties | Property undefinedNo                     |
|      | ranger.plugin.hbase.policy.rest.url      | HBase   | [Default](javascript:void(null);) | ranger-hbase-security          | Property undefinedhttp://openldap.jd.com:6080 |
|      | xasecure.audit.destination.hdfs          | HBase   | [Default](javascript:void(null);) | ranger-hbase-audit             | Property undefinedtrue                   |
|      | xasecure.audit.destination.hdfs.dir      | HBase   | [Default](javascript:void(null);) | ranger-hbase-audit             | Property undefinedhdfs://openldap.jd.com:8020/ranger/audit |
|      | xasecure.audit.destination.solr          | HBase   | [Default](javascript:void(null);) | ranger-hbase-audit             | Property undefinedtrue                   |
|      | xasecure.audit.destination.solr.urls     | HBase   | [Default](javascript:void(null);) | ranger-hbase-audit             | Property undefined                       |
|      | xasecure.audit.destination.solr.zookeepers | HBase   | [Default](javascript:void(null);) | ranger-hbase-audit             | Property undefinedNONE                   |
|      | ranger-kafka-plugin-enabled              | Kafka   | [Default](javascript:void(null);) | ranger-kafka-plugin-properties | Property undefinedNo                     |
|      | ranger.plugin.kafka.policy.rest.url      | Kafka   | [Default](javascript:void(null);) | ranger-kafka-security          | Property undefinedhttp://openldap.jd.com:6080 |
|      | xasecure.audit.destination.hdfs          | Kafka   | [Default](javascript:void(null);) | ranger-kafka-audit             | Property undefinedtrue                   |
|      | xasecure.audit.destination.hdfs.dir      | Kafka   | [Default](javascript:void(null);) | ranger-kafka-audit             | Property undefinedhdfs://openldap.jd.com:8020/ranger/audit |
|      | xasecure.audit.destination.solr          | Kafka   | [Default](javascript:void(null);) | ranger-kafka-audit             | Property undefinedtrue                   |
|      | xasecure.audit.destination.solr.urls     | Kafka   | [Default](javascript:void(null);) | ranger-kafka-audit             | Property undefined                       |
|      | xasecure.audit.destination.solr.zookeepers | Kafka   | [Default](javascript:void(null);) | ranger-kafka-audit             | Property undefinedNONE                   |
|      | ranger-knox-plugin-enabled               | Knox    | [Default](javascript:void(null);) | ranger-knox-plugin-properties  | Property undefinedNo                     |
|      | ranger.plugin.knox.policy.rest.url       | Knox    | [Default](javascript:void(null);) | ranger-knox-security           | Property undefinedhttp://openldap.jd.com:6080 |
|      | xasecure.audit.destination.hdfs          | Knox    | [Default](javascript:void(null);) | ranger-knox-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.hdfs.dir      | Knox    | [Default](javascript:void(null);) | ranger-knox-audit              | Property undefinedhdfs://openldap.jd.com:8020/ranger/audit |
|      | xasecure.audit.destination.solr          | Knox    | [Default](javascript:void(null);) | ranger-knox-audit              | Property undefinedtrue                   |
|      | xasecure.audit.destination.solr.urls     | Knox    | [Default](javascript:void(null);) | ranger-knox-audit              | Property undefined                       |
|      | xasecure.audit.destination.solr.zookeepers | Knox    | [Default](javascript:void(null);) | ranger-knox-audit              | Property undefinedNONE                   |
|      | ranger.jpa.jdbc.url                      | Ranger  | [Default](javascript:void(null);) | ranger-admin-site              | jdbc:mysql://:3306/rangerjdbc:mysql://openldap.jd.com:3306/cloud_ranger |
|      | ranger_privelege_user_jdbc_url           | Ranger  | [Default](javascript:void(null);) | ranger-env                     | jdbc:mysql://:3306jdbc:mysql://openldap.jd.com:3306 |