# REST API

- [Overview](#Overview)
- Storage
  - [Segments](Segments)
- Node Types
  - Historical
  - Broker
  - Coordinator
  - Indexing Service
  - Realtime
- Dependencies
  - Deep Storage
  - Metadata Storage
  - ZooKeeper





## Overview







## Segments

Druid stores its index in *segment files*, which are partitioned by time. In a basic setup, one segment file is created for each time interval, where the time interval is configurable in the `segmentGranularity` parameter of the `granularitySpec`, which is documented [here](http://druid.io/docs/latest/ingestion/batch-ingestion.html). For druid to operate well under heavy query load, it is important for the segment file size to be within the recommended range of 300mb-700mb. If your segment files are larger than this range, then consider either changing the granularity of the time interval or partitioning your data and tweaking the `targetPartitionSize` in your `partitioningSpec` (a good starting point for this parameter is 5 million rows). See the sharding section below and the 'Partitioning specification' section of the [Batch ingestion](http://druid.io/docs/latest/ingestion/batch-ingestion.html) documentation for more information.

### A segment file's core data structures

Here we describe the internal structure of segment files, which is essentially *columnar*: the data for each column is laid out in separate data structures. By storing each column separately, Druid can decrease query latency by scanning only those columns actually needed for a query. There are three basic column types: the timestamp column, dimension columns, and metric columns, as illustrated in the image below:

![Druid column types](http://druid.io/docs/img/druid-column-types.png)

The timestamp and metric columns are simple: behind the scenes each of these is an array of integer or floating point values compressed with LZ4. Once a query knows which rows it needs to select, it simply decompresses these, pulls out the relevant rows, and applies the desired aggregation operator. As with all columns, if a query doesn’t require a column, then that column’s data is just skipped over.

Dimensions columns are different because they support filter and group-by operations, so each dimension requires the following three data structures:

1. A dictionary that maps values (which are always treated as strings) to integer IDs,
2. A list of the column’s values, encoded using the dictionary in 1, and
3. For each distinct value in the column, a bitmap that indicates which rows contain that value.

Why these three data structures? The dictionary simply maps string values to integer ids so that the values in 2 and 3 can be represented compactly. The bitmaps in 3 -- also known as *inverted indexes* allow for quick filtering operations (specifically, bitmaps are convenient for quickly applying AND and OR operators). Finally, the list of values in 2 is needed for *group by* and *TopN* queries. In other words, queries that solely aggregate metrics based on filters do not need to touch the list of dimension values stored in 2.

To get a concrete sense of these data structures, consider the ‘page’ column from the example data above. The three data structures that represent this dimension are illustrated in the diagram below.

```
1: Dictionary that encodes column values
  {
    "Justin Bieber": 0,
    "Ke$ha":         1
  }

2: Column data
  [0,
   0,
   1,
   1]

3: Bitmaps - one for each unique value of the column
  value="Justin Bieber": [1,1,0,0]
  value="Ke$ha":         [0,0,1,1]
```

Note that the bitmap is different from the first two data structures: whereas the first two grow linearly in the size of the data (in the worst case), the size of the bitmap section is the product of data size * column cardinality. Compression will help us here though because we know that for each row in 'column data', there will only be a single bitmap that has non-zero entry. This means that high cardinality columns will have extremely sparse, and therefore highly compressible, bitmaps. Druid exploits this using compression algorithms that are specially suited for bitmaps, such as roaring bitmap compression.

### Multi-value columns

If a data source makes use of multi-value columns, then the data structures within the segment files look a bit different. Let's imagine that in the example above, the second row were tagged with both the 'Ke$ha' *and* 'Justin Bieber' topics. In this case, the three data structures would now look as follows:

```
1: Dictionary that encodes column values
  {
    "Justin Bieber": 0,
    "Ke$ha":         1
  }

2: Column data
  [0,
   [0,1],  <--Row value of multi-value column can have array of values
   1,
   1]

3: Bitmaps - one for each unique value
  value="Justin Bieber": [1,1,0,0]
  value="Ke$ha":         [0,1,1,1]
                            ^
                            |
                            |
    Multi-value column has multiple non-zero entries
```

Note the changes to the second row in the column data and the Ke$ha bitmap. If a row has more than one value for a column, its entry in the 'column data' is an array of values. Additionally, a row with *n* values in 'column data' will have *n* non-zero valued entries in bitmaps.

## Naming Convention

Identifiers for segments are typically constructed using the segment datasource, interval start time (in ISO 8601 format), interval end time (in ISO 8601 format), and a version. If data is additionally sharded beyond a time range, the segment identifier will also contain a partition number.

An example segment identifier may be: datasource_intervalStart_intervalEnd_version_partitionNum

## Segment Components

Behind the scenes, a segment is comprised of several files, listed below.

- `version.bin`

  4 bytes representing the current segment version as an integer. E.g., for v9 segments, the version is 0x0, 0x0, 0x0, 0x9

- `meta.smoosh`

  A file with metadata (filenames and offsets) about the contents of the other `smoosh` files

- `XXXXX.smoosh`

  There are some number of these files, which are concatenated binary data

  The `smoosh` files represent multiple files "smooshed" together in order to minimize the number of file descriptors that must be open to house the data. They are files of up to 2GB in size (to match the limit of a memory mapped ByteBuffer in Java). The `smoosh` files house individual files for each of the columns in the data as well as an `index.drd` file with extra metadata about the segment.

  There is also a special column called `__time` that refers to the time column of the segment. This will hopefully become less and less special as the code evolves, but for now it’s as special as my Mommy always told me I am.

In the codebase, segments have an internal format version. The current segment format version is `v9`.

## Format of a column

Each column is stored as two parts:

1. A Jackson-serialized ColumnDescriptor
2. The rest of the binary for the column

A ColumnDescriptor is essentially an object that allows us to use jackson’s polymorphic deserialization to add new and interesting methods of serialization with minimal impact to the code. It consists of some metadata about the column (what type is it, is it multi-value, etc.) and then a list of serde logic that can deserialize the rest of the binary.

## Sharding Data to Create Segments

### Sharding

Multiple segments may exist for the same interval of time for the same datasource. These segments form a `block` for an interval. Depending on the type of `shardSpec` that is used to shard the data, Druid queries may only complete if a `block` is complete. That is to say, if a block consists of 3 segments, such as:

`sampleData_2011-01-01T02:00:00:00Z_2011-01-01T03:00:00:00Z_v1_0`

`sampleData_2011-01-01T02:00:00:00Z_2011-01-01T03:00:00:00Z_v1_1`

`sampleData_2011-01-01T02:00:00:00Z_2011-01-01T03:00:00:00Z_v1_2`

All 3 segments must be loaded before a query for the interval `2011-01-01T02:00:00:00Z_2011-01-01T03:00:00:00Z` completes.

The exception to this rule is with using linear shard specs. Linear shard specs do not force 'completeness' and queries can complete even if shards are not loaded in the system. For example, if your real-time ingestion creates 3 segments that were sharded with linear shard spec, and only two of the segments were loaded in the system, queries would return results only for those 2 segments.





## Historical Node

For Historical Node Configuration, see [Historial Configuration](http://druid.io/docs/latest/configuration/historical.html).

Historical nodes load up historical segments and expose them for querying.

## Running

```
io.druid.cli.Main server historical
```

## Loading and Serving Segments

Each historical node maintains a constant connection to Zookeeper and watches a configurable set of Zookeeper paths for new segment information. Historical nodes do not communicate directly with each other or with the coordinator nodes but instead rely on Zookeeper for coordination.

The [Coordinator](http://druid.io/docs/latest/design/coordinator.html) node is responsible for assigning new segments to historical nodes. Assignment is done by creating an ephemeral Zookeeper entry under a load queue path associated with a historical node. For more information on how the coordinator assigns segments to historical nodes, please see [Coordinator](http://druid.io/docs/latest/design/coordinator.html).

When a historical node notices a new load queue entry in its load queue path, it will first check a local disk directory (cache) for the information about segment. If no information about the segment exists in the cache, the historical node will download metadata about the new segment to serve from Zookeeper. This metadata includes specifications about where the segment is located in deep storage and about how to decompress and process the segment. For more information about segment metadata and Druid segments in general, please see [Segments](http://druid.io/docs/latest/design/segments.html). Once a historical node completes processing a segment, the segment is announced in Zookeeper under a served segments path associated with the node. At this point, the segment is available for querying.

## Loading and Serving Segments From Cache

Recall that when a historical node notices a new segment entry in its load queue path, the historical node first checks a configurable cache directory on its local disk to see if the segment had been previously downloaded. If a local cache entry already exists, the historical node will directly read the segment binary files from disk and load the segment.

The segment cache is also leveraged when a historical node is first started. On startup, a historical node will search through its cache directory and immediately load and serve all segments that are found. This feature allows historical nodes to be queried as soon they come online.

## Querying Segments

Please see [Querying](http://druid.io/docs/latest/querying/querying.html) for more information on querying historical nodes.

A historical can be configured to log and report metrics for every query it services.

## HTTP Endpoints

The historical node exposes several HTTP endpoints for interactions.

### GET

- `/status`

Returns the Druid version, loaded extensions, memory used, total memory and other useful information about the node.

- `/druid/historical/v1/loadstatus`

Returns JSON of the form `{"cacheInitialized":<value>}`, where value is either `true` or `false` indicating if all segments in the local cache have been loaded. This can be used to know when a historical node is ready to be queried after a restart.

- `/druid/historical/v1/readiness`

Similar to `/druid/historical/v1/loadstatus`, but instead of returning JSON with a flag, responses 200 OK if segments in the local cache have been loaded, and 503 SERVICE UNAVAILABLE, if they haven't.



## Broker

For Broker Node Configuration, see [Broker Configuration](http://druid.io/docs/latest/configuration/broker.html).

The Broker is the node to route queries to if you want to run a distributed cluster. It understands the metadata published to ZooKeeper about what segments exist on what nodes and routes queries such that they hit the right nodes. This node also merges the result sets from all of the individual nodes together. On start up, Realtime nodes announce themselves and the segments they are serving in Zookeeper.

## Running

```
io.druid.cli.Main server broker
```

## Forwarding Queries

Most druid queries contain an interval object that indicates a span of time for which data is requested. Likewise, Druid [Segments](http://druid.io/docs/latest/design/segments.html)are partitioned to contain data for some interval of time and segments are distributed across a cluster. Consider a simple datasource with 7 segments where each segment contains data for a given day of the week. Any query issued to the datasource for more than one day of data will hit more than one segment. These segments will likely be distributed across multiple nodes, and hence, the query will likely hit multiple nodes.

To determine which nodes to forward queries to, the Broker node first builds a view of the world from information in Zookeeper. Zookeeper maintains information about [Historical](http://druid.io/docs/latest/design/historical.html) and [Realtime](http://druid.io/docs/latest/design/realtime.html) nodes and the segments they are serving. For every datasource in Zookeeper, the Broker node builds a timeline of segments and the nodes that serve them. When queries are received for a specific datasource and interval, the Broker node performs a lookup into the timeline associated with the query datasource for the query interval and retrieves the nodes that contain data for the query. The Broker node then forwards down the query to the selected nodes.

## Caching

Broker nodes employ a cache with a LRU cache invalidation strategy. The broker cache stores per-segment results. The cache can be local to each broker node or shared across multiple nodes using an external distributed cache such as [memcached](http://memcached.org/). Each time a broker node receives a query, it ﬁrst maps the query to a set of segments. A subset of these segment results may already exist in the cache and the results can be directly pulled from the cache. For any segment results that do not exist in the cache, the broker node will forward the query to the historical nodes. Once the historical nodes return their results, the broker will store those results in the cache. Real-time segments are never cached and hence requests for real-time data will always be forwarded to real-time nodes. Real-time data is perpetually changing and caching the results would be unreliable.

## HTTP Endpoints

The broker node exposes several HTTP endpoints for interactions.

### GET

- `/status`

Returns the Druid version, loaded extensions, memory used, total memory and other useful information about the node.

- `/druid/v2/datasources`

Returns a list of queryable datasources.

- `/druid/v2/datasources/{dataSourceName}`

Returns the dimensions and metrics of the datasource. Optionally, you can provide request parameter "full" to get list of served intervals with dimensions and metrics being served for those intervals. You can also provide request param "interval" explicitly to refer to a particular interval.

If no interval is specified, a default interval spanning a configurable period before the current time will be used. The duration of this interval is specified in ISO8601 format via:

druid.query.segmentMetadata.defaultHistory

- `/druid/v2/datasources/{dataSourceName}/dimensions`

Returns the dimensions of the datasource.

- `/druid/v2/datasources/{dataSourceName}/metrics`

Returns the metrics of the datasource.

- `/druid/v2/datasources/{dataSourceName}/candidates?intervals={comma-separated-intervals-in-ISO8601-format}&numCandidates={numCandidates}`

Returns segment information lists including server locations for the given datasource and intervals. If "numCandidates" is not specified, it will return all servers for each interval.

- `/druid/broker/v1/loadstatus`

Returns a flag indicating if the broker knows about all segments in Zookeeper. This can be used to know when a broker node is ready to be queried after a restart.

### POST

- `/druid/v2/candidates/`

Returns segment information lists including server locations for the given query.



## Coordinator Node

For Coordinator Node Configuration, see [Coordinator Configuration](http://druid.io/docs/latest/configuration/coordinator.html).

The Druid coordinator node is primarily responsible for segment management and distribution. More specifically, the Druid coordinator node communicates to historical nodes to load or drop segments based on configurations. The Druid coordinator is responsible for loading new segments, dropping outdated segments, managing segment replication, and balancing segment load.

The Druid coordinator runs periodically and the time between each run is a configurable parameter. Each time the Druid coordinator runs, it assesses the current state of the cluster before deciding on the appropriate actions to take. Similar to the broker and historical nodes, the Druid coordinator maintains a connection to a Zookeeper cluster for current cluster information. The coordinator also maintains a connection to a database containing information about available segments and rules. Available segments are stored in a segment table and list all segments that should be loaded in the cluster. Rules are stored in a rule table and indicate how segments should be handled.

Before any unassigned segments are serviced by historical nodes, the available historical nodes for each tier are first sorted in terms of capacity, with least capacity servers having the highest priority. Unassigned segments are always assigned to the nodes with least capacity to maintain a level of balance between nodes. The coordinator does not directly communicate with a historical node when assigning it a new segment; instead the coordinator creates some temporary information about the new segment under load queue path of the historical node. Once this request is seen, the historical node will load the segment and begin servicing it.

### Running

```
io.druid.cli.Main server coordinator
```

## Rules

Segments can be automatically loaded and dropped from the cluster based on a set of rules. For more information on rules, see [Rule Configuration](http://druid.io/docs/latest/operations/rule-configuration.html).

## Cleaning Up Segments

Each run, the Druid coordinator compares the list of available database segments in the database with the current segments in the cluster. Segments that are not in the database but are still being served in the cluster are flagged and appended to a removal list. Segments that are overshadowed (their versions are too old and their data has been replaced by newer segments) are also dropped. Note that if all segments in database are deleted(or marked unused), then coordinator will not drop anything from the historicals. This is done to prevent a race condition in which the coordinator would drop all segments if it started running cleanup before it finished polling the database for available segments for the first time and believed that there were no segments.

## Segment Availability

If a historical node restarts or becomes unavailable for any reason, the Druid coordinator will notice a node has gone missing and treat all segments served by that node as being dropped. Given a sufficient period of time, the segments may be reassigned to other historical nodes in the cluster. However, each segment that is dropped is not immediately forgotten. Instead, there is a transitional data structure that stores all dropped segments with an associated lifetime. The lifetime represents a period of time in which the coordinator will not reassign a dropped segment. Hence, if a historical node becomes unavailable and available again within a short period of time, the historical node will start up and serve segments from its cache without any those segments being reassigned across the cluster.

## Balancing Segment Load

To ensure an even distribution of segments across historical nodes in the cluster, the coordinator node will find the total size of all segments being served by every historical node each time the coordinator runs. For every historical node tier in the cluster, the coordinator node will determine the historical node with the highest utilization and the historical node with the lowest utilization. The percent difference in utilization between the two nodes is computed, and if the result exceeds a certain threshold, a number of segments will be moved from the highest utilized node to the lowest utilized node. There is a configurable limit on the number of segments that can be moved from one node to another each time the coordinator runs. Segments to be moved are selected at random and only moved if the resulting utilization calculation indicates the percentage difference between the highest and lowest servers has decreased.

## HTTP Endpoints

The coordinator node exposes several HTTP endpoints for interactions.

### GET

- `/status`

Returns the Druid version, loaded extensions, memory used, total memory and other useful information about the node.

#### Coordinator information

- `/druid/coordinator/v1/leader`

Returns the current leader coordinator of the cluster.

- `/druid/coordinator/v1/isLeader`

Returns a JSON object with field "leader", either true or false, indicating if this server is the current leader coordinator of the cluster. In addition, returns HTTP 200 if the server is the current leader and HTTP 404 if not. This is suitable for use as a load balancer status check if you only want the active leader to be considered in-service at the load balancer.

- `/druid/coordinator/v1/loadstatus`

Returns the percentage of segments actually loaded in the cluster versus segments that should be loaded in the cluster.

- `/druid/coordinator/v1/loadstatus?simple`

Returns the number of segments left to load until segments that should be loaded in the cluster are available for queries. This does not include replication.

- `/druid/coordinator/v1/loadstatus?full`

Returns the number of segments left to load in each tier until segments that should be loaded in the cluster are all available. This includes replication.

- `/druid/coordinator/v1/loadqueue`

Returns the ids of segments to load and drop for each historical node.

- `/druid/coordinator/v1/loadqueue?simple`

Returns the number of segments to load and drop, as well as the total segment load and drop size in bytes for each historical node.

- `/druid/coordinator/v1/loadqueue?full`

Returns the serialized JSON of segments to load and drop for each historical node.

#### Metadata store information

- `/druid/coordinator/v1/metadata/datasources`

Returns a list of the names of enabled datasources in the cluster.

- `/druid/coordinator/v1/metadata/datasources?includeDisabled`

Returns a list of the names of enabled and disabled datasources in the cluster.

- `/druid/coordinator/v1/metadata/datasources?full`

Returns a list of all enabled datasources with all metadata about those datasources as stored in the metadata store.

- `/druid/coordinator/v1/metadata/datasources/{dataSourceName}`

Returns full metadata for a datasource as stored in the metadata store.

- `/druid/coordinator/v1/metadata/datasources/{dataSourceName}/segments`

Returns a list of all segments for a datasource as stored in the metadata store.

- `/druid/coordinator/v1/metadata/datasources/{dataSourceName}/segments?full`

Returns a list of all segments for a datasource with the full segment metadata as stored in the metadata store.

- POST `/druid/coordinator/v1/metadata/datasources/{dataSourceName}/segments`

Returns a list of all segments, overlapping with any of given intervals, for a datasource as stored in the metadata store. Request body is array of string intervals like [interval1, interval2,...] for example ["2012-01-01T00:00:00.000/2012-01-03T00:00:00.000", "2012-01-05T00:00:00.000/2012-01-07T00:00:00.000"]

- POST `/druid/coordinator/v1/metadata/datasources/{dataSourceName}/segments?full`

Returns a list of all segments, overlapping with any of given intervals, for a datasource with the full segment metadata as stored in the metadata store. Request body is array of string intervals like [interval1, interval2,...] for example ["2012-01-01T00:00:00.000/2012-01-03T00:00:00.000", "2012-01-05T00:00:00.000/2012-01-07T00:00:00.000"]

- `/druid/coordinator/v1/metadata/datasources/{dataSourceName}/segments/{segmentId}`

Returns full segment metadata for a specific segment as stored in the metadata store.

#### Datasources information

- `/druid/coordinator/v1/datasources`

Returns a list of datasource names found in the cluster.

- `/druid/coordinator/v1/datasources?simple`

Returns a list of JSON objects containing the name and properties of datasources found in the cluster. Properties include segment count, total segment byte size, minTime, and maxTime.

- `/druid/coordinator/v1/datasources?full`

Returns a list of datasource names found in the cluster with all metadata about those datasources.

- `/druid/coordinator/v1/datasources/{dataSourceName}`

Returns a JSON object containing the name and properties of a datasource. Properties include segment count, total segment byte size, minTime, and maxTime.

- `/druid/coordinator/v1/datasources/{dataSourceName}?full`

Returns full metadata for a datasource .

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals`

Returns a set of segment intervals.

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals?simple`

Returns a map of an interval to a JSON object containing the total byte size of segments and number of segments for that interval.

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals?full`

Returns a map of an interval to a map of segment metadata to a set of server names that contain the segment for that interval.

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals/{interval}`

Returns a set of segment ids for an ISO8601 interval. Note that {interval} parameters are delimited by a `_` instead of a `/` (e.g., 2016-06-27_2016-06-28).

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals/{interval}?simple`

Returns a map of segment intervals contained within the specified interval to a JSON object containing the total byte size of segments and number of segments for an interval.

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals/{interval}?full`

Returns a map of segment intervals contained within the specified interval to a map of segment metadata to a set of server names that contain the segment for an interval.

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals/{interval}/serverview`

Returns a map of segment intervals contained within the specified interval to information about the servers that contain the segment for an interval.

- `/druid/coordinator/v1/datasources/{dataSourceName}/segments`

Returns a list of all segments for a datasource in the cluster.

- `/druid/coordinator/v1/datasources/{dataSourceName}/segments?full`

Returns a list of all segments for a datasource in the cluster with the full segment metadata.

- `/druid/coordinator/v1/datasources/{dataSourceName}/segments/{segmentId}`

Returns full segment metadata for a specific segment in the cluster.

- `/druid/coordinator/v1/datasources/{dataSourceName}/tiers`

Return the tiers that a datasource exists in.

#### Rules

- `/druid/coordinator/v1/rules`

Returns all rules as JSON objects for all datasources in the cluster including the default datasource.

- `/druid/coordinator/v1/rules/{dataSourceName}`

Returns all rules for a specified datasource.

- `/druid/coordinator/v1/rules/{dataSourceName}?full`

Returns all rules for a specified datasource and includes default datasource.

- `/druid/coordinator/v1/rules/history?interval=<interval>`

Returns audit history of rules for all datasources. default value of interval can be specified by setting `druid.audit.manager.auditHistoryMillis` (1 week if not configured) in coordinator runtime.properties

- `/druid/coordinator/v1/rules/history?count=<n>`

Returns last entries of audit history of rules for all datasources.

- `/druid/coordinator/v1/rules/{dataSourceName}/history?interval=<interval>`

Returns audit history of rules for a specified datasource. default value of interval can be specified by setting `druid.audit.manager.auditHistoryMillis` (1 week if not configured) in coordinator runtime.properties

- `/druid/coordinator/v1/rules/{dataSourceName}/history?count=<n>`

Returns last entries of audit history of rules for a specified datasource.

#### Intervals

Note that {interval} parameters are delimited by a `_` instead of a `/` (e.g., 2016-06-27_2016-06-28).

- `/druid/coordinator/v1/intervals`

Returns all intervals for all datasources with total size and count.

- `/druid/coordinator/v1/intervals/{interval}`

Returns aggregated total size and count for all intervals that intersect given isointerval.

- `/druid/coordinator/v1/intervals/{interval}?simple`

Returns total size and count for each interval within given isointerval.

- `/druid/coordinator/v1/intervals/{interval}?full`

Returns total size and count for each datasource for each interval within given isointerval.

### POST

#### Datasources

- `/druid/coordinator/v1/datasources/{dataSourceName}`

Enables all segments of datasource which are not overshadowed by others.

- `/druid/coordinator/v1/datasources/{dataSourceName}/segments/{segmentId}`

Enables a segment.

#### Rules

- `/druid/coordinator/v1/rules/{dataSourceName}`

POST with a list of rules in JSON form to update rules.

Optional Header Parameters for auditing the config change can also be specified.

| Header Param Name | Description                              | Default |
| ----------------- | ---------------------------------------- | ------- |
| `X-Druid-Author`  | author making the config change          | ""      |
| `X-Druid-Comment` | comment describing the change being done | ""      |

### DELETE

#### Datasources

- `/druid/coordinator/v1/datasources/{dataSourceName}`

Disables a datasource.

- `/druid/coordinator/v1/datasources/{dataSourceName}/intervals/{interval}`
- `@Deprecated. /druid/coordinator/v1/datasources/{dataSourceName}?kill=true&interval={myISO8601Interval}`

Runs a [Kill task](http://druid.io/docs/latest/ingestion/tasks.html) for a given interval and datasource.

Note that {interval} parameters are delimited by a `_` instead of a `/` (e.g., 2016-06-27_2016-06-28).

- `/druid/coordinator/v1/datasources/{dataSourceName}/segments/{segmentId}`

Disables a segment.

## The Coordinator Console

The Druid coordinator exposes a web GUI for displaying cluster information and rule configuration. After the coordinator starts, the console can be accessed at:

```
http://<COORDINATOR_IP>:<COORDINATOR_PORT>
```

There exists a full cluster view (which shows only the realtime and historical nodes), as well as views for individual historical nodes, datasources and segments themselves. Segment information can be displayed in raw JSON form or as part of a sortable and filterable table.

The coordinator console also exposes an interface to creating and editing rules. All valid datasources configured in the segment database, along with a default datasource, are available for configuration. Rules of different types can be added, deleted or edited.

## FAQ

1. **Do clients ever contact the coordinator node?**

   The coordinator is not involved in a query.

   historical nodes never directly contact the coordinator node. The Druid coordinator tells the historical nodes to load/drop data via Zookeeper, but the historical nodes are completely unaware of the coordinator.

   Brokers also never contact the coordinator. Brokers base their understanding of the data topology on metadata exposed by the historical nodes via ZK and are completely unaware of the coordinator.

2. **Does it matter if the coordinator node starts up before or after other processes?**

   No. If the Druid coordinator is not started up, no new segments will be loaded in the cluster and outdated segments will not be dropped. However, the coordinator node can be started up at any time, and after a configurable delay, will start running coordinator tasks.

   This also means that if you have a working cluster and all of your coordinators die, the cluster will continue to function, it just won’t experience any changes to its data topology.





## Indexing Service

For Indexing Service Configuration, see [Indexing Service Configuration](http://druid.io/docs/latest/configuration/indexing-service.html).

The indexing service is a highly-available, distributed service that runs indexing related tasks. Indexing service [tasks](http://druid.io/docs/latest/ingestion/tasks.html) create (and sometimes destroy) Druid [segments](http://druid.io/docs/latest/design/segments.html). The indexing service has a master/slave like architecture.

The indexing service is composed of three main components: a peon component that can run a single task, a [Middle Manager](http://druid.io/docs/latest/design/middlemanager.html)component that manages peons, and an overlord component that manages task distribution to middle managers. Overlords and middle managers may run on the same node or across multiple nodes while middle managers and [Peons](http://druid.io/docs/latest/design/peons.html) always run on the same node.

## Indexing Service Overview

![Indexing Service](http://druid.io/docs/img/indexing_service.png)

## Overlord Node

The overlord node is responsible for accepting tasks, coordinating task distribution, creating locks around tasks, and returning statuses to callers. Overlord can be configured to run in one of two modes - local or remote (local being default). In local mode overlord is also responsible for creating peons for executing tasks. When running the overlord in local mode, all middle manager and peon configurations must be provided as well. Local mode is typically used for simple workflows. In remote mode, the overlord and middle manager are run in separate processes and you can run each on a different server. This mode is recommended if you intend to use the indexing service as the single endpoint for all Druid indexing.

#### Leadership status

If you have multiple overlords, just one is leading at any given time. The others are on standby. To get the current leader overlord of the cluster, call:

```
http://<OVERLORD_IP>:<port>/druid/indexer/v1/leader
```

To see if a given server is the current leader overlord of the cluster, call:

```
http://<OVERLORD_IP>:<port>/druid/indexer/v1/isLeader
```

This returns a JSON object with field "leader", either true or false. In addition, this call returns HTTP 200 if the server is the current leader and HTTP 404 if not. This is suitable for use as a load balancer status check if you only want the active leader to be considered in-service at the load balancer.

#### Submitting Tasks and Querying Task Status

Tasks are submitted to the overlord node in the form of JSON objects. Tasks can be submitted via POST requests to:

```
http://<OVERLORD_IP>:<port>/druid/indexer/v1/task
```

this will return the taskId of the submitted task.

Tasks can be shut down via POST requests to:

```
http://<OVERLORD_IP>:<port>/druid/indexer/v1/task/{taskId}/shutdown
```

Task statuses can be retrieved via GET requests to:

```
http://<OVERLORD_IP>:<port>/druid/indexer/v1/task/{taskId}/status
```

Task segments can be retrieved via GET requests to:

```
http://<OVERLORD_IP>:<port>/druid/indexer/v1/task/{taskId}/segments
```

#### Overlord Console

The overlord console can be used to view pending tasks, running tasks, available workers, and recent worker creation and termination. The console can be accessed at:

```
http://<OVERLORD_IP>:<port>/console.html
```

#### Blacklisted Workers

If the workers fail tasks above a threshold, the overlord will blacklist these workers. No more than 20% of the nodes can be blacklisted. Blacklisted nodes will be periodically whitelisted.

The following vairables can be used to set the threshold and blacklist timeouts.

```
druid.indexer.runner.maxRetriesBeforeBlacklist
druid.indexer.runner.workerBlackListBackoffTime
druid.indexer.runner.workerBlackListCleanupPeriod
druid.indexer.runner.maxPercentageBlacklistWorkers
```

#### Autoscaling

The Autoscaling mechanisms currently in place are tightly coupled with our deployment infrastructure but the framework should be in place for other implementations. We are highly open to new implementations or extensions of the existing mechanisms. In our own deployments, middle manager nodes are Amazon AWS EC2 nodes and they are provisioned to register themselves in a [galaxy](https://github.com/ning/galaxy) environment.

If autoscaling is enabled, new middle managers may be added when a task has been in pending state for too long. Middle managers may be terminated if they have not run any tasks for a period of time.

## Middle Managers

See [Middle Manager](http://druid.io/docs/latest/design/middlemanager.html).

## Peons

See [Peon](http://druid.io/docs/latest/design/peons.html).

## Tasks

See [Tasks](http://druid.io/docs/latest/ingestion/tasks.html).

## HTTP Endpoints

### GET

- `/status`

Returns the Druid version, loaded extensions, memory used, total memory and other useful information about the node.



## Real-time Node

For Real-time Node Configuration, see [Realtime Configuration](http://druid.io/docs/latest/configuration/realtime.html).

For Real-time Ingestion, see [Realtime Ingestion](http://druid.io/docs/latest/ingestion/stream-ingestion.html).

Realtime nodes provide a realtime index. Data indexed via these nodes is immediately available for querying. Realtime nodes will periodically build segments representing the data they’ve collected over some span of time and transfer these segments off to [Historical](http://druid.io/docs/latest/design/historical.html) nodes. They use ZooKeeper to monitor the transfer and the metadata storage to store metadata about the transferred segment. Once transfered, segments are forgotten by the Realtime nodes.

### Running

```
io.druid.cli.Main server realtime
```

## Segment Propagation

The segment propagation diagram for real-time data ingestion can be seen below:

![Segment Propagation](http://druid.io/docs/img/segmentPropagation.png)

You can read about the various components shown in this diagram under the Architecture section (see the menu on the right). Note that some of the names are now outdated.

### Firehose

See [Firehose](http://druid.io/docs/latest/ingestion/firehose.html).

### Plumber

See [Plumber](http://druid.io/docs/latest/design/plumber.html)

## Extending the code

Realtime integration is intended to be extended in two ways:

1. Connect to data streams from varied systems ([Firehose](https://github.com/druid-io/druid-api/blob/master/src/main/java/io/druid/data/input/FirehoseFactory.java))
2. Adjust the publishing strategy to match your needs ([Plumber](https://github.com/druid-io/druid/blob/master/server/src/main/java/io/druid/segment/realtime/plumber/PlumberSchool.java))

The expectations are that the former will be very common and something that users of Druid will do on a fairly regular basis. Most users will probably never have to deal with the latter form of customization. Indeed, we hope that all potential use cases can be packaged up as part of Druid proper without requiring proprietary customization.

Given those expectations, adding a firehose is straightforward and completely encapsulated inside of the interface. Adding a plumber is more involved and requires understanding of how the system works to get right, it’s not impossible, but it’s not intended that individuals new to Druid will be able to do it immediately.

## HTTP Endpoints

The real-time node exposes several HTTP endpoints for interactions.

### GET

- `/status`

Returns the Druid version, loaded extensions, memory used, total memory and other useful information about the node.