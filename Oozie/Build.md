> build.sh

```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="Oozie Build"
OUT_LOG="build.log"

function build() {
  ./bin/mkdistro.sh -e   \
  -DskipTests \
  -Dhadoop.version=3.1.0 \
  -Dsqoop.version=1.4.7  \
  -Dhive.version=3.1.1   \
  -Dhbase.version=2.1.4  \
  -Dtez.version=0.9.2    
}

function startJob() {
  echo "prepare to start ..."
  build > ${JOB_HOME}/${OUT_LOG} 2>&1 &
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

