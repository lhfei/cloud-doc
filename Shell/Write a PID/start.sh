#!/bin/bash

JOB_HOME="."
SERV_NAME="spark2-server"
OUT_LOG="out.log"

function startJob() {
  echo "prepare to start ..."
  java -cp "../conf/:../lib/*" -jar ../lib/spark2-server-0.1.0-SNAPSHOT.jar > ${JOB_HOME}/${OUT_LOG} 2>&1 &
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