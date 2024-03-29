## Config for cluster of three shards. Each shard stores data on a single replica 

```xml
<remote_servers>
    <perftest_3shards_1replicas>
        <shard>
            <replica>
                <host>example-perftest01j.yandex.ru</host>
                <port>9000</port>
            </replica>
        </shard>
        <shard>
            <replica>
                <host>example-perftest02j.yandex.ru</host>
                <port>9000</port>
            </replica>
        </shard>
        <shard>
            <replica>
                <host>example-perftest03j.yandex.ru</host>
                <port>9000</port>
            </replica>
        </shard>
    </perftest_3shards_1replicas>
</remote_servers>
```





Creating a local table: 

```sql
CREATE TABLE ontime_local (...) ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192);
```



Creating a distributed table providing a view into local tables of the cluster: 

```sql
CREATE TABLE ontime_all AS ontime_local
    ENGINE = Distributed(perftest_3shards_1replicas, default, ontime_local, rand());
```

You can create a Distributed table on all machines in the cluster. This would allow to run distributed queries on any machine of the cluster. Besides distributed table you can also use [*remote* table function](https://clickhouse.yandex/docs/en/table_functions/remote/).

Let's run [INSERT SELECT](https://clickhouse.yandex/docs/en/query_language/queries/#insert) into Distributed table to spread the table to multiple servers.

```
INSERT INTO ontime_all SELECT * FROM ontime;
```

**⚠** Worth to notice that the approach given above wouldn't fit for sharding of large tables.

As you could expect heavy queries are executed N times faster being launched on 3 servers instead of one.

[See here](images/ece020129fdf4a18a6e75daf2e699cb9.png)

![images/ece020129fdf4a18a6e75daf2e699cb9.png](images\ece020129fdf4a18a6e75daf2e699cb9.png)

You may have noticed that quantiles calculation are slightly different. This happens due to [t-digest](https://github.com/tdunning/t-digest/raw/master/docs/t-digest-paper/histo.pdf) algorithm implementation which is non-deterministic — it depends on the order of data processing. 

In this case we have used a cluster with 3 shards each contains a single replica.

To provide for resilience in production environment we recommend that each shard should contain 2-3 replicas distributed between multiple data-centers. Note that ClickHouse supports unlimited number of replicas.



### DDL:

```sql
CREATE TABLE ontime
(
    Year UInt16,
    Quarter UInt8,
    Month UInt8,
    DayofMonth UInt8,
    DayOfWeek UInt8,
    FlightDate Date,
    UniqueCarrier FixedString(7),
    AirlineID Int32,
    Carrier FixedString(2),
    TailNum String,
    FlightNum String,
    OriginAirportID Int32,
    OriginAirportSeqID Int32,
    OriginCityMarketID Int32,
    Origin FixedString(5),
    OriginCityName String,
    OriginState FixedString(2),
    OriginStateFips String,
    OriginStateName String,
    OriginWac Int32,
    DestAirportID Int32,
    DestAirportSeqID Int32,
    DestCityMarketID Int32,
    Dest FixedString(5),
    DestCityName String,
    DestState FixedString(2),
    DestStateFips String,
    DestStateName String,
    DestWac Int32,
    CRSDepTime Int32,
    DepTime Int32,
    DepDelay Int32,
    DepDelayMinutes Int32,
    DepDel15 Int32,
    DepartureDelayGroups String,
    DepTimeBlk String,
    TaxiOut Int32,
    WheelsOff Int32,
    WheelsOn Int32,
    TaxiIn Int32,
    CRSArrTime Int32,
    ArrTime Int32,
    ArrDelay Int32,
    ArrDelayMinutes Int32,
    ArrDel15 Int32,
    ArrivalDelayGroups Int32,
    ArrTimeBlk String,
    Cancelled UInt8,
    CancellationCode FixedString(1),
    Diverted UInt8,
    CRSElapsedTime Int32,
    ActualElapsedTime Int32,
    AirTime Int32,
    Flights Int32,
    Distance Int32,
    DistanceGroup UInt8,
    CarrierDelay Int32,
    WeatherDelay Int32,
    NASDelay Int32,
    SecurityDelay Int32,
    LateAircraftDelay Int32,
    FirstDepTime String,
    TotalAddGTime String,
    LongestAddGTime String,
    DivAirportLandings String,
    DivReachedDest String,
    DivActualElapsedTime String,
    DivArrDelay String,
    DivDistance String,
    Div1Airport String,
    Div1AirportID Int32,
    Div1AirportSeqID Int32,
    Div1WheelsOn String,
    Div1TotalGTime String,
    Div1LongestGTime String,
    Div1WheelsOff String,
    Div1TailNum String,
    Div2Airport String,
    Div2AirportID Int32,
    Div2AirportSeqID Int32,
    Div2WheelsOn String,
    Div2TotalGTime String,
    Div2LongestGTime String,
    Div2WheelsOff String,
    Div2TailNum String,
    Div3Airport String,
    Div3AirportID Int32,
    Div3AirportSeqID Int32,
    Div3WheelsOn String,
    Div3TotalGTime String,
    Div3LongestGTime String,
    Div3WheelsOff String,
    Div3TailNum String,
    Div4Airport String,
    Div4AirportID Int32,
    Div4AirportSeqID Int32,
    Div4WheelsOn String,
    Div4TotalGTime String,
    Div4LongestGTime String,
    Div4WheelsOff String,
    Div4TailNum String,
    Div5Airport String,
    Div5AirportID Int32,
    Div5AirportSeqID Int32,
    Div5WheelsOn String,
    Div5TotalGTime String,
    Div5LongestGTime String,
    Div5WheelsOff String,
    Div5TailNum String
)
ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192);
```



```sql
CREATE TABLE ontime ( Year UInt16, Quarter UInt8, Month UInt8, DayofMonth UInt8, DayOfWeek UInt8, FlightDate Date, UniqueCarrier FixedString(7), AirlineID Int32, Carrier FixedString(2), TailNum String, FlightNum String, OriginAirportID Int32, OriginAirportSeqID Int32, OriginCityMarketID Int32, Origin FixedString(5), OriginCityName String, OriginState FixedString(2), OriginStateFips String, OriginStateName String, OriginWac Int32, DestAirportID Int32, DestAirportSeqID Int32, DestCityMarketID Int32, Dest FixedString(5), DestCityName String, DestState FixedString(2), DestStateFips String, DestStateName String, DestWac Int32, CRSDepTime Int32, DepTime Int32, DepDelay Int32, DepDelayMinutes Int32, DepDel15 Int32, DepartureDelayGroups String, DepTimeBlk String, TaxiOut Int32, WheelsOff Int32, WheelsOn Int32, TaxiIn Int32, CRSArrTime Int32, ArrTime Int32, ArrDelay Int32, ArrDelayMinutes Int32, ArrDel15 Int32, ArrivalDelayGroups Int32, ArrTimeBlk String, Cancelled UInt8, CancellationCode FixedString(1), Diverted UInt8, CRSElapsedTime Int32, ActualElapsedTime Int32, AirTime Int32, Flights Int32, Distance Int32, DistanceGroup UInt8, CarrierDelay Int32, WeatherDelay Int32, NASDelay Int32, SecurityDelay Int32, LateAircraftDelay Int32, FirstDepTime String, TotalAddGTime String, LongestAddGTime String, DivAirportLandings String, DivReachedDest String, DivActualElapsedTime String, DivArrDelay String, DivDistance String, Div1Airport String, Div1AirportID Int32, Div1AirportSeqID Int32, Div1WheelsOn String, Div1TotalGTime String, Div1LongestGTime String, Div1WheelsOff String, Div1TailNum String, Div2Airport String, Div2AirportID Int32, Div2AirportSeqID Int32, Div2WheelsOn String, Div2TotalGTime String, Div2LongestGTime String, Div2WheelsOff String, Div2TailNum String, Div3Airport String, Div3AirportID Int32, Div3AirportSeqID Int32, Div3WheelsOn String, Div3TotalGTime String, Div3LongestGTime String, Div3WheelsOff String, Div3TailNum String, Div4Airport String, Div4AirportID Int32, Div4AirportSeqID Int32, Div4WheelsOn String, Div4TotalGTime String, Div4LongestGTime String, Div4WheelsOff String, Div4TailNum String, Div5Airport String, Div5AirportID Int32, Div5AirportSeqID Int32, Div5WheelsOn String, Div5TotalGTime String, Div5LongestGTime String, Div5WheelsOff String, Div5TailNum String ) ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192); 
```





```sql
CREATE DATABASE  lhfei;
USER lhfei;

CREATE TABLE ontime_local (FlightDate Date,Year UInt16) ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192);

CREATE TABLE ontime_all AS ontime_local ENGINE = Distributed(bip_ck_cluster, lhfei, ontime_local, rand());

-- for local
insert into ontime_local (FlightDate,Year) values('2001-10-12',2001);
insert into ontime_local (FlightDate,Year) values('2002-10-12',2002);
insert into ontime_local (FlightDate,Year) values('2003-10-12',2003);

-- fro distribution
insert into ontime_all (FlightDate,Year) values('2003-10-12',2008);

select count(*) from system.ontime_all;
```





## Config for cluster of one shard containing three replicas 



```xml
<remote_servers>
    <perftest_1shards_3replicas>
      <shard>
        <internal_replication>false</internal_replication>
        <replica>
          <host>host-10-182-57-104</host>
          <port>9000</port>
          <user>default</user>
          <password>Lhfei</password>
        </replica>
        <replica>
          <host>host-10-182-57-106</host>
          <port>9000</port>
          <user>default</user>
          <password>Lhfei</password>
        </replica>
        <replica>
          <host>host-10-182-57-111</host>
          <port>9000</port>
          <user>default</user>
          <password>Lhfei</password>
        </replica>
      </shard>
    </perftest_1shards_3replicas>
</remote_servers>
```





To enable replication [ZooKeeper](http://zookeeper.apache.org/) is required. ClickHouse will take care of data consistency on all replicas and run restore procedure after failure automatically. It's recommended to deploy ZooKeeper cluster to separate servers.

ZooKeeper is not a requirement — in some simple cases you can duplicate the data by writing it into all the replicas from your application code. This approach is not recommended — in this case ClickHouse is not able to guarantee data consistency on all replicas. This remains the responsibility of your application.

Set ZooKeeper locations in configuration file :

```xml
<zookeeper-servers>
    <node>
        <host>host-10-182-57-104</host>
        <port>2181</port>
    </node>
    <node>
        <host>host-10-182-57-106</host>
        <port>2181</port>
    </node>
    <node>
        <host>host-10-182-57-111</host>
        <port>2181</port>
    </node>
</zookeeper-servers>
```

Also we need to set macros for identifying shard and replica — it will be used on table creation 

```xml
<macros>
    <shard>01</shard>
    <replica>${HOSTNAME}</replica>
</macros>
```



If there are no replicas at the moment on replicated table creation — a new first replica will be instantiated. If there are already live replicas — new replica will clone the data from existing ones. You have an option to create all replicated tables first and that insert data to it. Another option is to create some replicas and add the others after or during data insertion. 

```sql
CREATE TABLE ontime_replica (FlightDate Date,Year UInt16)
ENGINE = ReplicatedMergeTree(
    '/clickhouse_perftest/tables/{shard}/ontime_local',
    '{replica}',
    FlightDate,
    (Year, FlightDate),
    8192);
```

```
CREATE TABLE ontime_replica (FlightDate Date,Year UInt16) ENGINE = ReplicatedMergeTree( '/clickhouse_perftest/tables/{shard}/ontime_local', '{replica}', FlightDate, (Year, FlightDate), 8192); 
```



Here we use [ReplicatedMergeTree](https://clickhouse.yandex/docs/en/table_engines/replication/#replicatedmergetree) table type. In parameters we specify ZooKeeper path containing shard and replica identifiers.

```
INSERT INTO ontime_replica SELECT * FROM ontime;
```

Replication operates in multi-master mode. Data can be loaded into any replica — it will be synced with other instances automatically. Replication is asynchronous so at a given moment of time not all replicas may contain recently inserted data. To allow data insertion at least one replica should be up. Others will sync up data and repair consistency once they will become active again. Please notice that such scheme allows for the possibility of just appended data loss.



### DDL:

```sql
CREATE DATABASE  lhfei;
USE lhfei;

CREATE TABLE ontime_local (FlightDate Date,Year UInt16) ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192);

CREATE TABLE ontime_all AS ontime_local ENGINE = ReplicatedMergeTree( '/perftest_1shards_3replicas/tables/{shard}/ontime_local', '{replica}', FlightDate, (Year, FlightDate), 8192); 

-- for local
insert into ontime_local (FlightDate,Year) values('2001-10-12',2001);
insert into ontime_local (FlightDate,Year) values('2002-10-12',2002);
insert into ontime_local (FlightDate,Year) values('2003-10-12',2003);

-- fro distribution
insert into ontime_all (FlightDate,Year) values('2003-10-12',2008);

select count(*) from system.ontime_all;
```

