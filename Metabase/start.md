

```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="Metabase Server"
OUT_LOG="metabase.log"

export MB_JETTY_PORT=3001
export MB_DB_TYPE=mysql
export MB_DB_DBNAME=cloud_metabase
export MB_DB_PORT=3306
export MB_DB_USER=cloud_metabase
export MB_DB_PASS=Metabaseuser_1473
export MB_DB_HOST=10.182.99.90
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

