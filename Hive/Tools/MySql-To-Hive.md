

# Conversion of Mysql table structure to hive table structure (DDL is automatically generated)

Recently, I am working on importing mysql into the hive data warehouse. Due to the large number of business tables, writing hive DDL alone is too time-consuming, so I found the following method.

Prepare a dimension table: dim_ddl_convert, the table creation statement is as follows:

```sql
CREATE TABLE dim_ddl_convert (
  source VARCHAR (100) NOT NULL,
  data_type1 VARCHAR (100) NOT NULL,
  target VARCHAR (100) NOT NULL,
  data_type2 VARCHAR (100),
  update_time VARCHAR (26),
  PRIMARY KEY (source, data_type1, target)
) ENGINE = INNODB DEFAULT CHARSET = utf8mb4 COMMENT = 'Database table structure conversion';
```

The mapping relationship between imported data MYSQL data type and HIVE data type is as follows:

```sql
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'bigint', 'hive', 'BIGINT', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'bigint', 'odps', 'BIGINT', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'binary', 'hive', 'BINARY', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'binary', 'odps', 'BINARY', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'char', 'hive', 'STRING', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'char', 'odps', 'STRING', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'datetime', 'hive', 'STRING', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'datetime', 'odps', 'DATETIME', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'decimal', 'hive', 'DOUBLE', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'decimal', 'odps', 'DOUBLE', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'double', 'hive', 'DOUBLE', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'double', 'odps', 'DOUBLE', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'float', 'hive', 'DOUBLE', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'float', 'odps', 'DOUBLE', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'int', 'hive', 'INT', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'int', 'odps', 'BIGINT', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'json', 'hive', 'MAP<STRING,STRING>', '2019-07-31 00:00:00') ;
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'json', 'odps', 'MAP<STRING,STRING>', '2019-05-06 00:00:00') ;
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'mediumtext', 'hive', 'STRING', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'mediumtext', 'odps', 'STRING', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'smallint', 'hive', 'INT', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'smallint', 'odps', 'INT', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'text', 'hive', 'STRING', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'text', 'odps', 'STRING', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'time', 'hive', 'STRING', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'time', 'odps', 'STRING', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'timestamp', 'hive', 'STRING', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'timestamp', 'odps', 'DATETIME', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'tinyint', 'hive', 'INT', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'tinyint', 'odps', 'INT', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varbinary', 'hive', 'BINARY', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varbinary', 'odps', 'BINARY', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varchar', 'db2', 'varchar', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varchar', 'hive', 'STRING', '2019-07-31 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varchar', 'odps', 'STRING', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varchar', 'oracle', 'varchar', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varchar', 'sqlserver', 'varchar', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'varchar', 'sybase', 'varchar', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'enum', 'hive', 'string', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'longtext', 'hive', 'string', '2019-05-06 00:00:00');
INSERT INTO dim_ddl_convert (source, data_type1, target, data_type2, update_time) VALUES ('mysql', 'date', 'hive', 'string', '2019-05-06 00:00:00');
```

Open the SQL query tool and execute the following converted query statement:

```sql
SET SESSION group_concat_max_len = 102400;
SELECT
    a. TABLE_NAME ,
    b. TABLE_COMMENT,
    concat('DROP TABLE IF EXISTS ',a.TABLE_NAME,';CREATE EXTERNAL TABLE IF NOT EXISTS ',a.TABLE_NAME ,' (',group_concat(concat(a.COLUMN_NAME,' ',
    c.data_type2," COMMENT '",COLUMN_COMMENT,"'") order by a.TABLE_NAME,a.ORDINAL_POSITION) ,
    ") COMMENT '",b.TABLE_COMMENT ,"' ROW FORMAT DELIMITED FIELDS TERMINATED BY '\\t' STORED AS orc;") AS col_name
FROM
    (
        SELECT
            TABLE_SCHEMA,
            TABLE_NAME,
            COLUMN_NAME,
            ORDINAL_POSITION,
            DATA_TYPE,
            COLUMN_COMMENT
        FROM
            information_schema.COLUMNS
        WHERE
            TABLE_SCHEMA='your library name'
        ) AS a
LEFT JOIN
    information_schema. TABLES AS b
ON
    a.TABLE_NAME=b.TABLE_NAME
AND a.TABLE_SCHEMA=b.TABLE_SCHEMA
#Select the source as mysql and the target as hive
LEFT JOIN
    (
	    select
	    *
	    from dim_ddl_convert
	    where source='mysql' and target='hive'
    ) AS c
ON
    a.DATA_TYPE=c.data_type1
where b.TABLE_TYPE='BASE TABLE'
  and a.TABLE_NAME not like 'dim_%'
GROUP BY
    a. TABLE_NAME,
    b. TABLE_COMMENT
;
```



At this point, you can get the generated hive DDL statement, and other heterogeneous data sources are similar to the same operation.