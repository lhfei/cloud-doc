# Configuring NameNode high availability

## Step 1 

#### Manual Steps Required: Create Checkpoint on NameNode

1. Login to the NameNode host **host-10-182-15-202**.

2. Put the NameNode in Safe Mode (read-only mode):

   ```sh
   sudo su hdfs -l -c 'hdfs dfsadmin -safemode enter'
   ```

3. Once in Safe Mode, create a Checkpoint:

   ```sh
   sudo su hdfs -l -c 'hdfs dfsadmin -saveNamespace'
   ```

4. You will be able to proceed once Ambari detects that the NameNode is in Safe Mode and the Checkpoint has been created successfully.

5. If the **Next** button is enabled before you run the **"Step 4: Create a Checkpoint"** command, it means there is a recent Checkpoint already and you may proceed without running the **"Step 4: Create a Checkpoint"** command.



## Step 2

#### Configure Components

Please wait while NameNode HA is being deployed.

- [x]  Stop All Services

- [x] Install Additional NameNode

- [x] Install JournalNodes

- [x]  Reconfigure HDFS

- [x]  Start JournalNodes

- [x]  Disable Secondary NameNode



## Step 3

#### Manual Steps Required: Initialize JournalNodes

1. Login to the NameNode host **host-10-182-15-202**.

2. Initialize the JournalNodes by running:

   ```sh
   sudo su hdfs -l -c 'hdfs namenode -initializeSharedEdits'
   ```

3. You will be able to proceed once Ambari detects that the JournalNodes have been initialized successfully.



## Step 4

#### Start Components

Please wait while NameNode HA is being deployed.

- [x]  Start ZooKeeper Servers

- [x]  Start NameNode



## Step 5

#### Manual Steps Required: Initialize NameNode HA Metadata

1. Login to the NameNode host **host-10-182-15-202**.

2. Initialize the metadata for NameNode automatic failover by running:

   ```sh
   sudo su hdfs -l -c 'hdfs zkfc -formatZK'
   ```

3. Login to the Additional NameNode host `host-10-182-15-206`

   **Important!** Be sure to login to the Additional NameNode host.
   This is a different host from the Steps 1 and 2 above.

4. Initialize the metadata for the Additional NameNode by running:

   ```sh
   sudo su hdfs -l -c 'hdfs namenode -bootstrapStandby'
   ```

   The console output as below: 

   ```ini
   ************************************************************/
   19/03/26 17:39:53 INFO namenode.NameNode: registered UNIX signal handlers for [TERM, HUP, INT]
   19/03/26 17:39:53 INFO namenode.NameNode: createNameNode [-bootstrapStandby]
   19/03/26 17:39:53 INFO ha.BootstrapStandby: Found nn: nn1, ipc: host-10-182-15-202/10.182.15.202:8020
   19/03/26 17:39:53 WARN common.Util: Path /export/hadoop/hdfs/namenode should be specified as a URI in configuration files. Please update hdfs configuration.
   19/03/26 17:39:53 WARN common.Util: Path /export/hadoop/hdfs/namenode should be specified as a URI in configuration files. Please update hdfs configuration.
   =====================================================
   About to bootstrap Standby ID nn2 from:
              Nameservice ID: flyedp
           Other Namenode ID: nn1
     Other NN's HTTP address: http://host-10-182-15-202:50070
     Other NN's IPC  address: host-10-182-15-202/10.182.15.202:8020
                Namespace ID: 203873792
               Block pool ID: BP-947401081-10.182.92.181-1552372024764
                  Cluster ID: CID-643326f1-4eca-4d6b-b9d3-0cfd7846e77f
              Layout version: -64
          isUpgradeFinalized: true
   =====================================================
   19/03/26 17:39:53 INFO common.Storage: Storage directory /export/hadoop/hdfs/namenode has been successfully formatted.
   19/03/26 17:39:53 WARN common.Util: Path /export/hadoop/hdfs/namenode should be specified as a URI in configuration files. Please update hdfs configuration.
   19/03/26 17:39:53 WARN common.Util: Path /export/hadoop/hdfs/namenode should be specified as a URI in configuration files. Please update hdfs configuration.
   19/03/26 17:39:53 WARN common.Storage: set restore failed storage to true
   19/03/26 17:39:53 INFO namenode.FSEditLog: Edit logging is async:true
   19/03/26 17:39:54 INFO namenode.TransferFsImage: Opening connection to http://host-10-182-15-202:50070/imagetransfer?getimage=1&txid=439185&storageInfo=-64:203873792:1552372024764:CID-643326f1-4eca-4d6b-b9d3-0cfd7846e77f&bootstrapstandby=true
   19/03/26 17:39:54 INFO common.Util: Combined time for file download and fsync to all disks took 0.01s. The file download took 0.01s at 62555.56 KB/s. Synchronous (fsync) write to disk of /export/hadoop/hdfs/namenode/current/fsimage.ckpt_0000000000000439185 took 0.00s.
   19/03/26 17:39:54 INFO namenode.TransferFsImage: Downloaded file fsimage.ckpt_0000000000000439185 size 576744 bytes.
   19/03/26 17:39:54 INFO namenode.NameNode: SHUTDOWN_MSG: 
   /************************************************************
   SHUTDOWN_MSG: Shutting down NameNode at host-10-182-15-206/10.182.15.206
   ************************************************************/
   ```

   

Please proceed once you have completed the steps above.



## Step 6

#### Finalize HA Setup

Please wait while NameNode HA is being deployed.

- [x]  Start Additional NameNode
- [x]  Install Failover Controllers
- [x]  Start Failover Controllers
- [x]  Reconfigure HBase
- [x]  Reonfigure AMS
- [x]  Delete Secondary NameNode
- [x]  Stop HDFS
- [x]  Start All Services





# Rolling back NameNode high availablity

To disable (roll back) NameNode high availability, perform these tasks (depending on your installation):

## Stop HBase



## Checkpoint the active NameNode



## Stop all services



## Prepare the Ambari server host for NameNode rollback

To prepare for the NameNode rollback task:



## Restore the HBase configuration



## Delete ZooKeeper failover controllers

### Before your begin

If the following command on the Ambari server host returns an empty items array then you must delete ZooKeeper (ZK) Failover Controllers:

```sh
curl -u [AMBARI_USER]:[AMBARI_PW] -H "X-Requested-By: ambari" -i [AMBARI_PROTO]://localhost:[AMBARI_PORT]/api/v1/clusters/[CLUSTER_NAME]/host_components?HostRoles/component_name=ZKFC
```

1. On the Ambari Server host, issue the following DELETE commands:

   ```sh
   curl -u [AMBARI_USER]:[AMBARI_PW] -H "X-Requested-By: ambari" -i -X DELETE [AMBARI_PROTO]://localhost:[AMBARI_PORT]/api/v1/clusters/[CLUSTER_NAME]/hosts/[NAMENODE_HOSTNAME]/host_components/ZKFC 
   
   curl -u [AMBARI_USER]:[AMBARI_PW] -H "X-Requested-By: ambari" -i -X DELETE [AMBARI_PROTO]://localhost:[AMBARI_PORT]/api/v1/clusters/[CLUSTER_NAME]/hosts/[ADDITIONAL_NAMENODE_HOSTNAME]/host_components/ZKFC
   ```

   

2. Verify that the controllers are gone:

   ```sh
   curl -u [AMBARI_USER]:[AMBARI_PW] -H "X-Requested-By: ambari" -i [AMBARI_PROTO]://localhost:[AMBARI_PORT]/api/v1/clusters/[CLUSTER_NAME]/host_components?HostRoles/component_name=ZKFC
   ```

   

   This command should return an empty items array.

Modify HDFS configurations.



## Modify HDFS configurations

You may need to modify your `hdfs-site` configuration and/or your `core-site` configuration.

## Re-create the standby NameNode

You may need to recreate your standby NameNode.

## Re-enable the standby NameNode

To re-enable the standby NameNode:

## Delete all JournalNodes

You may need to delete any JournalNodes.



## Delete the additional NameNode

You may need to delete your additional NameNode.

### Before your begin

Check to see if you need to delete your Additional NameNode, on the Ambari Server host:

```sh
curl -u [AMBARI_USER]:[AMBARI_PW] -H "X-Requested-By: ambari" -i -X GET [AMBARI_PROTO]://localhost:[AMBARI_PORT]/api/v1/clusters/[CLUSTER_NAME]/host_components?HostRoles/component_name=NAMENODE
```

If the items array contains two NameNodes, the Additional NameNode must be deleted.

1. On the Ambari Server host, run the following command:

   ```sh
   curl -u [AMBARI_USER]:[AMBARI_PW] -H "X-Requested-By: ambari" -i -X DELETE [AMBARI_PROTO]://localhost:[AMBARI_PORT]/api/v1/clusters/[CLUSTER_NAME]/hosts/[ADDITIONAL_NAMENODE_HOSTNAME]/host_components/NAMENODE
   ```

2. Verify that the Additional NameNode has been deleted:

   ```sh
   curl -u [AMBARI_USER]:[AMBARI_PW] -H "X-Requested-By: ambari" -i -X GET [AMBARI_PROTO]://localhost:[AMBARI_PORT]/api/v1/clusters/[CLUSTER_NAME]/host_components?HostRoles/component_name=NAMENODE
   ```

   

   This should return an items array that shows only one NameNode.

Verify HDFS components.



## Verify the HDFS components

## Start HDFS



