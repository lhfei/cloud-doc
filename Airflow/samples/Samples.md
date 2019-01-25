### Host

```ini
10.182.74.62 
```



> tutorial



```sh
airflow backfill tutorial -s 2018-12-01 -e 2019-01-10
```





```sh
 airflow run example_bash_operator runme_0 2019-01-10
```





### DDL

> create_tables.hql

```sql
USE airflow;

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
   'hdfs://host-10-182-60-239:8020//benchmark/airflow/lineitem' 
 TBLPROPERTIES (                                    
   'bucketing_version'='2',                         
   'transient_lastDdlTime'='1535466140') ;
```



### Load Data

> put_data.sh

```sh
su - hdfs -c "hdfs dfs -cp /benchmark/lineitem/lineitem.tbl.1.gz /benchmark/airflow/lineitem/"
```



### Query

> sum_all.hql

```sql
use airflow;

SELECT SUM(L_EXTENDEDPRICE),SUM(L_DISCOUNT),SUM(L_TAX),SUM(L_QUANTITY) FROM LINEITEM;
```