Zeppelin FAQs
============

<hr style="width: 800px" align="left" />
##### 

>#### Error in parse_all(input, filename, stop_on_error != 2L)


* ERROR LOG

    ```html
    Error in parse_all(input, filename, stop_on_error != 2L) : unused argument (stop_on_error != 2) 
    ```
* Answer

    ```
    install.packages(c("evaluate", "knitr"))
    ```



> JSON

- Error Log

  ```ini
  
  ```

- Resolved

  ```shell
  cd $ZEPPELIN_HOME/lib
  
  # check jackson libs
  ls ./ | grep ^jackson- 
  
  ## console output as below
  -----------------------------
  jackson-annotations-2.9.9.jar
  jackson-core-2.9.9.jar
  jackson-core-asl-1.9.13.jar
  jackson-databind-2.9.9.1.jar
  jackson-mapper-asl-1.9.13.jar
  jackson-module-jaxb-annotations-2.8.10.jar
  -----------------------------
  
  # make a backup directory as name 'backup'
  mkdir backup
  cp jackson-* backup/
  
  # remote jackons-* jars
  rm -rf `ls ./ | grep ^jackson-`
  
  # cp jackson-* jar from $SPARK_HOME/jars
  cp $SPARK_HOME/jars/jackson-annotations-2.9.9.jar $SPARK_HOME/jars/jackson-core-2.9.9.jar $SPARK_HOME/jars/jackson-core-asl-1.9.13.jar $SPARK_HOME/jars/jackson-databind-2.9.9.1.jar $SPARK_HOME/jars/jackson-mapper-asl-1.9.13.jar $SPARK_HOME/jars/jackson-module-jaxb-annotations-2.9.9.jar ./
  
  # check it
  ls ./ | grep ^jackson-
  -----------------------------
  jackson-annotations-2.9.9.jar
  jackson-core-2.9.9.jar
  jackson-core-asl-1.9.13.jar
  jackson-databind-2.9.9.1.jar
  jackson-mapper-asl-1.9.13.jar
  jackson-module-jaxb-annotations-2.9.9.jar
  -----------------------------
  ```

  