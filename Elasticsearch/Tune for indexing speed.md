##  Tune for indexing speed[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

### Use bulk requests[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

Bulk requests will yield much better performance than single-document index requests. In order to know the optimal size of a bulk request, you should run a benchmark on a single node with a single shard. First try to index 100 documents at once, then 200, then 400, etc. doubling the number of documents in a bulk request in every benchmark run. When the indexing speed starts to plateau then you know you reached the optimal size of a bulk request for your data. In case of tie, it is better to err in the direction of too few rather than too many documents. Beware that too large bulk requests might put the cluster under memory pressure when many of them are sent concurrently, so it is advisable to avoid going beyond a couple tens of megabytes per request even if larger requests seem to perform better.

### Use multiple workers/threads to send data to Elasticsearch[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

A single thread sending bulk requests is unlikely to be able to max out the indexing capacity of an Elasticsearch cluster. In order to use all resources of the cluster, you should send data from multiple threads or processes. In addition to making better use of the resources of the cluster, this should help reduce the cost of each fsync.

Make sure to watch for `TOO_MANY_REQUESTS (429)` response codes (`EsRejectedExecutionException` with the Java client), which is the way that Elasticsearch tells you that it cannot keep up with the current indexing rate. When it happens, you should pause indexing a bit before trying again, ideally with randomized exponential backoff.

Similarly to sizing bulk requests, only testing can tell what the optimal number of workers is. This can be tested by progressively increasing the number of workers until either I/O or CPU is saturated on the cluster.

### Unset or increase the refresh interval[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

The operation that consists of making changes visible to search - called a [refresh](https://www.elastic.co/guide/en/elasticsearch/reference/master/indices-refresh.html) - is costly, and calling it often while there is ongoing indexing activity can hurt indexing speed.

By default, Elasticsearch periodically refreshes indices every second, but only on indices that have received one search request or more in the last 30 seconds.

This is the optimal configuration if you have no or very little search traffic (e.g. less than one search request every 5 minutes) and want to optimize for indexing speed. This behavior aims to automatically optimize bulk indexing in the default case when no searches are performed. In order to opt out of this behavior set the refresh interval explicitly.

On the other hand, if your index experiences regular search requests, this default behavior means that Elasticsearch will refresh your index every 1 second. If you can afford to increase the amount of time between when a document gets indexed and when it becomes visible, increasing the [`index.refresh_interval`](https://www.elastic.co/guide/en/elasticsearch/reference/master/index-modules.html#index-refresh-interval-setting) to a larger value, e.g. `30s`, might help improve indexing speed.

### Disable refresh and replicas for initial loads[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

If you need to load a large amount of data at once, you should disable refresh by setting `index.refresh_interval` to `-1` and set `index.number_of_replicas` to `0`. This will temporarily put your index at risk since the loss of any shard will cause data loss, but at the same time indexing will be faster since documents will be indexed only once. Once the initial loading is finished, you can set `index.refresh_interval` and `index.number_of_replicas` back to their original values.

### Disable swapping[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

You should make sure that the operating system is not swapping out the java process by [disabling swapping](https://www.elastic.co/guide/en/elasticsearch/reference/master/setup-configuration-memory.html).

### Give memory to the filesystem cache[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

The filesystem cache will be used in order to buffer I/O operations. You should make sure to give at least half the memory of the machine running Elasticsearch to the filesystem cache.

### Use auto-generated ids[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

When indexing a document that has an explicit id, Elasticsearch needs to check whether a document with the same id already exists within the same shard, which is a costly operation and gets even more costly as the index grows. By using auto-generated ids, Elasticsearch can skip this check, which makes indexing faster.

### Use faster hardware[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

If indexing is I/O bound, you should investigate giving more memory to the filesystem cache (see above) or buying faster drives. In particular SSD drives are known to perform better than spinning disks. Always use local storage, remote filesystems such as `NFS` or `SMB` should be avoided. Also beware of virtualized storage such as Amazon’s `Elastic Block Storage`. Virtualized storage works very well with Elasticsearch, and it is appealing since it is so fast and simple to set up, but it is also unfortunately inherently slower on an ongoing basis when compared to dedicated local storage. If you put an index on `EBS`, be sure to use provisioned IOPS otherwise operations could be quickly throttled.

Stripe your index across multiple SSDs by configuring a RAID 0 array. Remember that it will increase the risk of failure since the failure of any one SSD destroys the index. However this is typically the right tradeoff to make: optimize single shards for maximum performance, and then add replicas across different nodes so there’s redundancy for any node failures. You can also use [snapshot and restore](https://www.elastic.co/guide/en/elasticsearch/reference/master/modules-snapshots.html) to backup the index for further insurance.

### Indexing buffer size[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

If your node is doing only heavy indexing, be sure [`indices.memory.index_buffer_size`](https://www.elastic.co/guide/en/elasticsearch/reference/master/indexing-buffer.html) is large enough to give at most 512 MB indexing buffer per shard doing heavy indexing (beyond that indexing performance does not typically improve). Elasticsearch takes that setting (a percentage of the java heap or an absolute byte-size), and uses it as a shared buffer across all active shards. Very active shards will naturally use this buffer more than shards that are performing lightweight indexing.

The default is `10%` which is often plenty: for example, if you give the JVM 10GB of memory, it will give 1GB to the index buffer, which is enough to host two shards that are heavily indexing.

### Additional optimizations[edit](https://github.com/elastic/elasticsearch/edit/master/docs/reference/how-to/indexing-speed.asciidoc)

Many of the strategies outlined in [*Tune for disk usage*](https://www.elastic.co/guide/en/elasticsearch/reference/master/tune-for-disk-usage.html) also provide an improvement in the speed of indexing.