#!/bin/bash
cd $HADOOP_HOME

for i in 1  
do
  job_stamp=$(date +%Y-%m-%d -d -${i}day)
  file_path=/user/cloudland/vdnlogs/input/${job_stamp}

  echo "file : $file_path"

    #bin/hdfs dfs -rm -r $file_path
    echo ${job_stamp}
    bin/hdfs dfs -mkdir -p "/user/cloudland/vdnlogs/input/${job_stamp}"
    bin/hdfs dfs -copyFromLocal /data/app_tmp/vdnlogs/input/${job_stamp} /user/cloudland/vdnlogs/input/

done
