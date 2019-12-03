

> nyc-taxi-data 

- yellow-trip sample data

```csv
VendorID,tpep_pickup_datetime,tpep_dropoff_datetime,passenger_count,trip_distance,RatecodeID,store_and_fwd_flag,PULocationID,DOLocationID,payment_type,fare_amount,extra,mta_tax,tip_amount,tolls_amount,improvement_surcharge,total_amount,congestion_surcharge
1,2019-06-01 00:55:13,2019-06-01 00:56:17,1,.00,1,N,145,145,2,3,0.5,0.5,0,0,0.3,4.3,0
1,2019-06-01 00:06:31,2019-06-01 00:06:52,1,.00,1,N,262,263,2,2.5,3,0.5,0,0,0.3,6.3,2.5
1,2019-06-01 00:17:05,2019-06-01 00:36:38,1,4.40,1,N,74,7,2,17.5,0.5,0.5,0,0,0.3,18.8,0
1,2019-06-01 00:59:02,2019-06-01 00:59:12,0,.80,1,N,145,145,2,2.5,1,0.5,0,0,0.3,4.3,0
1,2019-06-01 00:03:25,2019-06-01 00:15:42,1,1.70,1,N,113,148,1,9.5,3,0.5,2.65,0,0.3,15.95,2.5
1,2019-06-01 00:28:31,2019-06-01 00:39:23,2,1.60,1,N,79,125,1,9.5,3,0.5,1,0,0.3,14.3,2.5
1,2019-06-01 00:46:46,2019-06-01 00:50:55,4,.60,1,N,211,148,2,4.5,3,0.5,0,0,0.3,8.3,2.5
1,2019-06-01 00:54:49,2019-06-01 01:02:57,2,1.20,1,N,79,249,1,7.5,3,0.5,1,0,0.3,12.3,2.5
1,2019-06-01 00:09:57,2019-06-01 00:25:54,2,2.00,1,N,158,68,2,11.5,3,0.5,0,0,0.3,15.3,2.5
```



- create table

  ```shell
  create 'yellow_trip','info'
  ```

  

```shel
hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.separator=',' -Dimporttsv.columns=HBASE_ROW_KEY,info:VendorID,info:tpep_pickup_datetime,info:tpep_dropoff_datetime,info:passenger_count,info:trip_distance,info:RatecodeID,info:store_and_fwd_flag,info:PULocationID,info:DOLocationID,info:payment_type,info:fare_amount,info:extra,info:mta_tax,info:tip_amount,info:tolls_amount,info:improvement_surcharge,info:total_amount,info:congestion_surcharge yellow_trip /benchmark/nyc-taxi-data/yellow_tripdata_*.csv
```





```sql
CREATE VIEW "yellow_trip" ( ROWKEY VARCHAR PRIMARY KEY, "info"."VendorID"              INTEGER, "info"."tpep_pickup_datetime"  TIMESTAMP, "info"."tpep_dropoff_datetime" TIMESTAMP, "info"."passenger_count"       INTEGER, "info"."trip_distance"         DOUBLE, "info"."RatecodeID"            VARCHAR, "info"."store_and_fwd_flag"    VARCHAR, "info"."PULocationID"          VARCHAR, "info"."DOLocationID"          VARCHAR, "info"."payment_type"          VARCHAR, "info"."fare_amount"           DOUBLE, "info"."extra"                 DOUBLE, "info"."mta_tax"               DOUBLE, "info"."tip_amount"            DOUBLE, "info"."tolls_amount"          DOUBLE, "info"."improvement_surcharge" DOUBLE, "info"."total_amount"          DOUBLE, "info"."congestion_surcharge"  DOUBLE) ;
```

