https://docs.confluent.io/current/installation/installing_cp/zip-tar.html#prod-kafka-cli-install



# Manual Install using ZIP and TAR Archives

This topic provides instructions for installing a production-ready Confluent Platform configuration in a multi-node environment with a replicated ZooKeeper ensemble.

With this installation method, you connect to every node manually, download the archive, and run the Confluent Platform installation commands.

Important

You must complete these steps for each node in your cluster.

- Prerequisites

  Before installing Confluent Platform, your environment must have the following [software and hardware requirements](https://docs.confluent.io/current/installation/system-requirements.html#system-requirements).

## Get the Software

1. Go to the [downloads page](https://www.confluent.io/download/) and choose your archive package or download directly by using curl.

   - Confluent Platform

     - ZIP

     ```shell
     curl -O http://packages.confluent.io/archive/5.3/confluent-5.3.1-2.12.zip
     ```

     

     - TAR

      ```shell
     curl -O http://packages.confluent.io/archive/5.3/confluent-5.3.1-2.12.tar.gz
      ```

     

   - Confluent Platform using only Confluent Community components

     - ZIP

     ```shell
     curl -O http://packages.confluent.io/archive/5.3/confluent-community-5.3.1-2.12.zip
     ```

     

     - TAR

     ```shell
     curl -O http://packages.confluent.io/archive/5.3/confluent-community-5.3.1-2.12.tar.gz
     ```

     

   > Tip

   The package name contains the Confluent Platform version followed by the Scala version. For example, `5.3.1-2.12.zip` denotes Confluent Platform version 5.3.1 and Scala version 2.12.

   

2. Decompress the file. You should have these directories:

   | Folder  | Description                                          |
   | :------ | :--------------------------------------------------- |
   | /bin/   | Driver scripts for starting and stopping services    |
   | /etc/   | Configuration files                                  |
   | /lib/   | Systemd services                                     |
   | /logs/  | Log files                                            |
   | /share/ | Jars and licenses                                    |
   | /src/   | Source files that require a platform-dependent build |

   

## Configure Confluent Platform

> Tip

You can store passwords and other configuration data securely by using the [confluent secret](https://docs.confluent.io/current/cli/command-reference/confluent-secret/index.html#confluent-secret) commands. For more information see [Secrets](https://docs.confluent.io/current/security/secrets.html#secrets).

Configure Confluent Platform with the individual component properties files. By default these are located in `<path-to-confluent>/etc/`. You must minimally configure the following components.

### ZooKeeper

These instructions assume you are running ZooKeeper in replicated mode. A minimum of three servers are required for replicated mode, and you must have an odd number of servers for failover. For more information, see the [ZooKeeper documentation](https://zookeeper.apache.org/doc/current/zookeeperStarted.html#sc_RunningReplicatedZooKeeper).

1. Navigate to the ZooKeeper properties file (`/etc/kafka/zookeeper.properties`) file and modify as shown.

   ```properties
   tickTime=2000
   dataDir=/var/lib/zookeeper/
   clientPort=2181
   initLimit=5
   syncLimit=2
   server.1=zoo1:2888:3888
   server.2=zoo2:2888:3888
   server.3=zoo3:2888:3888
   autopurge.snapRetainCount=3
   autopurge.purgeInterval=24
   ```

   

   This configuration is for a three node ensemble. This configuration file should be identical across all nodes in the ensemble. `tickTime`, `dataDir`, and `clientPort` are all set to typical single server values. The `initLimit` and `syncLimit` govern how long following ZooKeeper servers can take to initialize with the current leader and how long they can be out of sync with the leader. In this configuration, a follower can take 10000 ms to initialize and can be out of sync for up to 4000 ms based on the `tickTime` being set to 2000ms.

   The `server.*` properties set the ensemble membership. The format is

   ```properties
   server.<myid>=<hostname>:<leaderport>:<electionport>
   ```

   

   - `myid` is the server identification number. There are three servers that each have a different `myid` with values `1`, `2`, and `3` respectively. The `myid` is set by creating a file named `myid` in the `dataDir` that contains a single integer in human readable ASCII text. This value must match one of the `myid` values from the configuration file. You will see an error if another ensemble member is already started with a conflicting `myid` value.
   - `leaderport` is used by followers to connect to the active leader. This port should be open between all ZooKeeper ensemble members.
   - `electionport` is used to perform leader elections between ensemble members. This port should be open between all ZooKeeper ensemble members.

   The `autopurge.snapRetainCount` and `autopurge.purgeInterval` have been set to purge all but three snapshots every 24 hours.

2. Navigate to the ZooKeeper log directory (e.g., `/var/lib/zookeeper/`) and create a file named `myid`. The `myid` file consists of a single line that contains the machine ID in the format `<machine-id>`. When the ZooKeeper server starts up, it knows which server it is by referencing the `myid` file. For example, server 1 will have a `myid` value of `1`.

### Kafka

In a production environment, multiple brokers are required. During startup brokers register themselves in ZooKeeper to become a member of the cluster.

Navigate to the Apache Kafka® properties file (`/etc/kafka/server.properties`) and customize the following:

- Connect to the same ZooKeeper ensemble by setting the `zookeeper.connect` in all nodes to the same value. Replace all instances of `localhost` to the hostname or FQDN (fully qualified domain name) of your node. For example, if your hostname is `zookeeper`:

  ```properties
  zookeeper.connect=zookeeper:2181
  ```

  

- Configure the broker IDs for each node in your cluster using one of these methods.

  - Dynamically generate the broker IDs: add `broker.id.generation.enable=true` and comment out `broker.id`. For example:

    ```properties
    ############################# Server Basics #############################
    
    # The ID of the broker. This must be set to a unique integer for each broker.
    #broker.id=0
    broker.id.generation.enable=true
    ```

    

  - Manually set the broker IDs: set a unique value for `broker.id` on each node.

- Configure how other brokers and clients communicate with the broker using `listeners`, and optionally `advertised.listeners`.

  - `listeners`: Comma-separated list of URIs and listener names to listen on.
  - `advertised.listeners`: Comma-separated list of URIs and listener names for other brokers and clients to use. The `advertised.listeners` parameter ensures that the broker advertises an address that is accessible from both local and external hosts.

  For more information, see [Production Configuration Options](https://docs.confluent.io/current/kafka/deployment.html#cp-production-parameters).

- Configure security for your environment.

  - For general security guidance, see [Security](https://docs.confluent.io/current/security/index.html#security).
  - For role-based access control (RBAC), see [Configure Metadata Service (MDS)](https://docs.confluent.io/current/security/rbac/configure-mds/index.html#rbac-mds-config).
  - For SSL encryption, SASL authentication, and authorization, see [Security Tutorial](https://docs.confluent.io/current/security/security_tutorial.html#security-tutorial).

### Control Center

1. Navigate to the Control Center properties file (`/etc/confluent-control-center/control-center-production.properties`) and customize the following:

   ```properties
   # host/port pairs to use for establishing the initial connection to the Kafka cluster
   bootstrap.servers=<hostname1:port1,hostname2:port2,hostname3:port3,...>
   # location for Control Center data
   confluent.controlcenter.data.dir=/var/lib/confluent/control-center
   # the Confluent license
   confluent.license=<your-confluent-license>
   # ZooKeeper connection string with host and port of a ZooKeeper servers
   zookeeper.connect=<hostname1:port1,hostname2:port2,hostname3:port3,...>
   ```

   

   This configuration is for a three node multi-node cluster. For more information, see [Control Center configuration details](https://docs.confluent.io/current/control-center/installation/configuration.html#controlcenter-configuration). For information about Confluent Platform licenses, see [Managing Confluent Platform Licenses](https://docs.confluent.io/current/control-center/installation/licenses.html#controlcenter-licenses).

2. Navigate to the Kafka server configuration file (`/etc/kafka/server.properties`) and enable Confluent Metrics Reporter.

   ```properties
   ##################### Confluent Metrics Reporter #######################
   # Confluent Control Center and Confluent Auto Data Balancer integration
   #
   # Uncomment the following lines to publish monitoring data for
   # Confluent Control Center and Confluent Auto Data Balancer
   # If you are using a dedicated metrics cluster, also adjust the settings
   # to point to your metrics Kafka cluster.
   metric.reporters=io.confluent.metrics.reporter.ConfluentMetricsReporter
   confluent.metrics.reporter.bootstrap.servers=localhost:9092
   #
   # Uncomment the following line if the metrics cluster has a single broker
   confluent.metrics.reporter.topic.replicas=1
   ```

   

3. Add these lines to the Kafka Connect properties file (`/etc/kafka/connect-distributed.properties`) to add support for the interceptors.

   ```properties
   # Interceptor setup
   consumer.interceptor.classes=io.confluent.monitoring.clients.interceptor.MonitoringConsumerInterceptor
   producer.interceptor.classes=io.confluent.monitoring.clients.interceptor.MonitoringProducerInterceptor
   ```

   

## Start Confluent Platform

Install Confluent Platform by using Kafka CLI commands.

Tip

ZooKeeper, Kafka, and Schema Registry must be started in this specific order, and must be started before any other components.

1. Start ZooKeeper. Run this command in its own terminal.

   ```shell
   <path-to-confluent>/bin/zookeeper-server-start <path-to-confluent>/etc/kafka/zookeeper.properties
   ```

   

2. Start Kafka. Run this command in its own terminal.

   ```shell
   <path-to-confluent>/bin/kafka-server-start <path-to-confluent>/etc/kafka/server.properties
   ```

   

3. Start Schema Registry. Run this command in its own terminal.

   ```shell
   <path-to-confluent>/bin/schema-registry-start <path-to-confluent>/etc/schema-registry/schema-registry.properties
   ```

   

4. Start other Confluent Platform components as desired.

   - Control Center

     ```shell
     <path-to-confluent>/bin/control-center-start <path-to-confluent>/etc/confluent-control-center/control-center.properties
     ```

     

   - Kafka Connect

     ```shell
     <path-to-confluent>/bin/connect-distributed <path-to-confluent>/etc/schema-registry/connect-avro-distributed.properties
     ```

     

   - Confluent REST Proxy

     ```shell
     <path-to-confluent>/bin/kafka-rest-start <path-to-confluent>/etc/kafka-rest/kafka-rest.properties
     ```

     

   - KSQL

     ```shell
     <path-to-confluent>/bin/ksql-server-start <path-to-confluent>/etc/ksql/ksql-server.properties
     ```

     

## Uninstall

1. Remove the Confluent directory. For example, if you have Confluent Platform 5.3.1 installed:

   ```shell
   rm -rf confluent-5.3.1
   ```

   

2. Remove the Confluent Platform data files.

   ```shell
   rm -rf /var/lib/<confluent-platform-data-files>
   ```