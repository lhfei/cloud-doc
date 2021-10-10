

表或者字段有中文的时候需要修改hive的元数据库的设置。
以mysql为例子，当mysql的字符集设置成utf8的时候使用hive会有问题，详细见hive的wiki。

所以当hive使用mysql作为元数据库的时候mysql的字符集要设置成latin1。
为了保存那些utf8的中文，要将mysql中存储注释的那几个字段的字符集单独修改为utf8。

  修改字段注释字符集

```javascript
alter table COLUMNS modify column COMMENT varchar(256) character set utf8;
 
```

修改表注释字符集

```javascript
alter table TABL_PARAMS modify column PARAM_VALUE varchar(4000) character set utf8;
 
```

最后别忘记修改hive的jdbc连接，将字符集修改为utf8，如

```javascript
javax.jdo.option.ConnectionURL
jdbc:mysql://192.168.0.128:3306/hive?characterEncoding=UTF-8
```

```sql
ALTER TABLE COLUMNS_V2 MODIFY COLUMN COMMENT VARCHAR(256) CHARACTER SET UTF8; 
ALTER TABLE TABLE_PARAMS MODIFY COLUMN PARAM_VALUE VARCHAR(4000) CHARACTER SET UTF8;
ALTER TABLE PARTITION_KEYS MODIFY COLUMN PKEY_COMMENT VARCHAR(4000) CHARACTER SET UTF8;
```





After setting the character set, the print-out is correct.

```sql
ALTER TABLE test_table SET SERDEPROPERTIES ('serialization.encoding'='GBK');
```

