

#### Add Hadoop Configurations

Place your Hadoop configuration XMLs (**core-site.xml**, **hdfs-site.xml**, **yarn-site.xml**, **mapred-site.xm**l) on the classpath of your Druid processes. You can do this by copying them into `conf/druid/_common/`.



> conf/druid/_common

```ini
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

#
# Extensions
#

# This is not the full list of Druid extensions, but common ones that people often use. You may need to change this list
# based on your particular setup.
druid.extensions.loadList=["druid-hdfs-storage"]

# If you have a different version of Hadoop, place your Hadoop client jar files in your hadoop-dependencies directory
# and uncomment the line below to point to your directory.
#druid.extensions.hadoopDependenciesDir=/my/dir/hadoop-dependencies

#
# Logging
#

# Log all runtime properties on startup. Disable to avoid logging properties on startup:
druid.startup.logging.logProperties=true

#
# Zookeeper
#

druid.zk.service.host=host-10-182-26-133:2181,host-10-182-27-116:2181,host-10-182-63-163:2181
druid.zk.paths.base=/druid

#
# Metadata storage
#

# For Derby server on your Druid Coordinator (only viable in a cluster with a single Coordinator, no fail-over):
#druid.metadata.storage.type=derby
#druid.metadata.storage.connector.connectURI=jdbc:derby://metadata.store.ip:1527/var/druid/metadata.db;create=true
#druid.metadata.storage.connector.host=metadata.store.ip
#druid.metadata.storage.connector.port=1527

# For MySQL (make sure to include the MySQL JDBC driver on the classpath):
druid.metadata.storage.type=mysql
druid.metadata.storage.connector.connectURI=jdbc:mysql://10.182.99.90:3306/cloud_druid?useSSL=false
druid.metadata.storage.connector.user=polaris_druid
druid.metadata.storage.connector.password=polaris_Druid_1473

# For PostgreSQL (make sure to additionally include the Postgres extension):
#druid.metadata.storage.type=postgresql
#druid.metadata.storage.connector.connectURI=jdbc:postgresql://db.example.com:5432/druid
#druid.metadata.storage.connector.user=...
#druid.metadata.storage.connector.password=...

#
# Deep storage
#

# For local disk (only viable in a cluster if this is a network mount):
#druid.storage.type=local
#druid.storage.storageDirectory=var/druid/segments

# For HDFS (make sure to include the HDFS extension and that your Hadoop config files in the cp):
druid.storage.type=hdfs
druid.storage.storageDirectory=/druid/segments

# For S3:
#druid.storage.type=s3
#druid.storage.bucket=your-bucket
#druid.storage.baseKey=druid/segments
#druid.s3.accessKey=...
#druid.s3.secretKey=...

#
# Indexing service logs
#

# For local disk (only viable in a cluster if this is a network mount):
#druid.indexer.logs.type=file
#druid.indexer.logs.directory=var/druid/indexing-logs

# For HDFS (make sure to include the HDFS extension and that your Hadoop config files in the cp):
druid.indexer.logs.type=hdfs
druid.indexer.logs.directory=/druid/indexing-logs

# For S3:
#druid.indexer.logs.type=s3
#druid.indexer.logs.s3Bucket=your-bucket
#druid.indexer.logs.s3Prefix=druid/indexing-logs

#
# Service discovery
#

druid.selectors.indexing.serviceName=druid/overlord
druid.selectors.coordinator.serviceName=druid/coordinator

#
# Monitoring
#

druid.monitoring.monitors=["org.apache.druid.java.util.metrics.JvmMonitor"]
druid.emitter=logging
druid.emitter.logging.logLevel=info

# Storage type of double columns
# ommiting this will lead to index double as float at the storage layer

druid.indexing.doubleStorage=double

#
# SQL
#
druid.sql.enable=true

```



#### coordinator

> jvm.config

```ini
-server
-Xms3g
-Xmx3g
-XX:+ExitOnOutOfMemoryError
-Duser.timezone=UTC
-Dfile.encoding=UTF-8
-Djava.io.tmpdir=var/tmp
-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
-Dderby.stream.error.file=var/druid/derby.log
```

> runtime.properties

```ini
druid.service=druid/coordinator
druid.plaintextPort=8081

druid.coordinator.startDelay=PT30S
druid.coordinator.period=PT30S
```



#### overlord

> jvm.config

```ini
-server
-Xms3g
-Xmx3g
-XX:+ExitOnOutOfMemoryError
-Duser.timezone=UTC
-Dfile.encoding=UTF-8
-Djava.io.tmpdir=var/tmp
-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
```

> runtime.properties

```ini
druid.service=druid/overlord
druid.plaintextPort=8090

druid.indexer.queue.startDelay=PT30S

druid.indexer.runner.type=remote
druid.indexer.storage.type=metadata
```



#### MiddleManager

> jvm.config

```ini
-server
-Xms64m
-Xmx64m
-XX:+ExitOnOutOfMemoryError
-Duser.timezone=UTC
-Dfile.encoding=UTF-8
-Djava.io.tmpdir=var/tmp
-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
```

> runtime.properties

```ini
druid.service=druid/middleManager
druid.plaintextPort=8091

# Number of tasks per middleManager
druid.worker.capacity=3

# Task launch parameters
druid.indexer.runner.javaOpts=-server -Xmx2g -Duser.timezone=UTC -Dfile.encoding=UTF-8 -XX:+ExitOnOutOfMemoryError -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
druid.indexer.task.baseTaskDir=var/druid/task

# HTTP server threads
druid.server.http.numThreads=25

# Processing threads and buffers on Peons
druid.indexer.fork.property.druid.processing.buffer.sizeBytes=536870912
druid.indexer.fork.property.druid.processing.numThreads=2

# Hadoop indexing
druid.indexer.task.hadoopWorkingPath=var/druid/hadoop-tmp
```



#### historical

> jvm.config

```ini
-server
-Xms2g
-Xmx4g
-XX:MaxDirectMemorySize=1048576m
-XX:+ExitOnOutOfMemoryError
-Duser.timezone=UTC
-Dfile.encoding=UTF-8
-Djava.io.tmpdir=var/tmp
-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
```

> runtime.properties

```ini
druid.service=druid/historical
druid.plaintextPort=8083

# HTTP server threads
druid.server.http.numThreads=25

# Processing threads and buffers
druid.processing.buffer.sizeBytes=536870912
druid.processing.numThreads=2

# Segment storage
druid.segmentCache.locations=[{"path":"/druid/segment-cache","maxSize":130000000000}]
druid.server.maxSize=130000000000

# Query cache
druid.historical.cache.useCache=true
druid.historical.cache.populateCache=true
druid.cache.type=caffeine
druid.cache.sizeInBytes=2000000000
```



#### broker

> jvm.config

```ini
-server
-Xms24g
-Xmx24g
-XX:MaxDirectMemorySize=4096m
-XX:+ExitOnOutOfMemoryError
-Duser.timezone=UTC
-Dfile.encoding=UTF-8
-Djava.io.tmpdir=var/tmp
-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
```

> runtime.properties

```ini
druid.service=druid/broker
druid.plaintextPort=8082

# HTTP server settings
druid.server.http.numThreads=60

# HTTP client settings
druid.broker.http.numConnections=10

# Processing threads and buffers
druid.processing.buffer.sizeBytes=536870912
druid.processing.numMergeBuffers=2
druid.processing.numThreads=1

# Query cache disabled -- push down caching and merging instead
druid.broker.cache.useCache=false
druid.broker.cache.populateCache=false
```



#### router

> jvm.config

```ini
-server
-Xms512m
-Xmx512m
-XX:+UseG1GC
-XX:MaxDirectMemorySize=512m
-XX:+ExitOnOutOfMemoryError
-Duser.timezone=UTC
-Dfile.encoding=UTF-8
-Djava.io.tmpdir=var/tmp
-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
```

> runtime.properties

```ini
druid.service=druid/router
druid.plaintextPort=8888

# HTTP proxy
druid.router.http.numConnections=50
druid.router.http.readTimeout=PT5M
druid.router.http.numMaxThreads=100
druid.server.http.numThreads=100

# Service discovery
druid.router.defaultBrokerServiceName=druid/broker
druid.router.coordinatorServiceName=druid/coordinator

# Management proxy to coordinator / overlord: required for unified web console.
druid.router.managementProxy.enabled=true
```





### JVM Turnig

```ini
 Please adjust -XX:MaxDirectMemorySize, druid.processing.buffer.sizeBytes, druid.processing.numThreads, or druid.processing.numMergeBuffers: maxDirectMemory[1,908,932,608], memoryNeeded[2,684,354,560] = druid.processing.buffer.sizeBytes[536,870,912] * (druid.processing.numMergeBuffers[2] + druid.processing.numThreads[2] + 1)
```

