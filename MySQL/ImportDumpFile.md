# Mysql数据导入导出



**简介：**

导出导入数据库
导出
mysqldump方法
mysqldump -u用户名 -p密码名 database [table]> 目标文件
导入

```sql
mysql -uroot -proot
use database
source 目标文件；
```

PS: 这种方法是导出整个表数据，并且带着建表信息，假如导入的数据库有同名的表，会被替换
PS: 可以添加条件

```shell
mysql -uroot -proot [-n] [-t] [-d] database [table]>name 
```

```ini
-t 不包含创建表的信息
-d不包含数据信息
--w or -w筛选条件
```

 

方法二
into outfile
load data infile



```
mysql -uroot -proot
mysql>use test
mysql>select * from student where studentno=10101 into outfile './stu';
导入
mysql -uroot -proot
mysql>use test
mysql>load data infile './stu' into table student;
```



```
导出xml
mysqldump --xml -uroot -proot [database] [table]> name.xml
[test]
mysqldump --xml -uroot -proot test>a.xml
mysqldump --xml -uroot -proot test dept>a.xml

mysql -X -uroot -proot -e "use test;select * from dept">a.xml[方法2]

导入xml文件内容到数据库
mysql> create table xmlt( 
-> id int , 
-> doc blob 
-> );

mysql> insert into xmlt values(1,load_file('/home/a.xml') );

mysql> select * from xmlt;
```