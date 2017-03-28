SparkR
======


```
```


># Start SparkR Session

```r
if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
  Sys.setenv(SPARK_HOME = "${SPARK_INSTALL_PATH}")
}
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sparkR.session(master = "local[*]", sparkConfig = list(spark.driver.memory = "2g"))
```

*The following Spark driver properties can be set in sparkConfig with sparkR.session from RStudio:*

Property Name			        |Property group			    |spark-submit equivalent
--------------------------------|---------------------------|-------------------------
spark.master			        |Application Properties		|--master
spark.yarn.keytab		        |Application Properties		|--keytab
spark.yarn.principal		    |Application Properties		|--principal
spark.driver.memory		        |Application Properties		|--driver-memory
spark.driver.extraClassPath	    |Runtime Environment		|--driver-class-path
spark.driver.extraJavaOptions	|Runtime Environment		|--driver-java-options
spark.driver.extraLibraryPath	|Runtime Environment		|--driver-library-path

># Creating SparkDataFrames

## 1.From local data frames

```r
>df <- as.DataFrame(faithful)

>head(df)

  eruptions waiting
1     3.600      79
2     1.800      54
3     3.333      74
4     2.283      62
5     4.533      85
6     2.883      55

```

## 2.From Data Sources

```r
>people <- read.df("/spark-data/src/main/resources/people.json", "json")

>head(people)
  age    name
1  NA Michael
2  30    Andy
3  19  Justin

# SparkR automatically infers the schema from the JSON file
> printSchema(people)
root
 |-- age: long (nullable = true)
 |-- name: string (nullable = true)

# Similarly, multiple files can be read with read.json
```

## 3.From Hive tables

```r

```