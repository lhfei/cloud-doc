

```sql
CREATE TABLE `hbase_lineitem`(
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
  
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' 
WITH SERDEPROPERTIES( 
  "hbase.columns.mapping" = ":key, cf:l_partkey, cf:l_suppkey, cf:l_linenumber, cf:l_quantity, cf:l_extendedprice, cf:l_discount, cf:l_tax, cf:l_returnflag, cf:l_linestatus, cf:l_shipdate, cf:l_commitdate, cf:l_receiptdate, cf:l_shipinstruct, cf:l_shipmode, cf:l_comment"
)
TBLPROPERTIES("hbase.table.name" = "hbase_lineitem");
```



```sql
hive>SET hive.hbase.bulk=true;

hive>SET mapred.reduce.tasks=20;

hive>SET mapreduce.job.reduces=20;

INSERT OVERWRITE TABLE hbase_lineitem SELECT * FROM benchmark.lineitem;
```

