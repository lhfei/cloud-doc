# ClickHouse Data Distribution

ClickHouse approach to data distribution in the cluster is pretty low level thanks to shared nothing architecture. Is is very flexible, for instance it is possible to combine different topologies in a single cluster, manage multiple logical clusters using shared configuration etc.

The distributed topology is defined by two main properties that mimic two main cluster features: scalability and reliability.

- Scalability is defined by data being sharded or segmented
- Reliability is defined by data replication

Data sharding and replication are completely independent. Sharding is a natural part of ClickHouse while replication heavily relies on Zookeeper that is used to notify replicas about state changes. ClickHouse can operate without replication, but it makes sense to have it configured even if not used for two reasons:

1. Even if replication is not used now, it may be needed later
2. Inserts to replicated tables are acknowledged by Zookeeper that tracks checksums of the last 100 inserted blocks to avoid duplicates and silently aborts inserts if the block was already successfully inserted before.

# Distributed tables

Distributed tables are used to access tables (data shards) located at different servers using a single table interface. Distributed tables are defined by 'Distributed' engine and are in fact interfaces or umbrellas over the shard tables.

```
ENGINE = Distributed(<cluster>, <database>, <shard table> [, sharding_key])
```

'cluster' here refers to a cluster topology definition in ClickHouse config file that defines how the data is distributed across different nodes. Shard tables must exist and have the same structure at every node. It is possible to define different topologies in one system at the same time, for example:

- segmented. Every cluster node stores unique shard/segment of the data.
- segmented mirrored. Cluster nodes are grouped by two (or more) in shards, each data segment is stored at all nodes of the shard
- cross segmented. Every node stores two or more shards, every shard is stored on two or more nodes.
- single server. Data is located at a single server but can be accessed from every node via distributed interface.

Let's see two simple examples of different topologies over two nodes.

'segmented' cluster configuration example:

```xml
<remote_servers>
    <segmented>
        <shard>
            <replica>
                <host>chdw1-1</host>
                <port>9000</port>
            </replica>
        </shard>
        <shard>
            <replica>
                <host>chdw1-2</host>
                <port>9000</port>
            </replica>
        </shard>
    </segmented>
</remote_servers>
```

'replicated' cluster configuration example.

```xml
<remote_servers>
    <replicated>
        <shard>
            <internal_replication>true</internal_replication>
            <replica>
                <host>chdw1-1</host>
                <port>9000</port>
            </replica>
            <replica>
                <host>chdw1-2</host>
                <port>9000</port>
            </replica>
        </shard>
</remote_servers>
```

Cluster configuration can be updated on the fly. So if new nodes are added to the distributed tables no server restart is necessary.

Inside one ClickHouse system it is possible to use different clusters, e.g. some tables may be sharded with no replication, others with replication, etc. Also it is possible to store some data at 'sub clusters' but access them via global distributed tables.

It is easier to treat the distributed table as just an interface. It is recommended to do a client-side segmentation and insert data into local shard tables on ClickHouse nodes. However it is also possible to insert into distributed table directly as well. In this case ClickHouse distributes data using a hash function on top of the sharding key. For additional details please refer to [ClickHouse documentation](https://clickhouse.yandex/docs/en/single/index.html#document-table_engines/distributed)

So if there as a single node table that needs to be scaled out to multiple servers, the procedure is the follows:

1. Create shard tables at new servers
2. Re-distribute data if necessary (manually is better, though ClickHouse has some support for re-sharding as well)
3. Define cluster configuration and place it on every ClickHouse node
4. Create a Distributed table to access the data from multiple shards

Cluster extension is even easier, since it only requires change in config file to include new server(s).



# Replicated tables

Replicated tables are used to store multiple copies of the data at different servers. As mentioned above replication requires Zookeeper cluster to be available. Zookeper is referenced by a section in config file:

```xml
<zookeeper>
    <node>
        <host>host1</host>
        <port>2181</port>
    </node>
</zookeeper>
```

It could be one or multiple node sections, and every host may resolve to one or multiple IPs.

In order to create replicated tables the Replicated* family of table engines should be used. Here is the basic syntax:

```ini
ENGINE = ReplicatedMergeTree('<path_in_zookeper>', '{replica}', <date_partition_column>, (sort columns), 8192)
```

Different Zookeeper paths allow to support different replication topologies. Since it is tough to create a custom path for every table at every node, ClickHouse provides macro substitution mechanism. Macros are defined in each node's config file (it makes sense to have a separate file for this purpose, for example /etc/clickhouse-server/conf.d/macros.xml) and are referenced in curly brackets. For replicated tables macros participate in two places:

- The path to the table's znode in Zookeeper
- Replica name The tables with the same ZooKeeper path will be replicas of the particular data shard. Inserts may go to any replica, and ClickHouse takes over the replication to make sure all replicas are in consistent state. Consistency is not forced on inserts, replication is asynchronous.

Different replication topologies can be emulated using different Zookeper paths. E.g. macros configuration file may look like the following:

```xml
<macros>
    <cluster>MyFirstCluster</cluster>
    <replica>chdw1-5</replica>
    <shard>5</shard>
</macros>
```

In this example 3 macros are defined:

- {cluster} - the nickname of the ClickHouse cluster to distinguish data between different clusters.
- {shard} - the shard number or symbolic reference
- {replica} - the name of the replica, usually matches hostname

Let's see a few examples of setting up replicated tables.

## Immutable Dimensions (a full replica on each node)

```ini
ENGINE = ReplicatedMergeTree('/clickhouse/{cluster}/tables/<table_name>', '{replica}', <date_partition_column>, (sort columns), 8192)
```

## Mutable dimensions (a full replica on each node)

```ini
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{cluster}/tables/<table_name>', '{replica}', <date_partition_column>, (sort columns), 8192)
```

The only diference from the previous example is 'Replacing' version of MergeTree that allow to replace data by primary key.

## Sharded tables (each node has a subset of data)

```ini
ENGINE = ReplicatedMergeTree('/clickhouse/{cluster}/tables/<table_name>/{shard}', '{replica}', <date_partition_column>, (sort columns), 8192)
```

Additional implementation details can be found in [ClickHouse documentation](https://clickhouse.yandex/docs/en/single/index.html#document-table_engines/replication)

As you can see setting up a replication requires tables to be initially created with replicaion in mind. So it makes sense to consider it upfront when building up the system. Once configured, maitenance operations like adding or replacing replicas, increasing replication factor etc. can be performed on configuration level.