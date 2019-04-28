



> 192.168.45.209

```sh
#!/bin/bash

JOB_HOME="."
SERV_NAME="build"
OUT_LOG="out.log"

function startJob() {
  echo "prepare to start ..."
  for year in $(seq 1987 2017); do rsync -avz root@192.168.177.80:/export/app_benchmark/ontime/airline_files/*$year* ./airline_files/; echo "put files in year of $year ..."; hdfs dfs -put ./airline_files/*.csv /benchmark/ontime/airline-data/ done > ${JOB_HOME}/${OUT_LOG} 2>&1 &
  PID=$!
  echo $PID > ${JOB_HOME}/pid
  echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/pid" ]
then
  PID=`cat ${JOB_HOME}/pid`
  if ps -p $PID > /dev/null
  then
    echo "${SERV_NAME} is running as pid is $PID, stop it first"
    exit 1
  else
    startJob
    exit 1
  fi
else
  startJob
  exit 1
fi
```









## Hive



- [x] Database: BENCHMARK

```sql
CREATE DATABASE BENCHMARK;
```



> LINEITEM

```sql
CREATE EXTERNAL TABLE `lineitem`(        
   `l_orderkey` bigint,                             
   `l_partkey` bigint,                              
   `l_suppkey` bigint,                              
   `l_linenumber` bigint,                           
   `l_quantity` decimal(10,0),                      
   `l_extendedprice` decimal(10,0),                 
   `l_discount` decimal(10,0),                      
   `l_tax` decimal(10,0),                           
   `l_returnflag` char(1),                          
   `l_linestatus` char(1),                          
   `l_shipdate` date,                               
   `l_commitdate` date,                             
   `l_receiptdate` date,                            
   `l_shipinstruct` char(25),                       
   `l_shipmode` char(10),                           
   `l_comment` varchar(44))                         
 ROW FORMAT SERDE                                   
   'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
 WITH SERDEPROPERTIES (                             
   'field.delim'='|',                               
   'serialization.format'='|')                      
 STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
 OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
 LOCATION                                           
   'hdfs://tx-220-48-59.h.chinabank.com.cn:8020/benchmark/lineitem' 
 TBLPROPERTIES (
   'bucketing_version'='2',                         
   'transient_lastDdlTime'='1535466140') ;          

```



#### Load Data

```
LOAD DATA INPATH 'hdfs://a01-r03-i164-101-515w96w.jd.local:8020/benchmark/data/*.gz' OVERWRITE INTO TABLE benchmark.lineitem; 
```



#### Partition Table

> airline_data

Parittioned by `Year` and `Month`.

```sql
CREATE EXTERNAL TABLE `airline_data` (
  `Quarter` INT,
  `DayofMonth` INT,
  `DayOfWeek` INT,
  `FlightDate` Date,
  `UniqueCarrier` STRING,
  `AirlineID` BIGINT,
  `Carrier` STRING,
  `TailNum` STRING,
  `FlightNum` STRING,
  `OriginAirportID` BIGINT,
  `OriginAirportSeqID` BIGINT,
  `OriginCityMarketID` BIGINT,
  `Origin` STRING,
  `OriginCityName` STRING,
  `OriginState` STRING,
  `OriginStateFips` STRING,
  `OriginStateName` STRING,
  `OriginWac` BIGINT,
  `DestAirportID` BIGINT,
  `DestAirportSeqID` BIGINT,
  `DestCityMarketID` BIGINT,
  `Dest` STRING,
  `DestCityName` STRING,
  `DestState` STRING,
  `DestStateFips` STRING,
  `DestStateName` STRING,
  `DestWac` BIGINT,
  `CRSDepTime` BIGINT,
  `DepTime` BIGINT,
  `DepDelay` BIGINT,
  `DepDelayMinutes` BIGINT,
  `DepDel15` BIGINT,
  `DepartureDelayGroups` STRING,
  `DepTimeBlk` STRING,
  `TaxiOut` BIGINT,
  `WheelsOff` BIGINT,
  `WheelsOn` BIGINT,
  `TaxiIn` BIGINT,
  `CRSArrTime` BIGINT,
  `ArrTime` BIGINT,
  `ArrDelay` BIGINT,
  `ArrDelayMinutes` BIGINT,
  `ArrDel15` BIGINT,
  `ArrivalDelayGroups` BIGINT,
  `ArrTimeBlk` STRING,
  `Cancelled` INT,
  `CancellationCode` STRING,
  `Diverted` INT,
  `CRSElapsedTime` BIGINT,
  `ActualElapsedTime` BIGINT,
  `AirTime` BIGINT,
  `Flights` BIGINT,
  `Distance` BIGINT,
  `DistanceGroup` INT,
  `CarrierDelay` BIGINT,
  `WeatherDelay` BIGINT,
  `NASDelay` BIGINT,
  `SecurityDelay` BIGINT,
  `LateAircraftDelay` BIGINT,
  `FirstDepTime` STRING,
  `TotalAddGTime` STRING,
  `LongestAddGTime` STRING,
  `DivAirportLandings` STRING,
  `DivReachedDest` STRING,
  `DivActualElapsedTime` STRING,
  `DivArrDelay` STRING,
  `DivDistance` STRING,
  `Div1Airport` STRING,
  `Div1AirportID` BIGINT,
  `Div1AirportSeqID` BIGINT,
  `Div1WheelsOn` STRING,
  `Div1TotalGTime` STRING,
  `Div1LongestGTime` STRING,
  `Div1WheelsOff` STRING,
  `Div1TailNum` STRING,
  `Div2Airport` STRING,
  `Div2AirportID` BIGINT,
  `Div2AirportSeqID` BIGINT,
  `Div2WheelsOn` STRING,
  `Div2TotalGTime` STRING,
  `Div2LongestGTime` STRING,
  `Div2WheelsOff` STRING,
  `Div2TailNum` STRING,
  `Div3Airport` STRING,
  `Div3AirportID` BIGINT,
  `Div3AirportSeqID` BIGINT,
  `Div3WheelsOn` STRING,
  `Div3TotalGTime` STRING,
  `Div3LongestGTime` STRING,
  `Div3WheelsOff` STRING,
  `Div3TailNum` STRING,
  `Div4Airport` STRING,
  `Div4AirportID` BIGINT,
  `Div4AirportSeqID` BIGINT,
  `Div4WheelsOn` STRING,
  `Div4TotalGTime` STRING,
  `Div4LongestGTime` STRING,
  `Div4WheelsOff` STRING,
  `Div4TailNum` STRING,
  `Div5Airport` STRING,
  `Div5AirportID` BIGINT,
  `Div5AirportSeqID` BIGINT,
  `Div5WheelsOn` STRING,
  `Div5TotalGTime` STRING,
  `Div5LongestGTime` STRING,
  `Div5WheelsOff` STRING,
  `Div5TailNum` STRING )
 PARTITIONED BY (`Year` INT, `Month` INT)
 ROW FORMAT SERDE                                   
   'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
 WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
 STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
 OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
 LOCATION                                           
   '/benchmark/ontime/airline-data' 
 TBLPROPERTIES (
   'skip.header.line.count'='1',
   'bucketing_version'='2',                         
   'transient_lastDdlTime'='1535466140') ; 
```



> > load data

```sh
#!/bin/bash

for year in $(seq 1987 2019); 
do 
  for month in $(seq 1 12); 
  do 
    echo "partitioned by [Year = ${year}, Month = ${month}] start to loading ..."
    hive -e "LOAD DATA INPATH '/benchmark/data/ontime/airline-data/*_${year}_${month}.csv' INTO TABLE benchmark.airline_data PARTITION(Year=${year}, Month=${month})"; 
  done; 
done 
```



> > unwrap

```sh
for year in $(seq 1987 2018); do for month in $(seq 1 12); do hive -e "LOAD DATA INPATH '/benchmark/data/ontime/airline-data/*_${year}_${month}.csv' INTO TABLE benchmark.airline_data PARTITION(Year=${year}, Month=${month})"; done; done 
```



> ontime

No partitions.

```sql
CREATE EXTERNAL TABLE `ontime` (
  `Year` INT,
  `Quarter` INT,
  `Month` INT,
  `DayofMonth` INT,
  `DayOfWeek` INT,
  `FlightDate` Date,
  `UniqueCarrier` STRING,
  `AirlineID` BIGINT,
  `Carrier` STRING,
  `TailNum` STRING,
  `FlightNum` STRING,
  `OriginAirportID` BIGINT,
  `OriginAirportSeqID` BIGINT,
  `OriginCityMarketID` BIGINT,
  `Origin` STRING,
  `OriginCityName` STRING,
  `OriginState` STRING,
  `OriginStateFips` STRING,
  `OriginStateName` STRING,
  `OriginWac` BIGINT,
  `DestAirportID` BIGINT,
  `DestAirportSeqID` BIGINT,
  `DestCityMarketID` BIGINT,
  `Dest` STRING,
  `DestCityName` STRING,
  `DestState` STRING,
  `DestStateFips` STRING,
  `DestStateName` STRING,
  `DestWac` BIGINT,
  `CRSDepTime` BIGINT,
  `DepTime` BIGINT,
  `DepDelay` BIGINT,
  `DepDelayMinutes` BIGINT,
  `DepDel15` BIGINT,
  `DepartureDelayGroups` STRING,
  `DepTimeBlk` STRING,
  `TaxiOut` BIGINT,
  `WheelsOff` BIGINT,
  `WheelsOn` BIGINT,
  `TaxiIn` BIGINT,
  `CRSArrTime` BIGINT,
  `ArrTime` BIGINT,
  `ArrDelay` BIGINT,
  `ArrDelayMinutes` BIGINT,
  `ArrDel15` BIGINT,
  `ArrivalDelayGroups` BIGINT,
  `ArrTimeBlk` STRING,
  `Cancelled` INT,
  `CancellationCode` STRING,
  `Diverted` INT,
  `CRSElapsedTime` BIGINT,
  `ActualElapsedTime` BIGINT,
  `AirTime` BIGINT,
  `Flights` BIGINT,
  `Distance` BIGINT,
  `DistanceGroup` INT,
  `CarrierDelay` BIGINT,
  `WeatherDelay` BIGINT,
  `NASDelay` BIGINT,
  `SecurityDelay` BIGINT,
  `LateAircraftDelay` BIGINT,
  `FirstDepTime` STRING,
  `TotalAddGTime` STRING,
  `LongestAddGTime` STRING,
  `DivAirportLandings` STRING,
  `DivReachedDest` STRING,
  `DivActualElapsedTime` STRING,
  `DivArrDelay` STRING,
  `DivDistance` STRING,
  `Div1Airport` STRING,
  `Div1AirportID` BIGINT,
  `Div1AirportSeqID` BIGINT,
  `Div1WheelsOn` STRING,
  `Div1TotalGTime` STRING,
  `Div1LongestGTime` STRING,
  `Div1WheelsOff` STRING,
  `Div1TailNum` STRING,
  `Div2Airport` STRING,
  `Div2AirportID` BIGINT,
  `Div2AirportSeqID` BIGINT,
  `Div2WheelsOn` STRING,
  `Div2TotalGTime` STRING,
  `Div2LongestGTime` STRING,
  `Div2WheelsOff` STRING,
  `Div2TailNum` STRING,
  `Div3Airport` STRING,
  `Div3AirportID` BIGINT,
  `Div3AirportSeqID` BIGINT,
  `Div3WheelsOn` STRING,
  `Div3TotalGTime` STRING,
  `Div3LongestGTime` STRING,
  `Div3WheelsOff` STRING,
  `Div3TailNum` STRING,
  `Div4Airport` STRING,
  `Div4AirportID` BIGINT,
  `Div4AirportSeqID` BIGINT,
  `Div4WheelsOn` STRING,
  `Div4TotalGTime` STRING,
  `Div4LongestGTime` STRING,
  `Div4WheelsOff` STRING,
  `Div4TailNum` STRING,
  `Div5Airport` STRING,
  `Div5AirportID` BIGINT,
  `Div5AirportSeqID` BIGINT,
  `Div5WheelsOn` STRING,
  `Div5TotalGTime` STRING,
  `Div5LongestGTime` STRING,
  `Div5WheelsOff` STRING,
  `Div5TailNum` STRING )
 ROW FORMAT SERDE                                   
   'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'  
 WITH SERDEPROPERTIES (                             
   'field.delim'=',',                               
   'serialization.format'=',')                      
 STORED AS INPUTFORMAT                              
   'org.apache.hadoop.mapred.TextInputFormat'       
 OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat' 
 LOCATION                                           
   '/benchmark/ontime/airline-data' 
 TBLPROPERTIES (
   'skip.header.line.count'='1',
   'bucketing_version'='2',                         
   'transient_lastDdlTime'='1535466140') ;  
```



Load Data

```shell

```



### Stored as Parquet



> ONTIME

```sql
CREATE EXTERNAL TABLE `airline_parquet` (
  `Year` INT,
  `Quarter` INT,
  `Month` INT,
  `DayofMonth` INT,
  `DayOfWeek` INT,
  `FlightDate` Date,
  `UniqueCarrier` STRING,
  `AirlineID` BIGINT,
  `Carrier` STRING,
  `TailNum` STRING,
  `FlightNum` STRING,
  `OriginAirportID` BIGINT,
  `OriginAirportSeqID` BIGINT,
  `OriginCityMarketID` BIGINT,
  `Origin` STRING,
  `OriginCityName` STRING,
  `OriginState` STRING,
  `OriginStateFips` STRING,
  `OriginStateName` STRING,
  `OriginWac` BIGINT,
  `DestAirportID` BIGINT,
  `DestAirportSeqID` BIGINT,
  `DestCityMarketID` BIGINT,
  `Dest` STRING,
  `DestCityName` STRING,
  `DestState` STRING,
  `DestStateFips` STRING,
  `DestStateName` STRING,
  `DestWac` BIGINT,
  `CRSDepTime` BIGINT,
  `DepTime` BIGINT,
  `DepDelay` BIGINT,
  `DepDelayMinutes` BIGINT,
  `DepDel15` BIGINT,
  `DepartureDelayGroups` STRING,
  `DepTimeBlk` STRING,
  `TaxiOut` BIGINT,
  `WheelsOff` BIGINT,
  `WheelsOn` BIGINT,
  `TaxiIn` BIGINT,
  `CRSArrTime` BIGINT,
  `ArrTime` BIGINT,
  `ArrDelay` BIGINT,
  `ArrDelayMinutes` BIGINT,
  `ArrDel15` BIGINT,
  `ArrivalDelayGroups` BIGINT,
  `ArrTimeBlk` STRING,
  `Cancelled` INT,
  `CancellationCode` STRING,
  `Diverted` INT,
  `CRSElapsedTime` BIGINT,
  `ActualElapsedTime` BIGINT,
  `AirTime` BIGINT,
  `Flights` BIGINT,
  `Distance` BIGINT,
  `DistanceGroup` INT,
  `CarrierDelay` BIGINT,
  `WeatherDelay` BIGINT,
  `NASDelay` BIGINT,
  `SecurityDelay` BIGINT,
  `LateAircraftDelay` BIGINT,
  `FirstDepTime` STRING,
  `TotalAddGTime` STRING,
  `LongestAddGTime` STRING,
  `DivAirportLandings` STRING,
  `DivReachedDest` STRING,
  `DivActualElapsedTime` STRING,
  `DivArrDelay` STRING,
  `DivDistance` STRING,
  `Div1Airport` STRING,
  `Div1AirportID` BIGINT,
  `Div1AirportSeqID` BIGINT,
  `Div1WheelsOn` STRING,
  `Div1TotalGTime` STRING,
  `Div1LongestGTime` STRING,
  `Div1WheelsOff` STRING,
  `Div1TailNum` STRING,
  `Div2Airport` STRING,
  `Div2AirportID` BIGINT,
  `Div2AirportSeqID` BIGINT,
  `Div2WheelsOn` STRING,
  `Div2TotalGTime` STRING,
  `Div2LongestGTime` STRING,
  `Div2WheelsOff` STRING,
  `Div2TailNum` STRING,
  `Div3Airport` STRING,
  `Div3AirportID` BIGINT,
  `Div3AirportSeqID` BIGINT,
  `Div3WheelsOn` STRING,
  `Div3TotalGTime` STRING,
  `Div3LongestGTime` STRING,
  `Div3WheelsOff` STRING,
  `Div3TailNum` STRING,
  `Div4Airport` STRING,
  `Div4AirportID` BIGINT,
  `Div4AirportSeqID` BIGINT,
  `Div4WheelsOn` STRING,
  `Div4TotalGTime` STRING,
  `Div4LongestGTime` STRING,
  `Div4WheelsOff` STRING,
  `Div4TailNum` STRING,
  `Div5Airport` STRING,
  `Div5AirportID` BIGINT,
  `Div5AirportSeqID` BIGINT,
  `Div5WheelsOn` STRING,
  `Div5TotalGTime` STRING,
  `Div5LongestGTime` STRING,
  `Div5WheelsOff` STRING,
  `Div5TailNum` STRING )
 ROW FORMAT SERDE                                   
   'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'  
 STORED AS INPUTFORMAT                              
   'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'  
 OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat' 
    LOCATION '/benchmark/data/parquet/ontime/airline';
```



#### Load Data

```sql
for year in $(seq 1987 2018); do hive -e "INSERT INTO TABLE benchmark.airline_parquet SELECT * FROM benchmark.airline_data where Year = ${year}"; done;


#!/bin/bash

for year in $(seq 1987 2019);
do
  for month in $(seq 1 12);
  do
  	echo "partitioned by [Year = ${year}, Month = ${month}] start to converting ..."
	hql="INSERT INTO TABLE benchmark.airline_parquet SELECT Year,Quarter,Month,DayofMonth,DayOfWeek,FlightDate,UniqueCarrier,AirlineID,Carrier,TailNum,FlightNum,OriginAirportID,OriginAirportSeqID,OriginCityMarketID,Origin,OriginCityName,OriginState,OriginStateFips,OriginStateName,OriginWac,DestAirportID,DestAirportSeqID,DestCityMarketID,Dest,DestCityName,DestState,DestStateFips,DestStateName,DestWac,CRSDepTime,DepTime,DepDelay,DepDelayMinutes,DepDel15,DepartureDelayGroups,DepTimeBlk,TaxiOut,WheelsOff,WheelsOn,TaxiIn,CRSArrTime,ArrTime,ArrDelay,ArrDelayMinutes,ArrDel15,ArrivalDelayGroups,ArrTimeBlk,Cancelled,CancellationCode,Diverted,CRSElapsedTime,ActualElapsedTime,AirTime,Flights,Distance,DistanceGroup,CarrierDelay,WeatherDelay,NASDelay,SecurityDelay,LateAircraftDelay,FirstDepTime,TotalAddGTime,LongestAddGTime,DivAirportLandings,DivReachedDest,DivActualElapsedTime,DivArrDelay,DivDistance,Div1Airport,Div1AirportID,Div1AirportSeqID,Div1WheelsOn,Div1TotalGTime,Div1LongestGTime,Div1WheelsOff,Div1TailNum,Div2Airport,Div2AirportID,Div2AirportSeqID,Div2WheelsOn,Div2TotalGTime,Div2LongestGTime,Div2WheelsOff,Div2TailNum,Div3Airport,Div3AirportID,Div3AirportSeqID,Div3WheelsOn,Div3TotalGTime,Div3LongestGTime,Div3WheelsOff,Div3TailNum,Div4Airport,Div4AirportID,Div4AirportSeqID,Div4WheelsOn,Div4TotalGTime,Div4LongestGTime,Div4WheelsOff,Div4TailNum,Div5Airport,Div5AirportID,Div5AirportSeqID,Div5WheelsOn,Div5TotalGTime,Div5LongestGTime,Div5WheelsOff,Div5TailNum FROM benchmark.airline_data where Year = ${year} AND Month = ${month}"
    # echo $hql
	hive -e "$hql"
	hdfs dfs -mv /benchmark/data/parquet/ontime/airline/000000_* /benchmark/data/parquet/ontime/airline/${year}_${month}.parquet
	echo "rename file 000000_0 to 00${year}_${month}"
  done
done
```

