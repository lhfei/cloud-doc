
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
    
    ./build/mvn -Pyarn -Phadoop-2.7 -Dhadoop.version=2.7.2 -Dscala-2.11 -DskipTests clean package -e
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





















































































































































































































































