## Environment Preparation

You need to prepare the environment for Apache Griffin measure module, including the following software:

- JDK (1.8+)
- Hadoop (2.6.0+)
- Spark (2.2.1+)
- Hive (2.2.0)

## Build Apache Griffin Measure Module

1. Create System User for Griffin

   ```shell
   useradd griffin -g hadoop -p griffin
   ```

   

2. 

3. 

4. 

5. 



1. Download Apache Griffin source package [here](https://www.apache.org/dist/griffin/0.4.0/).

2. Unzip the source package.

   ```shell
   unzip griffin-0.4.0-source-release.zip
   cd griffin-0.4.0-source-release
   ```

3. Build Apache Griffin jars.

   ```shell
   mvn clean install -e -DskipTests -T2
   ```

   ```ini
   [INFO] ------------------------------------------------------------------------
   [INFO] Reactor Summary for Apache Griffin 0.6.0 0.6.0:
   [INFO] 
   [INFO] Apache Griffin 0.6.0 ............................... SUCCESS [  0.866 s]
   [INFO] Apache Griffin :: UI :: Default UI ................. SUCCESS [ 31.271 s]
   [INFO] Apache Griffin :: Web Service ...................... SUCCESS [ 15.745 s]
   [INFO] Apache Griffin :: Measures ......................... SUCCESS [ 30.360 s]
   [INFO] ------------------------------------------------------------------------
   [INFO] BUILD SUCCESS
   [INFO] ------------------------------------------------------------------------
   [INFO] Total time:  01:18 min
   [INFO] Finished at: 2022-03-28T11:50:34+08:00
   [INFO] ------------------------------------------------------------------------
   ```
   
   
   
   Move the built apache griffin measure jar to your work path.
   
   ```
   mv measure/target/measure-0.6.0.jar <work path>/griffin-measure.jar
   ```
   
4. Create Griffin DB in MySQL

   ```sql
   CREATE DATABASE griffin_master
     DEFAULT CHARACTER SET utf8
     DEFAULT COLLATE utf8_general_ci;
   
   CREATE USER 'griffin_admin'@'localhost' IDENTIFIED BY 'Griffinuser_1473';
   
   GRANT ALL ON griffin_master.* TO 'griffin_admin'@'%' IDENTIFIED BY 'Griffinuser_1473';
   
   FLUSH PRIVILEGES;
   ```

   



## Data Preparation

For our quick start, We will generate two hive tables demo_src and demo_tgt.

```sql
--create hive tables here. hql script
--Note: replace hdfs location with your own path
CREATE EXTERNAL TABLE `demo_src`(
  `id` bigint,
  `age` int,
  `desc` string) 
PARTITIONED BY (
  `dt` string,
  `hour` string)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '|'
LOCATION
  'hdfs://data-link-51:8020/warehouse/tablespace/external/hive/qa_measure.db/demo_src';

--Note: replace hdfs location with your own path
CREATE EXTERNAL TABLE `demo_tgt`(
  `id` bigint,
  `age` int,
  `desc` string) 
PARTITIONED BY (
  `dt` string,
  `hour` string)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '|'
LOCATION
  'hdfs://data-link-51:8020/warehouse/tablespace/external/hive/qa_measure.db/demo_tgt';
```

The data could be generated this:

```ini
1|18|student
2|23|engineer
3|42|cook
...
```

For demo_src and demo_tgt, there could be some different items between each other. You can download [demo data](https://griffin.apache.org/data/batch) and execute `./gen_demo_data.sh` to get the two data source files. Then we will load data into both two tables for every hour.

```shell
LOAD DATA INPATH '/tmp/griffin_data/demo_src' INTO TABLE demo_src PARTITION (dt='20180912',hour='09');
LOAD DATA INPATH '/tmp/griffin_data/demo_tgt' INTO TABLE demo_tgt PARTITION (dt='20180912',hour='09');
```

Or you can just execute `./gen-hive-data.sh` in the downloaded directory above, to generate and load data into the tables hourly.

## Define data quality measure

#### Apache Griffin env configuration

The environment config file: env.json

```json
{
  "spark": {
    "log.level": "WARN"
  },
  "sinks": [
    {
      "type": "console"
    },
    {
      "type": "hdfs",
      "config": {
        "path": "hdfs:///griffin/persist"
      }
    },
    {
      "type": "elasticsearch",
      "config": {
        "method": "post",
        "api": "http://es:9200/griffin/accuracy"
      }
    }
  ]
}
```

#### Define griffin data quality

The DQ config file: dq.json

```json
{
  "name": "batch_accu",
  "process.type": "batch",
  "data.sources": [
    {
      "name": "src",
      "baseline": true,
      "connectors": [
        {
          "type": "hive",
          "version": "1.2",
          "config": {
            "database": "default",
            "table.name": "demo_src"
          }
        }
      ]
    }, {
      "name": "tgt",
      "connectors": [
        {

          "type": "hive",
          "version": "1.2",
          "config": {
            "database": "default",
            "table.name": "demo_tgt"
          }
        }
      ]
    }
  ],
  "evaluate.rule": {
    "rules": [
      {
        "dsl.type": "griffin-dsl",
        "dq.type": "accuracy",
        "out.dataframe.name": "accu",
        "rule": "src.id = tgt.id AND src.age = tgt.age AND src.desc = tgt.desc",
        "details": {
          "source": "src",
          "target": "tgt",
          "miss": "miss_count",
          "total": "total_count",
          "matched": "matched_count"
        },
        "out": [
          {
            "type": "metric",
            "name": "accu"
          },
          {
            "type": "record",
            "name": "missRecords"
          }
        ]
      }
    ]
  },
  "sinks": ["CONSOLE", "HDFS"]
}
```

## Measure data quality

Submit the measure job to Spark, with config file paths as parameters.

```shell
spark-submit --class org.apache.griffin.measure.Application --master yarn --deploy-mode client --queue default \
--driver-memory 1g --executor-memory 1g --num-executors 2 \
<path>/griffin-measure.jar \
<path>/env.json <path>/dq.json
```

## Report data quality metrics

Then you can get the calculation log in console, after the job finishes, you can get the result metrics printed. The metrics will also be saved in hdfs: `hdfs:///griffin/persist/<job name>/<timestamp>/_METRICS`.

## Refine Data Quality report

Depends on your business, you might need to refine your data quality measure further till your are satisfied.

## More Details

For more details about apache griffin measures, you can visit our documents in [github](https://github.com/apache/griffin/tree/master/griffin-doc).
