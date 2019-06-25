## Data Dics

```ini
columns[0  ] as `Year`                 
columns[1  ] as `Quarter`              
columns[2  ] as `Month`                
columns[3  ] as `DayofMonth`           
columns[4  ] as `DayOfWeek`            
columns[5  ] as `FlightDate`           
columns[6  ] as `UniqueCarrier`        
columns[7  ] as `AirlineID`            
columns[8  ] as `Carrier`              
columns[9  ] as `TailNum`              
columns[10 ] as `FlightNum`            
columns[11 ] as `OriginAirportID`      
columns[12 ] as `OriginAirportSeqID`   
columns[13 ] as `OriginCityMarketID`   
columns[14 ] as `Origin`               
columns[15 ] as `OriginCityName`       
columns[16 ] as `OriginState`          
columns[17 ] as `OriginStateFips`      
columns[18 ] as `OriginStateName`      
columns[19 ] as `OriginWac`            
columns[20 ] as `DestAirportID`        
columns[21 ] as `DestAirportSeqID`     
columns[22 ] as `DestCityMarketID`     
columns[23 ] as `Dest`                 
columns[24 ] as `DestCityName`         
columns[25 ] as `DestState`            
columns[26 ] as `DestStateFips`        
columns[27 ] as `DestStateName`        
columns[28 ] as `DestWac`              
columns[29 ] as `CRSDepTime`           
columns[30 ] as `DepTime`              
columns[31 ] as `DepDelay`             
columns[32 ] as `DepDelayMinutes`      
columns[33 ] as `DepDel15`             
columns[34 ] as `DepartureDelayGroups` 
columns[35 ] as `DepTimeBlk`           
columns[36 ] as `TaxiOut`              
columns[37 ] as `WheelsOff`            
columns[38 ] as `WheelsOn`             
columns[39 ] as `TaxiIn`               
columns[40 ] as `CRSArrTime`           
columns[41 ] as `ArrTime`              
columns[42 ] as `ArrDelay`             
columns[43 ] as `ArrDelayMinutes`      
columns[44 ] as `ArrDel15`             
columns[45 ] as `ArrivalDelayGroups`   
columns[46 ] as `ArrTimeBlk`           
columns[47 ] as `Cancelled`            
columns[48 ] as `CancellationCode`     
columns[49 ] as `Diverted`             
columns[50 ] as `CRSElapsedTime`       
columns[51 ] as `ActualElapsedTime`    
columns[52 ] as `AirTime`              
columns[53 ] as `Flights`              
columns[54 ] as `Distance`             
columns[55 ] as `DistanceGroup`        
columns[56 ] as `CarrierDelay`         
columns[57 ] as `WeatherDelay`         
columns[58 ] as `NASDelay`             
columns[59 ] as `SecurityDelay`        
columns[60 ] as `LateAircraftDelay`    
columns[61 ] as `FirstDepTime`         
columns[62 ] as `TotalAddGTime`        
columns[63 ] as `LongestAddGTime`      
columns[64 ] as `DivAirportLandings`   
columns[65 ] as `DivReachedDest`       
columns[66 ] as `DivActualElapsedTime` 
columns[67 ] as `DivArrDelay`          
columns[68 ] as `DivDistance`          
columns[69 ] as `Div1Airport`          
columns[70 ] as `Div1AirportID`        
columns[71 ] as `Div1AirportSeqID`     
columns[72 ] as `Div1WheelsOn`         
columns[73 ] as `Div1TotalGTime`       
columns[74 ] as `Div1LongestGTime`     
columns[75 ] as `Div1WheelsOff`        
columns[76 ] as `Div1TailNum`          
columns[77 ] as `Div2Airport`          
columns[78 ] as `Div2AirportID`        
columns[79 ] as `Div2AirportSeqID`     
columns[80 ] as `Div2WheelsOn`         
columns[81 ] as `Div2TotalGTime`       
columns[82 ] as `Div2LongestGTime`     
columns[83 ] as `Div2WheelsOff`        
columns[84 ] as `Div2TailNum`          
columns[85 ] as `Div3Airport`          
columns[86 ] as `Div3AirportID`        
columns[87 ] as `Div3AirportSeqID`     
columns[88 ] as `Div3WheelsOn`         
columns[89 ] as `Div3TotalGTime`       
columns[90 ] as `Div3LongestGTime`     
columns[91 ] as `Div3WheelsOff`        
columns[92 ] as `Div3TailNum`          
columns[93 ] as `Div4Airport`          
columns[94 ] as `Div4AirportID`        
columns[95 ] as `Div4AirportSeqID`     
columns[96 ] as `Div4WheelsOn`         
columns[97 ] as `Div4TotalGTime`       
columns[98 ] as `Div4LongestGTime`     
columns[99 ] as `Div4WheelsOff`        
columns[100] as `Div4TailNum`          
columns[101] as `Div5Airport`          
columns[102] as `Div5AirportID`        
columns[103] as `Div5AirportSeqID`     
columns[104] as `Div5WheelsOn`         
columns[105] as `Div5TotalGTime`       
columns[106] as `Div5LongestGTime`     
columns[107] as `Div5WheelsOff`        
columns[108] as `Div5TailNum`
```





## CSV





### 1 SELECT COUNT(*) FROM dfs.`/benchmark/ontime/airline-data/*.csv` WHERE columns[33]='1'; 





```sql
SELECT COUNT(*) FROM dfs.`/benchmark/ontime/airline-data/*.csv` WHERE columns[33]='1'; 
```





### Query Cases





> count_by_sub_query	

```sql
SELECT avg(c1) FROM (SELECT `Year`, `Month`, COUNT(*) as c1 FROM dfs.tmp.`/benchmark/data/parquet/airline-data/` GROUP BY `Year`, `Month`);
```



> sum_by_range

```sql
SELECT `DayOfWeek`, COUNT(*) AS c FROM dfs.`/benchmark/data/parquet/ontime/airline/*` WHERE `Year` >= 2000 AND `Year` <= 2008 GROUP BY `DayOfWeek` ORDER BY c DESC;
```



> sum_all

```sql
SELECT `DayOfWeek`, `DepDelay`, count(*) AS c FROM dfs.`/benchmark/data/parquet/ontime/airline/*` WHERE `Year` >= 2000 AND `Year` <= 2008 GROUP BY `DayOfWeek`, `DepDelay` ORDER BY c DESC;
```



> sum_all_year

```sql
SELECT `Origin`, `DepDelay`, count(*) AS c FROM dfs.`/benchmark/data/parquet/ontime/airline/*` WHERE `Year` >= 2000 AND `Year` <= 2008 GROUP BY `Origin`, `DepDelay` ORDER BY c DESC LIMIT 10;
```



> sum_all_filter

```sql
SELECT `Carrier`, avg(TO_NUMBER(`DepDelay`, '###.##') > 10) * 1000 AS c3 FROM dfs.`/benchmark/data/parquet/ontime/airline/*` WHERE `Year` = 2007 GROUP BY `Carrier` ORDER BY Carrier;
```



> mix

```sql
select
   min(`Year`), max(`Year`), `Carrier`, count(*) as cnt,
   sum(`ArrDelayMinutes` >30) as flights_delayed,
   round(sum(`ArrDelayMinutes`>30)/count(*),2) as rate
FROM dfs.`/benchmark/data/parquet/ontime/airline/*`
WHERE
   `DayOfWeek` not in (6,7) and `OriginState` not in ('AK', 'HI', 'PR', 'VI')
   and `DestState` not in ('AK', 'HI', 'PR', 'VI')
   and `FlightDate` < '2010-01-01'
GROUP by `Carrier`
HAVING cnt > 100000 and max(`Year`) > 1990
ORDER by rate DESC
LIMIT 1000;
```



### Spark

```shell
scala>var ontimes = scala>spark.read.parquet("hdfs://flyedw/benchmark/data/parquet/ontime/airline/2019_1.parquet")
```





