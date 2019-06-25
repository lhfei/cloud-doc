以下是官网的一句话，请大家谨记，与君共勉：

> For most serious tasks, you should use engines from the MergeTree family.

### 1. 表引擎的作用是什么？为什么重要？

表引擎之所以重要，是因为其决定了数据的存放和读取方式，从而也就决定了IO效率。

不同的表引擎（也就是不用类型的数据表）决定了以下东西：

- 数据存储和读取的位置
- 支持哪些查询方式
- 能否并发式访问数据
- 能不能使用索引
- 是否可以执行多线程请求
- 数据复制使用的参数

 

### 2. MergeTree家族表引擎

聚合树家族表引擎之所以重要，之所以健壮，得益于以下特征：

- 基于分区键（partitioning key）的数据分区分块存储
- 数据索引排序（基于primary key和order by）
- 支持数据复制（带Replicated前缀的表引擎）
- 支持数据抽样

可以看出上面这些安排都会极大的提高数据读取和查阅的效率（但是另一方面会减慢写入速度，虽然影响很小）。在写入数据时，会按照分区键将数据分成不同的文件夹，然后文件夹内每列数据为不同的独立文件，另外还会有数据的序列化索引排序记录文件（下一节内容会再讲）。通过这样的安排，能够减少数据检索时的数据量。

##### 1）MergeTree

来看一个生产环境中MergeTree表引擎的例子：

```
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
CREATE TABLE ods.access_log (
  add_time DateTime,
  big_app_id String,
  app_id String,
  seq_id Nullable(String),
  uuid Nullable(String),
  time Nullable(String),
  device_key Nullable(String),
  manufacturer Nullable(String),
  model Nullable(String),
  os Nullable(String),
  os_version Nullable(String),
  screen_height Nullable(String),
  screen_width Nullable(String),
  current_event Nullable(String),
  current_page Nullable(String),
  end_time Nullable(String),
  ds Date
) ENGINE = MergeTree() 
PARTITION BY toYYYYMM(ds)
ORDER BY (add_time, big_app_id, app_id) 
SETTINGS index_granularity = 8192
```

下面来解释下各关键字的意思：

- `ENGINE = MergeTree()`：这个没啥好解释的，就是MergeTree表引擎
- `PARTITION BY`：分区，数据将以月份为分区，每个月份一个文件夹；只能为一个字段，但是可以形变（如某个字段的计算后的值等等）
- `ORDER BY`：排序字段，可以理解为多字段的索引排序；关键字后面的格式为一个元组，多元素排序机制与mysql相同，即第一个相同的时候按照第二个排序依次类推
- `index_granularity = 8192`：排序索引的颗粒度；每8192条数据记录一个排序索引值

从这里不难看出，如果被查询的数据中存在于分区或排序字段中，都能大大降低数据查找时间。

##### 2）ReplacingMergeTree

引用官方文档如下：

> The engine differs from MergeTree in that it removes duplicate entries with the same primary key value (or more accurately, with the same sorting key value)…Thus, ReplacingMergeTree is suitable for clearing out duplicate data in the background in order to save space, but it doesn’t guarantee the absence of duplicates.

翻译如下：

> ReplacingMergeTree与MergeTree最大的不同就是：它删除那些重复的数据行（重复的判断标准是order by后面的元组完全相等的数据条目）…因此，ReplacingMergeTree适合于清除重复数据节省存储空间，但是它不保证重复数据不出现。。。

综上，用了也白用，因此建议不用。

##### 3）SummingMergeTree

这个表引擎，怎么说呢，让我感觉找到了知音。来看官网描述：

> The engine inherits from MergeTree. The difference is that when merging data parts for SummingMergeTree tables ClickHouse replaces all the rows with the same primary key (or more accurately, with the same sorting key) with one row which contains summarized values for the columns with the numeric data type. If the sorting key is composed in a way that a single key value corresponds to large number of rows, this significantly reduces storage volume and speeds up data selection.

> We recommend to use the engine together with MergeTree. Store complete data in MergeTree table, and use SummingMergeTree for aggregated data storing, for example, when preparing reports. Such an approach will prevent you from losing valuable data due to an incorrectly composed primary key.

上面一堆文字主要说了啥呢？且听我分解：

- SummingMergeTree会在背地里以sorting key为索引将所有数值型字段求和
- SummingMergeTree配合MergeTree使用，不要太舒服；MergeTree存明细数据，SummingMergeTree存聚合数据

`看到这个地方的时候，我真的是惊喜万分，数据架构师/数据产品经理/数据分析师的福音啊，知音难觅啊。`刚好最近在重构数据开放平台，真的是那句话——从实际业务场景中真刀真枪干出来的企业（我指yandex）所做的产品不会让你失望，总是那么接地气和想你所想。

给大家一个应用场景，大家自己去想吧：用户行为日志数据，经过各种处理后成了大宽表，将维度字段作为sorting keys，那么pv等字段是非常适合用SummingMergeTree表引擎的（uv等字段不行，因为uv不可加和）。总之，那些可加和的字段均是非常舒适的呢。

##### 4）AggregatingMergeTree

AggregatingMergeTree引擎需要配合AggregateFunction使用，而ClickHouse支持的AggregateFunction如下：

- uniq
- anyIf (any+If)
- quantiles

向表中插入数据时使用带`-State`后缀的函数：

```
1
2
3
4
5
6
7
8
9
CREATE MATERIALIZED VIEW test.basic
ENGINE = AggregatingMergeTree() PARTITION BY toYYYYMM(StartDate) ORDER BY (CounterID, StartDate)
AS SELECT
    CounterID,
    StartDate,
    sumState(Sign)    AS Visits,
    uniqState(UserID) AS Users
FROM test.visits
GROUP BY CounterID, StartDate;
```

查询数据时候使用带`-Merge`后缀的函数且需要SQL语句中带上`GROUP BY`关键字：

```
1
2
3
4
5
6
7
SELECT
    StartDate,
    sumMerge(Visits) AS Visits,
    uniqMerge(Users) AS Users
FROM test.basic
GROUP BY StartDate
ORDER BY StartDate;
```

##### 5）CollapsingMergeTree

这个表引擎的核心思想就是：与其去修改一条数据，不如写一条相反的数据将原数据对冲掉，也算是思维清奇了。比如说对于那些状态经常改变的数据，这个表引擎确实能够减轻数据存储负担。

来看官网的解释：

> CollapsingMergeTree asynchronously deletes (collapses) pairs of rows if all of the fields in a row are equivalent excepting the particular field Sign which can have 1 and -1 values. Rows without a pair are kept. For more details see the Collapsing section of the document.The engine may significantly reduce the volume of storage and increase efficiency of SELECT query as a consequence.

举一个应用场景的例子：不停准实时计算用户的累计访问页面数和页面停留时长，并且将结果写入一张表。那么写入下条数据的时候可以删除上条数据再写入一条新的，或者干脆写入两条数据，其中一条对冲掉上面一条数据，另一条数据是最新的计算结果。

由于数据对冲，计算结果中同一个用户或会话永远只有不多于2条数据（根据其算法，如果刚好数据全部对冲掉，是会存两条数据的），具体可以[看其算法](https://clickhouse.yandex/docs/en/operations/table_engines/collapsingmergetree/)。

但是在我看来，有点麻烦。因为每次写入数据，你需要记录上次写入数据的状态，而且数据写入的顺序必须先来先写不然顺序错了就挂了。我喜欢简单直接粗暴一点的东东。比如说直接粗暴写入每条数据，然后记录每条数据的写入时间，查询时计算最后一次写入的数据。

当然，如果对数据存储空间很珍惜或者很稀缺，CollapsingMergeTree不失为一个很好的解决办法（往下看下面的解决办法或许更好）。

##### 6）VersionedCollapsingMergeTree

这个表引擎与第5）点中介绍的类似。不同点见下面的原文，不再赘述：

> VersionedCollapsingMergeTree solves the same problem as the CollapsingMergeTree but uses another algorithm of collapsing. It allows inserting the data in any order with multiple threads. The particular Version column helps to collapse the rows properly even if they are inserted in the wrong order. CollapsingMergeTree allows only strictly consecutive insertion.

##### 7）GraphiteMergeTree

这个表引擎有特定的用途，估计也不常用，放出官网原文：

> This engine is designed for rollup (thinning and aggregating/averaging) Graphite data. It may be helpful to developers who want to use ClickHouse as a data store for Graphite.You can use any ClickHouse table engine to store the Graphite data if you don’t need rollup, but if you need a rollup use GraphiteMergeTree. The engine reduces the volume of storage and increases the efficiency of queries from Graphite.

Graphite是时间序列数据的存储和图表渲染工具。

##### 8）ReplicatedMergeTree

上面讲到的每个MergeTree引擎，前面都可以加上Replicated：

- ReplicatedMergeTree
- ReplicatedSummingMergeTree
- ReplicatedReplacingMergeTree
- ReplicatedAggregatingMergeTree
- ReplicatedCollapsingMergeTree
- ReplicatedVersionedCollapsingMergeTree
- ReplicatedGraphiteMergeTree

一旦加上Replicated，那么表就有了复制功能，结合之前文章讲的，Replicated相关的表引擎配合zookeeper可以实现备份之间的数据同一性。后面讲本地表和分布式表时会再详细的讲Replicated相关的这部分内容。

 

### 3. 小体量数据相关的表引擎

除了MergeTree family的表引擎，ClickHouse还有一些针对小体量数据的表引擎，它们是：

- TinyLog：最简单的表引擎，适合一次写入即终身、多次查询的小数据，不支持并发数据访问，不支持同时写入同时读取。
- Log：The Log engine is appropriate for temporary data, write-once tables, and for testing or demonstration purposes.
- Memory：以直接形式存储在内存中，读写变态快，但是记住是临时的，关机数据消失。
- Buffer：缓冲，可以理解为将数据存储在内存中，然后达到一定阈值限制条件，那么先前的数据会自动写入设定的表格中。这样可以将部分热数据放在内存中缓存，快速访问和读取，而时间较为久远的数据写入表中释放内存，应该比较好理解。
- External data：从字面理解，就是可以将文件数据等引入query语句中利用了。比如你想查找一些在你所给的名单中的用户的消费数据，那么你可以免除复制粘贴，直接将这个名单文件引入并使用，clickhouse会自动给这个文件建立一个临时表。这个取决于clickhouse所支持的文件格式，后面会具体谈到。

个人觉得`External data表引擎`算是数据分析师的小确幸了，因为这种需求确实在日常工作中非常常见。

`Buffer表引擎`也非常不错，想想在项目上线初期，需要实时盯数据，那么这个优势就体现出来了。

 

### 4. 分布式表引擎

之所以把`Distributed`表引擎单独拿出来说，是因为分布式表引擎还是非常重要的。这里就简单的提下，后面讲本地表和分布式表时会再详细的讲。例如：

```
1
Distributed(cluster_1st, ods, access_log_replica, rand())
```

分布式表本身是不存储任何实体数据的，分布式表是实体表的镜像（view）。