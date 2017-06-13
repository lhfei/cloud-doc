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

*special hive meta-data db driver, for example use MySQL driver:*
```sh
if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
  Sys.setenv(SPARK_HOME = "/home/spark")
}
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")), "/usr/share/java/mysql-connector-java.jar")
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
>sql("CREATE TABLE IF NOT EXISTS src (key INT, value STRING)")
>sql("LOAD DATA INPATH '/spark-data/kv1.txt' INTO TABLE src")

# Queries can be expressed in HiveQL.
>results <- sql("FROM src SELECT key, value")

# results is now a SparkDataFrame
> head(results)
  key   value
1 238 val_238
2  86  val_86
3 311 val_311
4  27  val_27
5 165 val_165
6 409 val_409
```

## 4.SparkDataFrame Operations

&emsp;SparkDataFrames support a number of functions to do structured data processing. Here we include some basic examples and a complete list can be found in the API docs:

#### Selecting rows, columns

```r
# Create the SparkDataFrame
df <- as.DataFrame(faithful)

# Get basic information about the SparkDataFrame
df
## SparkDataFrame[eruptions:double, waiting:double]

# Select only the "eruptions" column
head(select(df, df$eruptions))
 eruptions
1     3.600
2     1.800
3     3.333
4     2.283
5     4.533
6     2.883

# You can also pass in column name as strings
head(select(df, "eruptions"))

# Filter the SparkDataFrame to only retain rows with wait times shorter than 50 mins
head(filter(df, df$waiting < 50))
  eruptions waiting
1     3.600      79
2     1.800      54
3     3.333      74
4     2.283      62
5     4.533      85
6     2.883      55

```

#### Grouping, Aggregation
&emsp;SparkR data frames support a number of commonly used functions to aggregate data after grouping. For example we can compute a histogram of the waiting time in the faithful dataset as shown below

```r
# We use the `n` operator to count the number of times each waiting time appears
head(summarize(groupBy(df, df$waiting), count = n(df$waiting)))

[Stage 33:================================================>       (38 + 1) / 44]                                                                                  waiting count
1      70     4
2      67     1
3      69     2
4      88     6
5      49     5
6      64     4

# We can also sort the output from the aggregation to get the most common waiting times
waiting_counts <- summarize(groupBy(df, df$waiting), count = n(df$waiting))
head(arrange(waiting_counts, desc(waiting_counts$count)))

[Stage 37:===============>                                       (55 + 1) / 200][Stage 37:====================>                                  (74 + 1) / 200][Stage 37:=========================>                             (92 + 1) / 200][Stage 37:===============================>                      (117 + 2) / 200][Stage 37:====================================>                 (136 + 1) / 200][Stage 37:===========================================>          (160 + 1) / 200][Stage 37:==============================================>       (173 + 1) / 200][Stage 37:=================================================>    (185 + 1) / 200]                                                                                  waiting count
1      78    15
2      83    14
3      81    13
4      77    12
5      82    12
6      79    10

```


#### Operating on Columns

&emsp;SparkR also provides a number of functions that can directly applied to columns for data processing and during aggregation. The example below shows the use of basic arithmetic functions.

```r
# Convert waiting time from hours to seconds
# Note that we can assign this to a new column in the same SparkDataFrame
df$waiting_secs <- df$waiting * 60
head(df)

 eruptions waiting waiting_secs
1     3.600      79         4740
2     1.800      54         3240
3     3.333      74         4440
4     2.283      62         3720
5     4.533      85         5100
6     2.883      55         3300
```

>## Applying User-Defined Function

In SparkR, we support several kinds of User-Defined Functions:

#### Run a given function on a large dataset use dapply or dapplyCollect


##### dapply

&emsp;Apply a function to each partition of a SparkDataFrame. The function to be applied to each partition of the SparkDataFrame and should have only one parameter, to which a data.frame corresponds to each partition will be passed. The output of function should be a data.frame. Schema specifies the row format of the resulting a SparkDataFrame. It must match to data types of returned value.


```r

# Convert waiting time from hours to seconds.
# Note that we can apply UDF to DataFrame.
schema <- structType(structField("eruptions", "double"), structField("waiting", "double"),
                     structField("waiting_secs", "double"))
df1 <- dapply(df, function(x) { x <- cbind(x, x$waiting * 60) }, schema)
head(collect(df1))
  eruptions waiting waiting_secs
1     3.600      79         4740
2     1.800      54         3240
3     3.333      74         4440
4     2.283      62         3720
5     4.533      85         5100
6     2.883      55         3300

```

##### dapplyCollect

&emsp;Like dapply, apply a function to each partition of a SparkDataFrame and collect the result back. The output of function should be a data.frame. But, Schema is not required to be passed. Note that dapplyCollect can fail if the output of UDF run on all the partition cannot be pulled to the driver and fit in driver memory.

```

# Convert waiting time from hours to seconds.
# Note that we can apply UDF to DataFrame and return a R's data.frame
ldf <- dapplyCollect(
         df,
         function(x) {
           x <- cbind(x, "waiting_secs" = x$waiting * 60)
         })
#head(ldf, 3)
head(ldf)

  eruptions waiting waiting_secs
1     3.600      79         4740
2     1.800      54         3240
3     3.333      74         4440
4     2.283      62         3720
5     4.533      85         5100
6     2.883      55         3300

```

**Data type mapping between R and Spark**

R		    |Spark
------------|------------
byte		| byte
integer		| integer
float		| float
double		| double
numeric		| double
character	| string
string		| string
binary		| binary
raw		    | binary
logical		| boolean
POSIXct		| timestamp
POSIXlt		| timestamp
Date		| date
array		| array
list		| array
env		    | map


##### Run local R functions distributed using spark.lapply

**spark.lapply**

Similar to lapply in native R, spark.lapply runs a function over a list of elements and distributes the computations with Spark. Applies a function in a manner that is similar to doParallel or lapply to elements of a list. The results of all the computations should fit in a single machine. If that is not the case they can do something like df <- createDataFrame(list) and then use dapply


```r
# Perform distributed training of multiple models with spark.lapply. Here, we pass
# a read-only list of arguments which specifies family the generalized linear model should be.
families <- c("gaussian", "poisson")
train <- function(family) {
  model <- glm(Sepal.Length ~ Sepal.Width + Species, iris, family = family)
  summary(model)
}
# Return a list of model's summaries
model.summaries <- spark.lapply(families, train)

# Print the summary of each model
print(model.summaries)

--------------------------------------------------------------------
[[1]]

Call:
glm(formula = Sepal.Length ~ Sepal.Width + Species, family = family, 
    data = iris)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-1.30711  -0.25713  -0.05325   0.19542   1.41253  

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)         2.2514     0.3698   6.089 9.57e-09 ***
Sepal.Width         0.8036     0.1063   7.557 4.19e-12 ***
Speciesversicolor   1.4587     0.1121  13.012  < 2e-16 ***
Speciesvirginica    1.9468     0.1000  19.465  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for gaussian family taken to be 0.1918059)

    Null deviance: 102.168  on 149  degrees of freedom
Residual deviance:  28.004  on 146  degrees of freedom
AIC: 183.94

Number of Fisher Scoring iterations: 2


[[2]]

Call:
glm(formula = Sepal.Length ~ Sepal.Width + Species, family = family, 
    data = iris)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-0.52652  -0.10966  -0.01230   0.07755   0.56101  

Coefficients:
                  Estimate Std. Error z value Pr(>|z|)    
(Intercept)        1.13033    0.35454   3.188 0.001432 ** 
Sepal.Width        0.13971    0.10119   1.381 0.167361    
Speciesversicolor  0.26277    0.10901   2.410 0.015931 *  
Speciesvirginica   0.33842    0.09587   3.530 0.000416 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for poisson family taken to be 1)

    Null deviance: 17.3620  on 149  degrees of freedom
Residual deviance:  4.5202  on 146  degrees of freedom
AIC: Inf

Number of Fisher Scoring iterations: 3

```


#### Running SQL Queries from SparkR

A SparkDataFrame can also be registered as a temporary view in Spark SQL and that allows you to run SQL queries over its data. The sql function enables applications to run SQL queries programmatically and returns the result as a SparkDataFrame.

```r

# Load a JSON file
people <- read.df("/spark-data/src/main/resources/people.json", "json")

# Register this SparkDataFrame as a temporary view.
createOrReplaceTempView(people, "people")

# SQL statements can be run by using the sql method
teenagers <- sql("SELECT name FROM people WHERE age >= 13 AND age <= 19")
head(teenagers)

   name
1 Justin
```