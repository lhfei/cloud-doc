### Configuring HiveServer2 for Transactions (ACID Support)

Hive supports transactions that adhere to traditional relational database ACID characteristics: atomicity, consistency, isolation, and durability. See the article about [ACID characteristics on Wikipedia](https://en.wikipedia.org/wiki/ACID) for more information.

**Limitations**

Currently, ACID support in Hive has the following limitations:

- `BEGIN`, `COMMIT`, and `ROLLBACK` are not yet supported.
- Only the ORC file format is supported.
- Transactions are configured to be off by default.
- Tables that use transactions must be bucketed. For a discussion of bucketed tables, see the [Apache site](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL+BucketedTables).
- Hive ACID only supports Snapshot Isolation.
- Transactions only support auto-commit mode and may include exactly one SQL statement.
- ZooKeeper and in-memory lock managers are not compatible with transactions. See the [Apache site](https://cwiki.apache.org/confluence/display/Hive/Hive+Transactions#HiveTransactions-BasicDesign) for a discussion of how locks are stored for transactions.

**To configure HiveServer2 for transactions:**

| ![[Important]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.5/bk_data-access/common/images/admon/important.png) | Important |
| ------------------------------------------------------------ | --------- |
| Ensure that the `hive.txn.timeout` property is set to the same value in the `hive-site.xml` file for HiveServer2 that you configure in Step 1 below and the `hive-site.xml` file for the standalone Hive metastore that you configure in Step 2.The following listed properties are the minimum that are required to enable transaction support on HiveServer2. For additional information about configuring this feature and for information about additional configuration parameters, see [Hive Transactions](https://cwiki.apache.org/confluence/display/Hive/Hive+Transactions#HiveTransactions-Configuration) on the Apache web site. |           |

1. Set the following parameters in the `hive-site.xml` file:

   ```
   <property>
        <name>hive.support.concurrency</name>
        <value>true</value>
   </property>
   
   <property>
        <name>hive.txn.manager</name>
        <value>org.apache.hadoop.hive.ql.lockmgr.DbTxnManager</value>
   </property>
   
   <property>
        <name>name>hive.enforce.bucketing</name>
        <value>true</value>
   </property>
   
   <property>
        <name>hive.exec.dynamic.partition.mode</name>
        <value>nostrict</value>
   </property>
   ```

2. Ensure that a standalone Hive metastore is running with the following parameters set in its `hive-site.xml` file:

   ```
   <property>
        <name>hive.compactor.initiator.on</name>
        <value>true</value>
   </property>
   
   <property>
        <name>hive.compactor.worker.threads</name>
        <value><positive_number></value>
   </property>
   ```

   | ![[Important]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.5/bk_data-access/common/images/admon/important.png) | Important |
   | ------------------------------------------------------------ | --------- |
   | These are the minimum properties required to enable transactions in the standalone Hive metastore. See [Hive Transactions](https://cwiki.apache.org/confluence/display/Hive/Hive+Transactions#HiveTransactions-Configuration) on the Apache web site for information about configuring Hive for transactions and additional configuration parameters.Even though HiveServer2 runs with an embedded metastore, a standalone Hive metastore is required for ACID support to function properly. If you are not using ACID support with HiveServer2, you do not need a standalone metastore. |           |

   The default value for `hive.compactor.worker.threads` is `0`. Set this to a positive number to enable Hive transactions. Worker threads spawn MapReduce jobs to perform compactions, but they do not perform the compactions themselves. Increasing the number of worker threads decreases the time that it takes tables or partitions to be compacted. However, increasing the number of worker threads also increases the background load on the Hadoop cluster because they cause more MapReduce jobs to run in the background.