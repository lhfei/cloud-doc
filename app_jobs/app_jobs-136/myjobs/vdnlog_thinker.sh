#!/bin/bash

current=$(date +%Y-%m-%d -d -1day)
echo "${current}: jobs starting ... "

cd $HADOOP_HOME

echo "start copying file from local to hdfs ..."
bin/hdfs dfs -copyFromLocal  /data/app_tmp/vdnlogs/input/${current} /user/cloudland/vdnlogs/input/

echo "starting parser file ..."
bin/hadoop jar /home/cloudland/app_jobs/myjobs/log-parser.jar com.ifeng.vdn.parser.VideoLogParseDriver -libjars /home/cloudland/app_jobs/myjobs/log-parser.jar /user/cloudland/vdnlogs/input/${current}/*.gz /user/cloudland/vdnlogs/output/${current}/

#rm -rf /user/cloudland/vdnlogs/input/*


echo 'call hive script on centos137 .....'
ssh cloudland@centos137 '/home/cloudland/app_jobs/vdn/vdnlog_thinker.sh'
