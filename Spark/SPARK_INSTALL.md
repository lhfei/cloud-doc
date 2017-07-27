
![Spark](http://spark.apache.org/images/spark-logo-trademark.png "Spark") 
#[Apache Spark](http://spark.apache.org/)

  
``` 
```
Author    |    Email    |    Date     |    Since    |
----------|-------------|-------------|-------------|
Hefei Li  |lhfeilaile@gmail.com| Oct. 03, 2016      |     v1.0.0  |
```
```


## Building Apache Spark

#### Requirements

- **[Maven](http://maven.apache.org/ "Maven")**
- **[Scala](http://www.scala-lang.org/documentation/getting-started.html)**
- **[Zinc](https://github.com/typesafehub/zinc)**

#### Options
- **[SBT]()**

#### Prepare the Environment

- Starting Zinc Server

```
Zinc is a long-running server version of SBT’s incremental compiler. When run locally as a background process, it speeds up builds of Scala-based projects like Spark. Developers who regularly recompile Spark with Maven will be the most interested in Zinc. The project site gives instructions for building and running zinc; OS X users can install it using brew install zinc.
    
If using the build/mvn package zinc will automatically be downloaded and leveraged for all builds. This process will auto-start after the first time build/mvn is called and bind to port 3030 unless the ZINC_PORT environment variable is set. The zinc process can subsequently be shut down at any time by running build/zinc-<version>/bin/zinc -shutdown and will automatically restart whenever build/mvn is called.
    
```

- Build source

```
cd $SPARK_HOME
mvn clean -e
./build/zinc-<version>/bin/zinc -shutdown
    
./build/mvn -Pyarn -Phadoop-2.7 -Dhadoop.version=2.7.3 -Dscala-2.11 -DskipTests clean package -e
```

*---- output*

```sh
[INFO] Reactor Summary:
[INFO] 
[INFO] Spark Project Parent POM ........................... SUCCESS [  8.701 s]
[INFO] Spark Project Tags ................................. SUCCESS [ 25.142 s]
[INFO] Spark Project Sketch ............................... SUCCESS [  7.714 s]
[INFO] Spark Project Networking ........................... SUCCESS [ 14.256 s]
[INFO] Spark Project Shuffle Streaming Service ............ SUCCESS [  9.795 s]
[INFO] Spark Project Unsafe ............................... SUCCESS [ 11.207 s]
[INFO] Spark Project Launcher ............................. SUCCESS [ 11.362 s]
[INFO] Spark Project Core ................................. SUCCESS [03:29 min]
[INFO] Spark Project ML Local Library ..................... SUCCESS [ 12.243 s]
[INFO] Spark Project GraphX ............................... SUCCESS [ 23.705 s]
[INFO] Spark Project Streaming ............................ SUCCESS [ 45.562 s]
[INFO] Spark Project Catalyst ............................. SUCCESS [01:49 min]
[INFO] Spark Project SQL .................................. SUCCESS [02:15 min]
[INFO] Spark Project ML Library ........................... SUCCESS [01:39 min]
[INFO] Spark Project Tools ................................ SUCCESS [  2.027 s]
[INFO] Spark Project Hive ................................. SUCCESS [01:08 min]
[INFO] Spark Project REPL ................................. SUCCESS [  7.275 s]
[INFO] Spark Project YARN Shuffle Service ................. SUCCESS [  9.761 s]
[INFO] Spark Project YARN ................................. SUCCESS [ 14.541 s]
[INFO] Spark Project Assembly ............................. SUCCESS [ 13.055 s]
[INFO] Spark Project External Flume Sink .................. SUCCESS [  8.967 s]
[INFO] Spark Project External Flume ....................... SUCCESS [ 12.903 s]
[INFO] Spark Project External Flume Assembly .............. SUCCESS [  2.775 s]
[INFO] Spark Integration for Kafka 0.8 .................... SUCCESS [ 13.919 s]
[INFO] Spark Project Examples ............................. SUCCESS [ 25.629 s]
[INFO] Spark Project External Kafka Assembly .............. SUCCESS [  4.160 s]
[INFO] Spark Integration for Kafka 0.10 ................... SUCCESS [ 11.659 s]
[INFO] Spark Integration for Kafka 0.10 Assembly .......... SUCCESS [  4.437 s]
[INFO] Kafka 0.10 Source for Structured Streaming ......... SUCCESS [ 12.477 s]
[INFO] Spark Project Java 8 Tests ......................... SUCCESS [  8.494 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 15:46 min
[INFO] Finished at: 2017-06-26T20:46:04-07:00
[INFO] Final Memory: 81M/309M
[INFO] ------------------------------------------------------------------------
```

    *Specifying the profiles.*
    ```
    build/mvn -Pyarn -Phadoop-2.6.0 -Dhadoop.version=2.6.0 -DskipTests clean package
    
    
    export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"
    
    mvn -Dhadoop.version=2.6.0 -DskipTests clean package
    
    mvn -Pyarn -Phadoop-2.6 -Dhadoop.version=2.6.0 -Dyarn.version=2.6.0 -e -DskipTests clean package
    
    
    # Apache Hadoop 2.2.X
    ./build/mvn -Pyarn -Phadoop-2.2 -DskipTests clean package
    
    # Apache Hadoop 2.3.X
    ./build/mvn -Pyarn -Phadoop-2.3 -Dhadoop.version=2.3.0 -DskipTests clean package
    
    # Apache Hadoop 2.4.X or 2.5.X
    ./build/mvn -Pyarn -Phadoop-2.4 -Dhadoop.version=VERSION -DskipTests clean package
    
    # Apache Hadoop 2.6.X
    ./build/mvn -Pyarn -Phadoop-2.6 -Dhadoop.version=2.6.0 -DskipTests clean package
    
    # Apache Hadoop 2.7.X and later
    ./build/mvn -Pyarn -Phadoop-2.7 -Dhadoop.version=2.7.2 -Dscala-2.11 -DskipTests clean package -e
    
    # Different versions of HDFS and YARN.
    ./build/mvn -Pyarn -Phadoop-2.3 -Dhadoop.version=2.3.0 -Dyarn.version=2.2.0 -DskipTests clean package
    
    
    # Apache Hadoop 2.4.X with Hive 1.2.1 support
    ./build/mvn -Pyarn -Phadoop-2.7 -Dhadoop.version=2.7.2 -Phive -Phive-thriftserver -DskipTests clean package
    
    ```
    *Running test jobs*
    
    ```
    ./bin/spark-submit \
      --class org.apache.spark.examples.SparkPi \
      --master local[8] \
      ./examples/jars/spark-examples*.jar \
      100
      
    ./bin/spark-submit --class org.apache.spark.examples.SparkPi \
        --master yarn \
        --deploy-mode cluster \
        --driver-memory 4g \
        --executor-memory 2g \
        --executor-cores 1 \
        --queue default \
        examples/jars/spark-examples*.jar \
        10
    ```





















































































































































































































































