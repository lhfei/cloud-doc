### Build

```shell
git clone https://github.com/confluentinc/kafka-rest.git

# get the latest release version
git checkout -b v7.0.0 v7.0.0

# build from source
mvn clean package -e -DskipTests
```



```ini
[INFO] Building zip: /export/app_workspaces/kafka-rest/kafka-rest/target/kafka-rest-7.0.0-package.zip
[INFO] Building tar: /export/app_workspaces/kafka-rest/kafka-rest/target/kafka-rest-7.0.0-package.tar.gz
[INFO] Building jar: /export/app_workspaces/kafka-rest/kafka-rest/target/kafka-rest-7.0.0-standalone.jar
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for kafka-rest-parent 7.0.0:
[INFO] 
[INFO] kafka-rest-parent .................................. SUCCESS [  1.947 s]
[INFO] kafka-rest ......................................... SUCCESS [ 25.797 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  28.144 s
[INFO] Finished at: 2021-11-06T20:51:20+08:00
[INFO] ------------------------------------------------------------------------
```

