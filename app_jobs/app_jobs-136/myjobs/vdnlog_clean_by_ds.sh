#!/bin/sh

cd $HADOOP_HOME

ds=$(date +%Y-%m-%d -d -1day)

if [$# -ne 2]
  then 
    echo "Usage: addftpuser username password"; exit 1;

else 
  echo "your enter $1"

fi

