



```ini
pip install setuptools-scm
pip install PyMySQL
```



#### KB Storage

> kb_config.py

```python
SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://idatauser:IDatauser_1473@dlink-app-08/gpt_idata"
```





WebUI

> /etc/sysctl.conf

```ini
fs.inotify.max_user_watches=99999999
```



```shell
streamlit run webui.py --server.fileWatcherType none
```





> start

```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="GPT API"
OUT_LOG="api.log"
F_PID="pid"


function startJob() {
    echo "prepare to start ..."
    python startup.py --all-api > ${JOB_HOME}/${OUT_LOG} 2>&1 &
    PID=$!
    echo $PID > ${JOB_HOME}/${F_PID}
    echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/${F_PID}" ]
then
    PID=`cat ${JOB_HOME}/${F_PID}`
    if ps -p $PID > /dev/null
    then
        echo "${SERV_NAME} is running as pid is $PID, stop it first"
        exit 1
    else
        startJob
        exit 0
    fi
else
    startJob
    exit 0
fi
```

