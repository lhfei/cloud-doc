

> ontime

```sql
create database benchmark;
use benchmark;

CREATE TABLE `ontime` (
  `Year` UInt16,
  `Quarter` UInt8,
  `Month` UInt8,
  `DayofMonth` UInt8,
  `DayOfWeek` UInt8,
  `FlightDate` Date,
  `UniqueCarrier` FixedString(7),
  `AirlineID` Int32,
  `Carrier` FixedString(2),
  `TailNum` String,
  `FlightNum` String,
  `OriginAirportID` Int32,
  `OriginAirportSeqID` Int32,
  `OriginCityMarketID` Int32,
  `Origin` FixedString(5),
  `OriginCityName` String,
  `OriginState` FixedString(2),
  `OriginStateFips` String,
  `OriginStateName` String,
  `OriginWac` Int32,
  `DestAirportID` Int32,
  `DestAirportSeqID` Int32,
  `DestCityMarketID` Int32,
  `Dest` FixedString(5),
  `DestCityName` String,
  `DestState` FixedString(2),
  `DestStateFips` String,
  `DestStateName` String,
  `DestWac` Int32,
  `CRSDepTime` Int32,
  `DepTime` Int32,
  `DepDelay` Int32,
  `DepDelayMinutes` Int32,
  `DepDel15` Int32,
  `DepartureDelayGroups` String,
  `DepTimeBlk` String,
  `TaxiOut` Int32,
  `WheelsOff` Int32,
  `WheelsOn` Int32,
  `TaxiIn` Int32,
  `CRSArrTime` Int32,
  `ArrTime` Int32,
  `ArrDelay` Int32,
  `ArrDelayMinutes` Int32,
  `ArrDel15` Int32,
  `ArrivalDelayGroups` Int32,
  `ArrTimeBlk` String,
  `Cancelled` UInt8,
  `CancellationCode` FixedString(1),
  `Diverted` UInt8,
  `CRSElapsedTime` Int32,
  `ActualElapsedTime` Int32,
  `AirTime` Int32,
  `Flights` Int32,
  `Distance` Int32,
  `DistanceGroup` UInt8,
  `CarrierDelay` Int32,
  `WeatherDelay` Int32,
  `NASDelay` Int32,
  `SecurityDelay` Int32,
  `LateAircraftDelay` Int32,
  `FirstDepTime` String,
  `TotalAddGTime` String,
  `LongestAddGTime` String,
  `DivAirportLandings` String,
  `DivReachedDest` String,
  `DivActualElapsedTime` String,
  `DivArrDelay` String,
  `DivDistance` String,
  `Div1Airport` String,
  `Div1AirportID` Int32,
  `Div1AirportSeqID` Int32,
  `Div1WheelsOn` String,
  `Div1TotalGTime` String,
  `Div1LongestGTime` String,
  `Div1WheelsOff` String,
  `Div1TailNum` String,
  `Div2Airport` String,
  `Div2AirportID` Int32,
  `Div2AirportSeqID` Int32,
  `Div2WheelsOn` String,
  `Div2TotalGTime` String,
  `Div2LongestGTime` String,
  `Div2WheelsOff` String,
  `Div2TailNum` String,
  `Div3Airport` String,
  `Div3AirportID` Int32,
  `Div3AirportSeqID` Int32,
  `Div3WheelsOn` String,
  `Div3TotalGTime` String,
  `Div3LongestGTime` String,
  `Div3WheelsOff` String,
  `Div3TailNum` String,
  `Div4Airport` String,
  `Div4AirportID` Int32,
  `Div4AirportSeqID` Int32,
  `Div4WheelsOn` String,
  `Div4TotalGTime` String,
  `Div4LongestGTime` String,
  `Div4WheelsOff` String,
  `Div4TailNum` String,
  `Div5Airport` String,
  `Div5AirportID` Int32,
  `Div5AirportSeqID` Int32,
  `Div5WheelsOn` String,
  `Div5TotalGTime` String,
  `Div5LongestGTime` String,
  `Div5WheelsOff` String,
  `Div5TailNum` String
) ENGINE = MergeTree(FlightDate, (Year, FlightDate), 8192);
```



```
CREATE TABLE ontime_all AS ontime
    ENGINE = Distributed(bip_ck_cluster, benchmark, ontime, rand());
```





```shell
for i in ./ontime/*.zip; do echo $i; unzip -cq $i '*.csv' | sed 's/\.00//g' | clickhouse-client -m -u lhfei --password Lhfei -d benchmark --query="INSERT INTO ontime FORMAT CSVWithNames"; done
```



> lineitem

```sql
CREATE TABLE `lineitem` (
  `l_orderkey`    		Nullable(Int32),
  `l_partkey`     		Int32,
  `l_suppkey`     		Nullable(Int32),
  `l_linenumber`  		Nullable(Int32),
  `l_quantity`    		Nullable(Float32),
  `l_extendedprice` 	Nullable(Float32),
  `l_discount`    		Nullable(Float32),
  `l_tax`         		Nullable(Float32),
  `l_returnflag`  		Nullable(FixedString(1)),
  `l_linestatus`  		Nullable(FixedString(1)),
  `l_shipdate`    		Date,
  `l_commitdate`  		Nullable(Date),
  `l_receiptdate` 		Nullable(Date),
  `l_shipinstruct` 		Nullable(String),
  `l_shipmode`     		Nullable(String),
  `l_comment`      		Nullable(String)
) ENGINE MergeTree() PARTITION BY toYYYYMM(l_shipdate) ORDER BY (l_partkey, l_shipdate) SETTINGS index_granularity=8192 ;
```



```
CREATE TABLE lineitem_all AS lineitem
    ENGINE = Distributed(bip_ck_cluster, benchmark, lineitem_huge, rand());
```





```shell
for i in ./lineitem/lineitem*.gz; do echo $i; gunzip -cq $i '*.tbl.*' | sed 's/.$/"/' | sed 's/^/"/' | sed 's/|/","/g' | clickhouse-client -m -u lhfei --password Lhfei -d benchmark --query="INSERT INTO lineitem FORMAT CSV"  ; done
```

