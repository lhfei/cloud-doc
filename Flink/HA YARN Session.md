## Highly Available YARN Session

### Install & Configuration

#### Prepared

1. Add system user for Flink

   ```sh
   useradd flink -d /home/flink -s /bin/bash -g hadoop
   ```

2. Make HDFS directory for Flink job

   ```shell
   hdfs dfs -mkdir -p /user/flink
   
   hdfs dfs -chown -R flink:hadoop /user/flink
   
   hdfs dfs -chown -R flink:hadoop /flink/ha
   hdfs dfs -chown -R flink:hadoop /flink/completed-jobs
   hdfs dfs -chown -R flink:hadoop /completed-jobs
   ```

   

3. Add **Hadoop jars** into Flink `classpath`

   ```shell
   wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz
   
   tar xvzf hadoop-3.1.2.tar.gz
   
   cp -r share/hadoop/*/*.jar ${FLINK_HOME}/lib/
   cp -r common/lib/*.jar ${FLINK_HOME}/lib/
   ```

   The `common-cli `  jar that  `hadoop-3.1.2.tar.gz` depended version is `common-cli-1.2.jar`, but `flink-1.8` is required is `common-cli-1.4.jar`. So you need manual download it an replace the `common-cli-1.2.jar` in `${FLINK_HOME}/lib/` .

4.  



#### Install & Configuration

1. **Configure HA mode and ZooKeeper quorum** in `conf/flink-conf.yaml`:

   ```ini
   high-availability: zookeeper
   high-availability.zookeeper.quorum: host-209:2181,host-210:2181,host-211:2181
   high-availability.storageDir: hdfs:///user/flink/ha/
   high-availability.zookeeper.path.root: /flink
   yarn.application-attempts: 10
   ```

2. **Configure ZooKeeper server** in `conf/zoo.cfg` (currently it’s only possible to run a single ZooKeeper server per machine):

   ```
   server.1=host-209:2888:3888
   server.2=host-210:2888:3888
   server.3=locahost-211lhost:2888:3888
   ```

3. **Start ZooKeeper quorum**:

   ```sh
   $ bin/start-zookeeper-quorum.sh
   Starting zookeeper daemon on host localhost.
   ```

4. **Start an HA-cluster**:

   ```sh
   $ bin/yarn-session.sh -n 2
   ```



### Sample Configuration

> `$FLINK_HOME/conf/flink-conf.yaml`

```yaml
################################################################################
#  Licensed to the Apache Software Foundation (ASF) under one
#  or more contributor license agreements.  See the NOTICE file
#  distributed with this work for additional information
#  regarding copyright ownership.  The ASF licenses this file
#  to you under the Apache License, Version 2.0 (the
#  "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
# limitations under the License.
################################################################################


#==============================================================================
# Common
#==============================================================================

# The external address of the host on which the JobManager runs and can be
# reached by the TaskManagers and any clients which want to connect. This setting
# is only used in Standalone mode and may be overwritten on the JobManager side
# by specifying the --host <hostname> parameter of the bin/jobmanager.sh executable.
# In high availability mode, if you use the bin/start-cluster.sh script and setup
# the conf/masters file, this will be taken care of automatically. Yarn/Mesos
# automatically configure the host name based on the hostname of the node where the
# JobManager runs.

#jobmanager.rpc.address: localhost

# The RPC port where the JobManager is reachable.

jobmanager.rpc.port: 6123


# The heap size for the JobManager JVM

jobmanager.heap.size: 1024m


# The heap size for the TaskManager JVM

taskmanager.heap.size: 1024m


# The number of task slots that each TaskManager offers. Each slot runs one parallel pipeline.

taskmanager.numberOfTaskSlots: 1

# The parallelism used for programs that did not specify and other parallelism.

parallelism.default: 1

# The default file system scheme and authority.
# 
# By default file paths without scheme are interpreted relative to the local
# root file system 'file:///'. Use this to override the default and interpret
# relative paths relative to a different file system,
# for example 'hdfs://mynamenode:12345'
#
fs.default-scheme: hdfs://host-10-182-25-192:8020

#==============================================================================
# High Availability
#==============================================================================

# The high-availability mode. Possible options are 'NONE' or 'zookeeper'.
#
high-availability: zookeeper

# The path where metadata for master recovery is persisted. While ZooKeeper stores
# the small ground truth for checkpoint and leader election, this location stores
# the larger objects, like persisted dataflow graphs.
# 
# Must be a durable file system that is accessible from all nodes
# (like HDFS, S3, Ceph, nfs, ...) 
#
high-availability.storageDir: hdfs:///user/flink/ha/

# The list of ZooKeeper quorum peers that coordinate the high-availability
# setup. This must be a list of the form:
# "host1:clientPort,host2:clientPort,..." (default clientPort: 2181)
#
high-availability.zookeeper.quorum: host-10-182-26-133:2181,host-10-182-27-116:2181,host-10-182-63-163:2181


# ACL options are based on https://zookeeper.apache.org/doc/r3.1.2/zookeeperProgrammers.html#sc_BuiltinACLSchemes
# It can be either "creator" (ZOO_CREATE_ALL_ACL) or "open" (ZOO_OPEN_ACL_UNSAFE)
# The default value is "open" and it can be changed to "creator" if ZK security is enabled
#
# high-availability.zookeeper.client.acl: open

high-availability.zookeeper.path.root: /flink

yarn.application-attempts: 10
#==============================================================================
# Fault tolerance and checkpointing
#==============================================================================

# The backend that will be used to store operator state checkpoints if
# checkpointing is enabled.
#
# Supported backends are 'jobmanager', 'filesystem', 'rocksdb', or the
# <class-name-of-factory>.
#
# state.backend: filesystem

# Directory for checkpoints filesystem, when using any of the default bundled
# state backends.
#
state.checkpoints.dir: hdfs://host-10-182-25-192:8020/user/flink-checkpoints

# Default target directory for savepoints, optional.
#
# state.savepoints.dir: hdfs://namenode-host:port/flink-checkpoints

# Flag to enable/disable incremental checkpoints for backends that
# support incremental checkpoints (like the RocksDB state backend). 
#
# state.backend.incremental: false

#==============================================================================
# Rest & web frontend
#==============================================================================

# The port to which the REST client connects to. If rest.bind-port has
# not been specified, then the server will bind to this port as well.
#
#rest.port: 8081

# The address to which the REST client will connect to
#
#rest.address: 0.0.0.0

# Port range for the REST and web server to bind to.
#
#rest.bind-port: 8080-8090

# The address that the REST & web server binds to
#
#rest.bind-address: 0.0.0.0

# Flag to specify whether job submission is enabled from the web-based
# runtime monitor. Uncomment to disable.

#web.submit.enable: false

#==============================================================================
# Advanced
#==============================================================================

# Override the directories for temporary files. If not specified, the
# system-specific Java temporary directory (java.io.tmpdir property) is taken.
#
# For framework setups on Yarn or Mesos, Flink will automatically pick up the
# containers' temp directories without any need for configuration.
#
# Add a delimited list for multiple directories, using the system directory
# delimiter (colon ':' on unix) or a comma, e.g.:
#     /data1/tmp:/data2/tmp:/data3/tmp
#
# Note: Each directory entry is read from and written to by a different I/O
# thread. You can include the same directory multiple times in order to create
# multiple I/O threads against that directory. This is for example relevant for
# high-throughput RAIDs.
#
# io.tmp.dirs: /tmp

# Specify whether TaskManager's managed memory should be allocated when starting
# up (true) or when memory is requested.
#
# We recommend to set this value to 'true' only in setups for pure batch
# processing (DataSet API). Streaming setups currently do not use the TaskManager's
# managed memory: The 'rocksdb' state backend uses RocksDB's own memory management,
# while the 'memory' and 'filesystem' backends explicitly keep data as objects
# to save on serialization cost.
#
# taskmanager.memory.preallocate: false

# The classloading resolve order. Possible values are 'child-first' (Flink's default)
# and 'parent-first' (Java's default).
#
# Child first classloading allows users to use different dependency/library
# versions in their application than those in the classpath. Switching back
# to 'parent-first' may help with debugging dependency issues.
#
# classloader.resolve-order: child-first

# The amount of memory going to the network stack. These numbers usually need 
# no tuning. Adjusting them may be necessary in case of an "Insufficient number
# of network buffers" error. The default min is 64MB, the default max is 1GB.
# 
# taskmanager.network.memory.fraction: 0.1
# taskmanager.network.memory.min: 64mb
# taskmanager.network.memory.max: 1gb

#==============================================================================
# Flink Cluster Security Configuration
#==============================================================================

# Kerberos authentication for various components - Hadoop, ZooKeeper, and connectors -
# may be enabled in four steps:
# 1. configure the local krb5.conf file
# 2. provide Kerberos credentials (either a keytab or a ticket cache w/ kinit)
# 3. make the credentials available to various JAAS login contexts
# 4. configure the connector to use JAAS/SASL

# The below configure how Kerberos credentials are provided. A keytab will be used instead of
# a ticket cache if the keytab path and principal are set.

# security.kerberos.login.use-ticket-cache: true
# security.kerberos.login.keytab: /path/to/kerberos/keytab
# security.kerberos.login.principal: flink-user

# The configuration below defines which JAAS login contexts

# security.kerberos.login.contexts: Client,KafkaClient

#==============================================================================
# ZK Security Configuration
#==============================================================================

# Below configurations are applicable if ZK ensemble is configured for security

# Override below configuration to provide custom ZK service name if configured
# zookeeper.sasl.service-name: zookeeper

# The configuration below must match one of the values set in "security.kerberos.login.contexts"
# zookeeper.sasl.login-context-name: Client

#==============================================================================
# HistoryServer
#==============================================================================

# The HistoryServer is started and stopped via bin/historyserver.sh (start|stop)

# Directory to upload completed jobs to. Add this directory to the list of
# monitored directories of the HistoryServer as well (see below).
jobmanager.archive.fs.dir: hdfs:///user/flink/completed-jobs/

# The address under which the web-based HistoryServer listens.
#historyserver.web.address: 0.0.0.0

# The port under which the web-based HistoryServer listens.
#historyserver.web.port: 8082

# Comma separated list of directories to monitor for completed jobs.
historyserver.archive.fs.dir: hdfs:///user/flink/completed-jobs/

# Interval in milliseconds for refreshing the monitored directories.
#historyserver.archive.fs.refresh-interval: 10000
```



### Trouble shooting

1. java.lang.NoClassDefFoundError: javax/ws/rs/ext/MessageBodyReader

   ```java
   java.lang.NoClassDefFoundError: javax/ws/rs/ext/MessageBodyReader
   ```

   Download `javax.ws.rs-api`  jar with version `2.0`,  and copy  it to `$FLINK_HOME/lib` directory of all nodes in the cluster.

2. 

3. 

