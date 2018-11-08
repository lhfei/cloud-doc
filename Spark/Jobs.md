#[Spark Jobs](https://github.com/lhfei/spark-in-action.git)

``` 

```
Author    |    Email    |    Date     |    Since    |
----------|-------------|-------------|-------------|
Hefei Li  |lhfeilaile@gmail.com| Oct. 03, 2016      |     v1.0.0  |
```

```

## Jobs

- JavaWordCount

    - [x] LOCAL

    ```shell
    ./bin/spark-submit \
    --class org.apache.spark.examples.JavaWordCount \
    --master local[2] \
    /home/lhfei/spark_jobs/spark-2.x-1.0.0.jar \
    /spark-data/data.txt
    ```



> Java Job

- [x] YARN

~~~shell
./bin/spark-submit  --class "org.apache.spark.examples.JavaWordCount" \
    --master yarn \
    --deploy-mode cluster \
    --num-executors 80 \
    --executor-memory 8g \
    --executor-cores 8 \
    examples/jars/spark-examples_2.11-2.3.1.3.0.0.0-1634.jar \
    /user/druid/benchmark/data/lineitem.tbl.92.gz
~~~



> Python Job

```shell
./bin/spark-submit \
    --master yarn \
    --deploy-mode cluster \
    --num-executors 80 \
    --executor-memory 8g \
    --executor-cores 8 \
    examples/src/main/python/wordcount.py /export/app_workspaces/spark-benchmark/uber-data/uber-raw-data-apr14.csv
```



- Dataset & Dataframe 
    ```shell
    ./bin/spark-submit \
    --class cn.lhfei.spark.df.DataframeApp \
    --master local[1] \
    /home/lhfei/spark_jobs/spark-2.x-1.0.0.jar
    ```

- Spark
    ```shell
    ./bin/spark-submit --class org.apache.spark.examples.sql.SparkSQLExample --master local[1] /home/lhfei/spark_jobs/spark-2.x-1.0.0.jar
    ```



```shell
./bin/spark-submit --class cn.lhfei.spark.df.DataframePlay --master local[1] /home/lhfei/spark_jobs/spark-2.x-1.0.0.jar

./bin/spark-submit --class cn.lhfei.spark.streaming.VLongApp --master local[1] /home/lhfei/spark_jobs/spark-2.x-1.0.0.jar

./bin/spark-submit --class cn.lhfei.spark.df.streaming.VLogDriver --master local[1] /home/lhfei/spark_jobs/spark-2.x-1.0.0.jar
    
./bin/spark-submit --class org.apache.spark.examples.streaming.HdfsWordCount --master local[1] /home/lhfei/spark_jobs/spark-2.x-1.0.0.jar /spark-data/data.txt

./bin/spark-submit --class org.apache.spark.examples.ml.LinearRegressionExample  --master local[1] --jars /home/lhfei/spark_jobs/*.jar  --regParam 0.15 --elasticNetParam 1.0 /spark-data/mllib/sample_linear_regression_data.txt 
```


```scala
val rdd: RDD[Array[String]] = ???
    val rows: RDD[Row] = rdd map {
      case Array(callId, oCallId, callTime, duration, swId) =>
        Row(callId.toLong, oCallId.toLong, callTime, duration.toLong, swId.toLong)
    }

    object schema {
      val callId = StructField("callId", LongType)
      val oCallId = StructField("oCallId", StringType)
      val callTime = StructField("callTime", StringType)
      val duration = StructField("duration", LongType)
      val swId = StructField("swId", LongType)

      val struct = StructType(Array(callId, oCallId, callTime, duration, swId))
    }

    sqlContext.createDataFrame(rows, schema.struct)
```