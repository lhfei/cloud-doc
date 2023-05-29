## Validating the Phoenix Installation

**Validating a Native Phoenix Installation on an Unsecured Cluster**

To validate your installation, log in as the hbase user, navigate to the Phoenix home directory, and run the following smoke tests:

```
cd /usr/hdp/current/phoenix-client/bin/ ./psql.py
localhost:2181:/hbase-unsecure
/usr/hdp/current/phoenix-client/doc/examples/WEB_STAT.sql
/usr/hdp/current/phoenix-client/doc/examples/WEB_STAT.csv
/usr/hdp/current/phoenix-client/doc/examples/WEB_STAT_QUERIES.sql
```

Where `localhost` is your ZooKeeper node.



**Example**

```shell
./bin/sqlline.py a01-r03-i164-107-515wbkc.test.local,a01-r03-i164-101-515w96w.test.local,a01-r03-i164-108-515wble.test.local:2181:/hbase-unsecure
```



**Validating a Native Phoenix Installation on a Cluster Secured with Kerberos**

To validate your installation, log in as the hbase user, and perform the following actions:

1. Set the HBASE_CONF_PATH for a secured cluster:

   ```
   export HBASE_CONF_PATH=/etc/hbase/conf:/etc/hadoop/conf
   ```

   | ![[Note]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.5/bk_command-line-installation/common/images/admon/note.png) | Note |
   | ------------------------------------------------------------ | ---- |
   | For more information, see [Configuring Phoenix to Run in a Secure Cluster](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.5/bk_command-line-installation/content/configuring-phoenix-to-run-in-a-secure-cluster.html) |      |

2. Obtain a valid Kerberos ticket by running `kinit`. For example:

   ```
   kinit -k -t /etc/security/keytabs/hbase.headless.keytab hbase
   ```

3. Navigate to the Phoenix home directory, and run the following smoke tests:

   ```
   cd /usr/hdp/current/phoenix-client/bin/ ./psql.py
   localhost:2181:/hbase-unsecure
   /usr/hdp/current/phoenix-client/doc/examples/WEB_STAT.sql
   /usr/hdp/current/phoenix-client/doc/examples/WEB_STAT.csv
   /usr/hdp/current/phoenix-client/doc/examples/WEB_STAT_QUERIES.sql
   ```

   Where `localhost` is your ZooKeeper node and you replace `/hbase-unsecure` with your secured ZooKeeper node. Check the value of `zookeeper.znode.parent` in the `hbase-site.xml` configuration file to confirm the directory path.

**Validating the JDBC Connection to External Applications**

If you are running external applications, it is recommended that you test the connection to HBase using the following connection strings for the Phoenix JDBC driver:

1. Add hbase-site.xml and core-site.xml to your application or client's class path:

   ```
   set CLASSPATH=<path_to_hbase-site.xml>;<path_to_core-site.xml>
   ```

2. Depending on whether you have an unsecured cluster or a cluster secured with Kerberos, use one of the following connection strings to connect to HBase.

   - **For unsecured clusters:**

     ```
     jdbc:phoenix:<ZooKeeper_host_name>:<port_number>:<root_node>
     ```

     Where *<ZooKeeper_host_name>* can specify one host or several hosts. If you specify several ZooKeeper hosts, insert commas between host names. For example, <ZK_host1, ZK_host2, ZK_host3>.

     Example:

     ```
     jdbc:phoenix:zk_quorum:2181:zk_parent
     ```

   - **For clusters secured with Kerberos:**

     ```
     jdbc:phoenix:<ZooKeeper_host_name>:<port_number>:<secured_ZooKeeper_node>:<principal_name>:<HBase_headless_keytab_file>
     ```

     Where <*secured_ZooKeeper_node*> is the path to the secured ZooKeeper node, and <*HBase_headless_keytab_file*> is the location of this keytab file.

     Example:

     ```
     jdbc:phoenix:zk_quorum:2181:/hbase-secure:hbase@EXAMPLE.COM:/hbase-secure/keytab/keytab_file
     ```

| ![[Note]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.5/bk_command-line-installation/common/images/admon/note.png) | Note |
| ------------------------------------------------------------ | ---- |
| If any part of the connection string is omitted, the corresponding property value (hbase.zookeeper.quorum, hbase.zookeeper.property.clientPort, or zookeeper.znode.parent) from the hbase-site.xml configuration file is used. 2181 is the default port. |      |