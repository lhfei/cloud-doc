## Highly Available YARN Session

### Install & Configuration

1. **Configure HA mode and ZooKeeper quorum** in `conf/flink-conf.yaml`:

   ```ini
   high-availability: zookeeper
   high-availability.zookeeper.quorum: host-209:2181,host-210:2181,host-211:2181
   high-availability.storageDir: hdfs:///flink/ha/
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



### Trouble shooting

1. java.lang.NoClassDefFoundError: javax/ws/rs/ext/MessageBodyReader

   ```java
   java.lang.NoClassDefFoundError: javax/ws/rs/ext/MessageBodyReader
   ```

   Download `javax.ws.rs-api`  jar with version `2.0`,  and copy  it to `$FLINK_HOME/lib` directory of all nodes in the cluster.

2. 

3. 

