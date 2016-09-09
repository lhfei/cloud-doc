-- =============================================
-- = CREATE TABLE
-- =============================================

use lhfei;

-- USER_ARTIST_DATA

CREATE TABLE `user_artist_data`(
  `userid` string,
  `artistid` string,
  `playcount` int)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'=' ', 
  'serialization.format'=' ') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://master1.cloud.cn:9000/user/hive/warehouse/lhfei.db/user_artist_data'
TBLPROPERTIES (
  'COLUMN_STATS_ACCURATE'='{\"BASIC_STATS\":\"true\"}', 
  'numFiles'='0', 
  'numRows'='0', 
  'rawDataSize'='0', 
  'totalSize'='0', 
  'transient_lastDdlTime'='1473168171')
;  
  

  
-- ARTIST_DATA
  
CREATE TABLE `artist_data`(
  `artistid` string,
  `artist_name` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'='\t', 
  'serialization.format'='\t') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://master1.cloud.cn:9000/user/hive/warehouse/lhfei.db/artist_data'
TBLPROPERTIES (
  'COLUMN_STATS_ACCURATE'='{\"BASIC_STATS\":\"true\"}', 
  'numFiles'='0', 
  'numRows'='0', 
  'rawDataSize'='0', 
  'totalSize'='0', 
  'transient_lastDdlTime'='1473168171')
;



-- ARTIST_ALIAS

CREATE TABLE `artist_alias`(
  `badid` string,
  `goodid` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe' 
WITH SERDEPROPERTIES ( 
  'field.delim'='\t', 
  'serialization.format'='\t') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://master1.cloud.cn:9000/user/hive/warehouse/lhfei.db/artist_alias'
TBLPROPERTIES (
  'COLUMN_STATS_ACCURATE'='{\"BASIC_STATS\":\"true\"}', 
  'numFiles'='0', 
  'numRows'='0', 
  'rawDataSize'='0', 
  'totalSize'='0', 
  'transient_lastDdlTime'='1473168171');

-- =============================================
-- = Load Data
-- =============================================
LOAD DATA INPATH 'hdfs://master1.cloud.cn:9000/spark-data/profiledata_06-May-2005/user_artist_data.txt' OVERWRITE INTO TABLE `lhfei.user_artist_data`;
LOAD DATA INPATH 'hdfs://master1.cloud.cn:9000/spark-data/profiledata_06-May-2005/artist_data.txt' OVERWRITE INTO TABLE `lhfei.artist_data`;
LOAD DATA INPATH 'hdfs://master1.cloud.cn:9000/spark-data/profiledata_06-May-2005/artist_alias.txt' OVERWRITE INTO TABLE `lhfei.artist_alias`;