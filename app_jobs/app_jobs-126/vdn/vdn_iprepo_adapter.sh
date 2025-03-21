# -- CREATE TABLE IFENG IP REPOSITORY.

hive -e "CREATE EXTERNAL TABLE VDN_IP_REPO(IP STRING, COUNTRY STRING, CITY STRING, ISP STRING) PARTITIONED BY (DS STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LOCATION 'hdfs://centos124.thinker.cn:8020/user/cloudland/vdn/ALL'; "
echo "table VDN_IP_REPO created ."

hive -e "CREATE EXTERNAL TABLE VDN_IP_REPO_CN(IP STRING, COUNTRY STRING, CITY STRING, ISP STRING) PARTITIONED BY (DS STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LOCATION 'hdfs://centos124.thinker.cn:8020/user/cloudland/vdn/CN'; "
echo "table VDN_IP_REPO_CN created ."

hive -e "CREATE EXTERNAL TABLE VDN_IP_REPO_US(IP STRING, COUNTRY STRING, CITY STRING, ISP STRING) PARTITIONED BY (DS STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LOCATION 'hdfs://centos124.thinker.cn:8020/user/cloudland/vdn/US'; "
echo "table VDN_IP_REPO_US created ."

hive -e "CREATE EXTERNAL TABLE VDN_IP_REPO_CAN(IP STRING, COUNTRY STRING, CITY STRING, ISP STRING) PARTITIONED BY (DS STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LOCATION 'hdfs://centos124.thinker.cn:8020/user/cloudland/vdn/CAN'; "
echo "table VDN_IP_REPO_CAN created ."


-- LOAD DATA INTO TABLE VDN_IP_REPO
#LOAD DATA INPATH 'hdfs://centos124.thinker.cn:8020/user/cloudland/iparea/output/part-r-00000' INTO TABLE VDN_IP_REPO PARTITION (ds ='2015-07-28');
hive -e "LOAD DATA INPATH 'hdfs://centos124.thinker.cn:8020//user/cloudland/vdn/CN/ds=2015-07-28/part-r-00000' INTO TABLE VDN_IP_REPO_CN PARTITION (ds ='2015-07-28');"
hive -e "LOAD DATA INPATH 'hdfs://centos124.thinker.cn:8020/user/cloudland/vdn/US/ds=2015-07-28/part-r-00000' INTO TABLE VDN_IP_REPO_US PARTITION (ds ='2015-07-28');"
hive -e "LOAD DATA INPATH 'hdfs://centos124.thinker.cn:8020/user/cloudland/vdn/CAN/ds=2015-07-28/part-r-00000' INTO TABLE VDN_IP_REPO_CAN PARTITION (ds ='2015-07-28');"


