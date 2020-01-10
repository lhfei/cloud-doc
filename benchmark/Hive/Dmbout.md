





### Hive Table

#### dmbout_orc

```sql
CREATE EXTERNAL TABLE `dmbout_orc`( 
  `merchant_no` string ,              
  `member_id` string ,               
  `account_name` string ,            
  `detail_create_date` string ,        
  `out_trade_no` string ,           
  `account_balance` string ,         
  `in_amount` string ,               
  `out_amount` string ,              
  `trade_desc` string ,              
  `bill_date` string ,               
  `ext_min` string ,                
  `order_seq_no` bigint )                                        
ROW FORMAT SERDE                                   
  'org.apache.hadoop.hive.ql.io.orc.OrcSerde'      
STORED AS INPUTFORMAT                              
  'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'  
OUTPUTFORMAT                                       
  'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat' 
LOCATION                                           
  'hdfs://nn1:8020/benchmark/data/orc/dmbout' 
```



#### dmbout

```sql
CREATE EXTERNAL TABLE `dmbout`( 
  `create_date` string ,
  `merchant_no` string ,              
  `member_id` string ,               
  `account_name` string ,            
  `detail_create_date` string ,        
  `out_trade_no` string ,           
  `account_balance` string ,         
  `in_amount` string ,               
  `out_amount` string ,              
  `trade_desc` string ,              
  `bill_date` string ,               
  `ext_min` string ,                
  `order_seq_no` bigint )              
PARTITIONED BY (`year` INT, `month` string)                        
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
  'hdfs://nn1:8020/benchmark/dmbout/' 
TBLPROPERTIES (
  'skip.header.line.count'='1',
  'bucketing_version'='2',                         
  'transient_lastDdlTime'='1535466140') ; 
```



#### dmbout

```sql
CREATE EXTERNAL TABLE `dmbout`( 
  `create_date` string ,
  `merchant_no` string ,              
  `member_id` string ,               
  `account_name` string ,            
  `detail_create_date` string ,        
  `out_trade_no` string ,           
  `account_balance` string ,         
  `in_amount` string ,               
  `out_amount` string ,              
  `trade_desc` string ,              
  `bill_date` string ,               
  `ext_min` string ,                
  `order_seq_no` bigint )              
PARTITIONED BY (`year` INT, `month` string)                        
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
  'alluxio://zk@zk1:2181,zk2:2181,zk3:2181/benchmark/dmbout/' 
TBLPROPERTIES (
  'skip.header.line.count'='1',
  'bucketing_version'='2',                         
  'transient_lastDdlTime'='1535466140') ;
```





```sql
insert into dmbout partition(year=2010, month='08') select '2010-08', d.`merchant_no`, d.`member_id`, d.`account_name`, d.`detail_create_date`, d.`out_trade_no`, d.`account_balance`, d.`in_amount`, d.`out_amount`, d.`trade_desc`, d.`bill_date`, d.`ext_min`, d.`order_seq_no` from dmbout_orc d where d.`detail_create_date` like "2010-08%";
```



```sql
insert into dmbout partition(year=2019, month='11') select '2019-11', d.`merchant_no`, d.`member_id`, d.`account_name`, d.`detail_create_date`, d.`out_trade_no`, d.`account_balance`, d.`in_amount`, d.`out_amount`, d.`trade_desc`, d.`bill_date`, d.`ext_min`, d.`order_seq_no` from dmbout_orc d where d.`detail_create_date` like "2019-11%";
```





```scala
var df = spark.read.format("orc").load("hdfs://nn1:8020/benchmark/data/orc/dmbout/000*")

df.groupBy(substring(col("detail_create_date"), 0, 7)).count().show(6000)
```





```shell
#!/bin/bash

declare -a dts=("2019-10" "2018-10" "2017-09" "2019-11" "2017-10" "2016-02" "2017-05" "2018-06" "2019-03" "2015-05" "2017-11" "2018-03" "2015-12" "2017-03" "2018-02" "2016-12" "2016-09" "2017-08" "2016-03" "2019-07" "2017-06" "2016-10" "2014-01" "2017-02" "2017-04" "2018-05" "2015-02" "2015-08" "2014-03" "2018-08" "2014-08" "2017-07" "2014-02" "2015-10" "2019-05" "2019-08" "2015-11" "2014-09" "2016-05" "2019-01" "2019-09" "2014-05" "2015-01" "2016-04" "2017-12" "2018-11" "2016-11" "2019-06" "2014-11" "2019-04" "2018-12" "2016-01" "2016-07" "2015-07" "2016-06" "2014-04" "2014-10" "2015-09" "2019-12" "2014-12" "2014-06" "2014-07" "2018-04" "2018-01" "2015-04" "2015-06" "2019-02" "2016-08" "2017-01" "2018-09" "2018-07" "2015-03")

# year=${dt:0:4} month=${dt:5:2}
for dt in "${dts[@]}";
do
  year=${dt:0:4} 
  month=${dt:5:2}
  echo "partitioned by [Year = ${year}, Month = ${month} start to converting ..."
  hql="insert into dmbout partition(year=${year}, month='${month}') select '$dt', d.`merchant_no`, d.`member_id`, d.`account_name`, d.`detail_create_date`, d.`out_trade_no`, d.`account_balance`, d.`in_amount`, d.`out_amount`, d.`trade_desc`, d.`bill_date`, d.`ext_min`, d.`order_seq_no` from dmbout_orc d where d.`detail_create_date` like '$dt%';"
  
  #echo $hql
  
  hive -e "$hql"
done
```

