#!/bin/bash

JOB_HOME="."
SERV_NAME="Overlord-server"
OUT_LOG="logs/overlord.log"
RUN_PID="run/overlord"

function startJob() {
  echo "prepare to start ..."
  java `cat conf/druid/overlord/jvm.config | xargs` -cp conf/druid/_common:conf/druid/overlord:lib/* org.apache.druid.cli.Main server overlord > ${JOB_HOME}/${OUT_LOG} 2>&1 &
  PID=$!
  echo $PID > ${JOB_HOME}/${RUN_PID}
  echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/${RUN_PID}" ]
then
  PID=`cat ${JOB_HOME}/${RUN_PID}`
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