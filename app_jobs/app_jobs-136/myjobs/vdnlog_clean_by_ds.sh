#!/bin/sh

HADOOP_HOME=/usr/hdp/2.2.4.2-2/hadoop

current=$(date +%Y-%m-%d -d -16day)

$HADOOP_HOME/bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_GATHER/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_REPORT/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_LOGS/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_LOGS_FULLY/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/output/$current

$HADOOP_HOME/bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_avlb_minutely_report/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_fluent_minutel_report/ds=$current
$HADOOP_HOME/bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_group_by_err/ds=$current

rm -rf /data/app_tmp/vdnlogs/input/$current/