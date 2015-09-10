#!/bin/sh

cd $HADOOP_HOME

ds=$(date +%Y-%m-%d -d -1day)

bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY/ds=2015-09-08
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY/ds=2015-09-08
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_GATHER/ds=2015-09-08
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_REPORT/ds=2015-09-08
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_LOGS/ds=2015-09-08
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/VDN_LOGS_FULLY/ds=2015-09-08
bin/hdfs dfs -rm -r /user/cloudland/vdnlogs/output/2015-09-08


bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_avlb_minutely_report/ds=2015-09-08
bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_fluent_minutel_report/ds=2015-09-08
bin/hdfs dfs -rm -r /apps/hive/warehouse/vdn_group_by_err/ds=2015-09-08

