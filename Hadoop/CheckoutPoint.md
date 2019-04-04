### 1 Manual Steps Required: Create Checkpoint on NameNode

1. Login to the NameNode host **host-10-182-92-181**.

2. Put the NameNode in Safe Mode (read-only mode):

   ```sh
   sudo su hdfs -l -c 'hdfs dfsadmin -safemode enter'
   
   Safe mode is ON
   ```

   

3. Once in Safe Mode, create a Checkpoint:

   ```sh
   sudo su hdfs -l -c 'hdfs dfsadmin -saveNamespace'
   
   Save namespace successful
   ```

   

4. You will be able to proceed once Ambari detects that the NameNode is in Safe Mode and the Checkpoint has been created successfully.

5. 

### 2 Manual Steps Required: Initialize JournalNodes

1. Login to the NameNode host **host-10-182-92-181**.

2. Initialize the JournalNodes by running:

   ```sh
   sudo su hdfs -l -c 'hdfs namenode -initializeSharedEdits'
   
   
   ..................
   19/03/26 09:23:31 INFO client.QuorumJournalManager: Successfully started new epoch 1
   19/03/26 09:23:31 INFO namenode.RedundantEditLogInputStream: Fast-forwarding stream '/export/hadoop/hdfs/namenode/current/edits_0000000000000437634-0000000000000437634' to transaction ID 437634
   19/03/26 09:23:31 INFO namenode.FSEditLog: Started a new log segment at txid 437634
   19/03/26 09:23:31 INFO namenode.FSEditLog: Starting log segment at 437634
   19/03/26 09:23:31 INFO namenode.FSEditLog: Ending log segment 437634, 437634
   19/03/26 09:23:31 INFO namenode.FSEditLog: logSyncAll toSyncToTxId=437634 lastSyncedTxid=437634 mostRecentTxid=437634
   19/03/26 09:23:31 INFO namenode.FSEditLog: Done logSyncAll lastWrittenTxId=437634 lastSyncedTxid=437634 mostRecentTxid=437634
   19/03/26 09:23:31 INFO namenode.FSEditLog: Number of transactions: 1 Total time for transactions(ms): 1 Number of transactions batched in Syncs: 0 Number of syncs: 1 SyncTimes(ms): 14 
   19/03/26 09:23:31 INFO namenode.NameNode: SHUTDOWN_MSG: 
   /************************************************************
   SHUTDOWN_MSG: Shutting down NameNode at host-10-182-92-181/10.182.92.181
   ************************************************************/
   ```

   

3. You will be able to proceed once Ambari detects that the JournalNodes have been initialized successfully.





### 3 Manual Steps Required: Initialize NameNode HA Metadata

1. Login to the NameNode host **host-10-182-92-181**.

2. Initialize the metadata for NameNode automatic failover by running:

   ```sh
   sudo su hdfs -l -c 'hdfs zkfc -formatZK'
   
   ..................
   
   ics-core-3.1.0.jar:/usr/hdp/3.1.0.0-78/tez/lib/protobuf-java-2.5.0.jar:/usr/hdp/3.1.0.0-78/tez/lib/servlet-api-2.5.jar:/usr/hdp/3.1.0.0-78/tez/lib/slf4j-api-1.7.10.jar:/usr/hdp/3.1.0.0-78/tez/lib/tez.tar.gz
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:java.library.path=:/usr/hdp/3.1.0.0-78/hadoop/lib/native/Linux-amd64-64:/usr/hdp/3.1.0.0-78/hadoop/lib/native/Linux-amd64-64:/usr/hdp/3.1.0.0-78/hadoop/lib/native
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:java.io.tmpdir=/tmp
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:java.compiler=<NA>
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:os.name=Linux
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:os.arch=amd64
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:os.version=3.10.0-327.28.3.el7.x86_64
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:user.name=hdfs
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:user.home=/home/hdfs
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Client environment:user.dir=/home/hdfs
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Initiating client connection, connectString=host-10-182-92-181:2181,host-10-182-92-183:2181,host-10-182-92-237:2181 sessionTimeout=10000 watcher=org.apache.hadoop.ha.ActiveStandbyElector$WatcherWithClientRef@77fbd92c
   19/03/26 09:27:49 INFO zookeeper.ClientCnxn: Opening socket connection to server host-10-182-92-237/10.182.92.237:2181. Will not attempt to authenticate using SASL (unknown error)
   19/03/26 09:27:49 INFO zookeeper.ClientCnxn: Socket connection established, initiating session, client: /10.182.92.181:49606, server: host-10-182-92-237/10.182.92.237:2181
   19/03/26 09:27:49 INFO zookeeper.ClientCnxn: Session establishment complete on server host-10-182-92-237/10.182.92.237:2181, sessionid = 0x369b798f4910008, negotiated timeout = 10000
   19/03/26 09:27:49 INFO ha.ActiveStandbyElector: Session connected.
   19/03/26 09:27:49 INFO ha.ActiveStandbyElector: Successfully created /hadoop-ha/flyedp in ZK.
   19/03/26 09:27:49 INFO zookeeper.ZooKeeper: Session: 0x369b798f4910008 closed
   19/03/26 09:27:49 INFO zookeeper.ClientCnxn: EventThread shut down
   19/03/26 09:27:49 INFO tools.DFSZKFailoverController: SHUTDOWN_MSG: 
   /************************************************************
   SHUTDOWN_MSG: Shutting down DFSZKFailoverController at host-10-182-92-181/10.182.92.181
   ************************************************************/
   ```

   

3. Login to the Additional NameNode host

    

   host-10-182-59-238

   .vi 

   **Important!** Be sure to login to the Additional NameNode host.
   This is a different host from the Steps 1 and 2 above.

4. Initialize the metadata for the Additional NameNode by running:

   ```sh
   su -l hdfs -c "/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh start namenode"
   ```

   

   ```sh
   sudo su hdfs -l -c 'hdfs namenode -bootstrapStandby'
   
   STARTUP_MSG:   java = 1.8.0_191
   ************************************************************/
   19/03/26 09:29:17 INFO namenode.NameNode: registered UNIX signal handlers for [TERM, HUP, INT]
   19/03/26 09:29:17 INFO namenode.NameNode: createNameNode [-bootstrapStandby]
   19/03/26 09:29:17 ERROR namenode.NameNode: Failed to start namenode.
   java.io.IOException: org.apache.hadoop.HadoopIllegalArgumentException: HA is not enabled for this namenode.
           at org.apache.hadoop.hdfs.server.namenode.ha.BootstrapStandby.run(BootstrapStandby.java:456)
           at org.apache.hadoop.hdfs.server.namenode.NameNode.createNameNode(NameNode.java:1615)
           at org.apache.hadoop.hdfs.server.namenode.NameNode.main(NameNode.java:1710)
   Caused by: org.apache.hadoop.HadoopIllegalArgumentException: HA is not enabled for this namenode.
           at org.apache.hadoop.hdfs.server.namenode.ha.BootstrapStandby.parseConfAndFindOtherNN(BootstrapStandby.java:400)
           at org.apache.hadoop.hdfs.server.namenode.ha.BootstrapStandby.run(BootstrapStandby.java:103)
           at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:76)
           at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:90)
           at org.apache.hadoop.hdfs.server.namenode.ha.BootstrapStandby.run(BootstrapStandby.java:451)
           ... 2 more
   19/03/26 09:29:17 INFO util.ExitUtil: Exiting with status 1: java.io.IOException: org.apache.hadoop.HadoopIllegalArgumentException: HA is not enabled for this namenode.
   19/03/26 09:29:17 INFO namenode.NameNode: SHUTDOWN_MSG: 
   /************************************************************
   SHUTDOWN_MSG: Shutting down NameNode at host-10-182-14-238/10.182.14.238
   ************************************************************/
   ```

   

Please proceed once you have completed the steps above.