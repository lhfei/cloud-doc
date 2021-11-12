

### Create DB

```sql
CREATE DATABASE cloud_metabase
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_metabase'@'localhost' IDENTIFIED BY 'Metabaseuser_1473';

GRANT ALL ON cloud_metabase.* TO 'cloud_metabase'@'%' IDENTIFIED BY 'Metabaseuser_1473';

FLUSH PRIVILEGES;
```



```sql
CREATE DATABASE databank
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'databank'@'localhost' IDENTIFIED BY 'Databankuser_1473';

GRANT ALL ON databank.* TO 'databank'@'%' IDENTIFIED BY 'Databankuser_1473';

FLUSH PRIVILEGES;
```





```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="Metabase Server"
OUT_LOG="metabase.log"

export MB_JETTY_PORT=12000
export MB_DB_TYPE=mysql
export MB_DB_DBNAME=cloud_metabase
export MB_DB_PORT=3306
export MB_DB_USER=cloud_metabase
export MB_DB_PASS=Metabaseuser_1473
export MB_DB_HOST=10.0.0.5
#export MB_PLUGINS_DIR=./plugins

function startJob() {
    echo "prepare to start ..."
    java -jar target/uberjar/metabase.jar > ${JOB_HOME}/${OUT_LOG} 2>&1 &
    PID=$!
    echo $PID > ${JOB_HOME}/pid
    echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/pid" ]
then
    PID=`cat ${JOB_HOME}/pid`
    if ps -p $PID > /dev/null
    then
        echo "${SERV_NAME} is running as pid is $PID, stop it first"
        exit 1
    else
        startJob
        exit 1
    fi
else
    startJob
    exit 1
fi
```

