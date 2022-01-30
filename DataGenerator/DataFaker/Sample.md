



> 学生信息表 **(bys_xxdjb.txt)** 

```ini
xm||varchar(20)||毕业生姓名[:name]
sfzhm||varchar(20)||身份证号码[:ssn]
byyx||varchar(20)||毕业院校[:enum(file://unvi.txt)]
xl||varchar(20)||学历[:enum(本科, 硕士, 博士)]
bysj||varchar(64)||毕业时间[:year]
```



> **DDL**

```sql
CREATE TABLE `bys_xxdjb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `xm` varbinary(32) DEFAULT NULL COMMENT '毕业生姓名',
  `sfzhm` varbinary(32) DEFAULT NULL COMMENT '身份证号码',
  `byyx` varchar(64) DEFAULT NULL COMMENT '毕业院校',
  `xl` varbinary(8) DEFAULT NULL COMMENT '学历',
  `bysj` varbinary(32) DEFAULT NULL COMMENT '毕业时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='毕业生信息登记表'
```



> Write to MySQL

```shel
datafaker mysql mysql+pymysql://{root}:{password}@{127.0.0.1}:3600/{db_name}?charset=utf8 {table_name} 10 --outprint --meta bys_xxdjb.txt --outspliter ,,
```



> Write to file

```shell
datafaker file .\ test.txt 10  --meta bys_xxdjb.txt
```



```shell
https://jiemodui.com/N/130295.html
```



