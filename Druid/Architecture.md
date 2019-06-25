# Architecture

Druid has a multi-process, distributed architecture that is designed to be cloud-friendly and easy to operate. Each Druid process type can be configured and scaled independently, giving you maximum flexibility over your cluster. This design also provides enhanced fault tolerance: an outage of one component will not immediately affect other components.

## Processes and Servers

Druid has several process types, briefly described below:

- [**Coordinator**](http://druid.io/docs/latest/design/coordinator.html) processes manage data availability on the cluster.
- [**Overlord**](http://druid.io/docs/latest/design/overlord.html) processes control the assignment of data ingestion workloads.
- [**Broker**](http://druid.io/docs/latest/design/broker.html) processes handle queries from external clients.
- [**Router**](http://druid.io/docs/latest/development/router.html) processes are optional processes that can route requests to Brokers, Coordinators, and Overlords.
- [**Historical**](http://druid.io/docs/latest/design/historical.html) processes store queryable data.
- [**MiddleManager**](http://druid.io/docs/latest/design/middlemanager.html) processes are responsible for ingesting data.

Druid processes can be deployed any way you like, but for ease of deployment we suggest organizing them into three server types: Master, Query, and Data.

- **Master**: Runs Coordinator and Overlord processes, manages data availability and ingestion.
- **Query**: Runs Broker and optional Router processes, handles queries from external clients.
- **Data**: Runs Historical and MiddleManager processes, executes ingestion workloads and stores all queryable data.

For more details on process and server organization, please see [Druid Processses and Servers](http://druid.io/docs/latest/design/processes.html).

### External dependencies

In addition to its built-in process types, Druid also has three external dependencies. These are intended to be able to leverage existing infrastructure, where present.

#### Deep storage

Shared file storage accessible by every Druid server. This is typically going to be a distributed object store like S3 or HDFS, or a network mounted filesystem. Druid uses this to store any data that has been ingested into the system.

Druid uses deep storage only as a backup of your data and as a way to transfer data in the background between Druid processes. To respond to queries, Historical processes do not read from deep storage, but instead read pre-fetched segments from their local disks before any queries are served. This means that Druid never needs to access deep storage during a query, helping it offer the best query latencies possible. It also means that you must have enough disk space both in deep storage and across your Historical processes for the data you plan to load.

For more details, please see [Deep storage dependency](http://druid.io/docs/latest/dependencies/deep-storage.html).

#### Metadata storage

The metadata storage holds various shared system metadata such as segment availability information and task information. This is typically going to be a traditional RDBMS like PostgreSQL or MySQL.

For more details, please see [Metadata storage dependency](http://druid.io/docs/latest/dependencies/metadata-storage.html)

#### Zookeeper

Used for internal service discovery, coordination, and leader election.

For more details, please see [Zookeeper dependency](http://druid.io/docs/latest/dependencies/zookeeper.html).

The idea behind this architecture is to make a Druid cluster simple to operate in production at scale. For example, the separation of deep storage and the metadata store from the rest of the cluster means that Druid processes are radically fault tolerant: even if every single Druid server fails, you can still relaunch your cluster from data stored in deep storage and the metadata store.

### Architecture diagram

The following diagram shows how queries and data flow through this architecture, using the suggested Master/Query/Data server organization:

![img](http://druid.io/docs/img/druid-architecture.png)

# Datasources and segments

Druid data is stored in "datasources", which are similar to tables in a traditional RDBMS. Each datasource is partitioned by time and, optionally, further partitioned by other attributes. Each time range is called a "chunk" (for example, a single day, if your datasource is partitioned by day). Within a chunk, data is partitioned into one or more "segments". Each segment is a single file, typically comprising up to a few million rows of data. Since segments are organized into time chunks, it's sometimes helpful to think of segments as living on a timeline like the following:

![img](http://druid.io/docs/img/druid-timeline.png)

A datasource may have anywhere from just a few segments, up to hundreds of thousands and even millions of segments. Each segment starts life off being created on a MiddleManager, and at that point, is mutable and uncommitted. The segment building process includes the following steps, designed to produce a data file that is compact and supports fast queries:

- Conversion to columnar format
- Indexing with bitmap indexes
- Compression using various algorithms
  - Dictionary encoding with id storage minimization for String columns
  - Bitmap compression for bitmap indexes
  - Type-aware compression for all columns

Periodically, segments are committed and published. At this point, they are written to [deep storage](http://druid.io/docs/latest/design/index.html#deep-storage), become immutable, and move from MiddleManagers to the Historical processes (see [Architecture](http://druid.io/docs/latest/design/index.html#architecture) above for details). An entry about the segment is also written to the [metadata store](http://druid.io/docs/latest/design/index.html#metadata-storage). This entry is a self-describing bit of metadata about the segment, including things like the schema of the segment, its size, and its location on deep storage. These entries are what the Coordinator uses to know what data *should* be available on the cluster.

# Query processing

Queries first enter the Broker, where the Broker will identify which segments have data that may pertain to that query. The list of segments is always pruned by time, and may also be pruned by other attributes depending on how your datasource is partitioned. The Broker will then identify which Historicals and MiddleManagers are serving those segments and send a rewritten subquery to each of those processes. The Historical/MiddleManager processes will take in the queries, process them and return results. The Broker receives results and merges them together to get the final answer, which it returns to the original caller.

Broker pruning is an important way that Druid limits the amount of data that must be scanned for each query, but it is not the only way. For filters at a more granular level than what the Broker can use for pruning, indexing structures inside each segment allow Druid to figure out which (if any) rows match the filter set before looking at any row of data. Once Druid knows which rows match a particular query, it only accesses the specific columns it needs for that query. Within those columns, Druid can skip from row to row, avoiding reading data that doesn't match the query filter.

So Druid uses three different techniques to maximize query performance:

- Pruning which segments are accessed for each query.
- Within each segment, using indexes to identify which rows must be accessed.
- Within each segment, only reading the specific rows and columns that are relevant to a particular query.