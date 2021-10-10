

https://blog.csdn.net/cy19871228cy/article/details/115208967

https://blog.csdn.net/hjl18309163914/article/details/107844269

### Sample Data

```ini
uuid,name,addr,phone,update_date,bir_date
1,逝去的青春,上海市宝山区,183****1111,20200805,20020101
2,葬爱,上海市虹口区,183****2222,20200805,  
3,罙罙の回憶,上海市虹口区,                  ****3333,20200805,20020101
5,李彦龙,上海市松江区,183***55,20200801,20010101
6,李浩鹏,上海市松江区,183****6666,20200801,20010101
7,李天一,上海市松江区,183****7777,20200801,20010101
8,李朵雯,上海市松江区,183****8888,20200801,20010101
9,李雨杭,上海市松江区,183****9999,20200801,20010101
10,王满,杭州市西湖区,153****0000,20200802,20000101
11,王琳,杭州市西湖区,153****1111,20200802,20000101
12,王昕,杭州市西湖区,153****2222,20200802,20000101
13,贾一一,杭州市西湖区,153****3333,20200802,20000101
14,石浩,西安市莲湖区,137****4444,20200803,19970101
15,石子彤,西安市莲湖区,137****5555,20200803,19970101
16,许放炮的,西安市莲湖区,137****6666,20200803,19970101
```

​           

###      Hive Tables 



```sql
CREATE DATABASE `hudi`;                                                                    
```



```sql
CREATE TABLE `hudi`.`user_info`(
  `uuid` string, 
  `name` string, 
  `addr` string, 
  `phone` string, 
  `update_date` string, 
  `bir_date` string
) stored AS parquet;
```



Load Data

```shell
LOAD DATA INPATH 'hdfs://data-thinker-6:8020/hudi/demo/user_info.txt' OVERWRITE INTO TABLE `hudi`.`user_info`; 
```



```scala
case class UserInfo(uuid: String, name: String, addr: String, phone: String, update_date: String, bir_date: String)
val sparkSession: SparkSession = SparkSession.builder()
    .config("spark.serializer", "org.apache.spark.serializer.KryoSerializer")
    .appName("Hudi Test")
    .master("local[*]")
    .enableHiveSupport()
    .getOrCreate()

@Test
def write2hive(): Unit = {
    import sparkSession.implicits._
    val userInfoDF: DataFrame = sparkSession.sparkContext.textFile("src/main/resources/hive_test/user_info.txt")
      .filter(_.nonEmpty)
      .map(line => {
        val arr: Array[String] = line.split(",")
        UserInfo(arr(0), arr(1), arr(2), arr(3), arr(4), arr(5))
      }).toDF()
    userInfoDF.coalesce(1).createOrReplaceTempView("tmp")
    sparkSession.sql("insert into table hudi.user_info_demo select * from tmp")
}
```





```shell

```

