#!/bin/sh

cd $HADOOP_HOME

current=$(date +%Y-%m-%d -d -1day)

bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY/ds=$current
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY/ds=$current
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_GATHER/ds=$current
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_REPORT/ds=$current
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_LOGS/ds=$current
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_LOGS_FULLY/ds=$current
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/output/$current


bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_avlb_minutely_report/ds=$current
bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_fluent_minutel_report/ds=$current
bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_group_by_err/ds=$current