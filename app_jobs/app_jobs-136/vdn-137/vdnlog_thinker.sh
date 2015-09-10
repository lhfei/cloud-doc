#!/bin/bash

current=$(date +%Y-%m-%d -d -1day)
echo "${current}: jobs starting ... "

cd $HIVE_HOME

echo "loading data from hdfs to hive table ..."
hive -e "LOAD DATA INPATH 'hdfs://centos136.thinker.cn:8020/user/cloudland/vdnlogs/output/${current}/part-r-00000' INTO TABLE VDN_LOGS PARTITION (ds ='${current}');"

echo "insertting data to table VDN_LOGS_FULLY ..."
hive -e "INSERT INTO TABLE VDN_LOGS_FULLY PARTITION (ds = '${current}') SELECT V.ERR , V.IP , V.REF , V.SID , V.UID , V.LOC , V.CAT , V.TM , V.URL , V.DUR , V.BT , V.BL , V.LT , V.VID , V.PTYPE, V.CDNID , V.NETNAME , V.TR, P.ISP, P.COUNTRY, P.CITY FROM VDN_LOGS V, VDN_IP_REPO_CN P WHERE V.DS = '${current}' AND V.IP = P.IP;"

echo "loading data into table VDN_NODE_REPO ..."
hive -e "LOAD DATA LOCAL INPATH '/home/cloudland/app_data/IP_LIST.TXT' OVERWRITE INTO TABLE VDN_NODE_REPO;"

echo "insertting data to table VDN_LOGS_OTHER ..."
hive -e "INSERT INTO TABLE VDN_LOGS_OTHER PARTITION (ds = '${current}') SELECT V.ERR, V.IP, V.REF, V.SID, V.UID, V.LOC, V.TM, V.URL, V.DUR , V.BT , V.BL , V.LT , V.VID, V.PTYPE, V.CDNID, V.NETNAME, V.KEY FROM VDN_LOGS V WHERE V.LOC NOT IN (SELECT IP FROM VDN_NODE_REPO) AND V.DS = '${current}';"

echo "insertting data to table VDN_LOGS_IFENG ..."
hive -e "INSERT INTO TABLE VDN_LOGS_IFENG PARTITION (ds = '${current}') SELECT V.ERR, V.IP, V.REF, V.SID, V.UID, V.LOC, V.TM, V.URL, V.DUR , V.BT , V.BL , V.LT , V.VID, V.PTYPE, V.CDNID, V.NETNAME, V.KEY FROM VDN_LOGS V WHERE V.LOC IN (SELECT IP FROM VDN_NODE_REPO) AND V.DS = '${current}';"

echo "insertting data into table VDN_GROUP_BY_ERR ..."
hive -e "INSERT INTO TABLE VDN_GROUP_BY_ERR PARTITION (ds = '${current}') SELECT ERR, COUNT(ERR) AS TOTAL, ${current}, TR, '1' FROM VDN_LOGS WHERE DS = '${current}' GROUP BY ERR, TR ORDER BY TOTAL DESC;"
#hive -e "INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudland/app_tmp/group_by_err/${current}/' SELECT ERR, TOTAL, CT, ORIGIN FROM VDN_GROUP_BY_ERR WHERE DS = '${current}';"
#hive -e "INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudland/app_tmp/loc_bad/${current}/' SELECT v.CT, COUNT(*) FROM VDN_LOGS v WHERE v.DS = '${current}' AND v.LOC = '#' AND ERR='208000' GROUP BY v.CT, v.LOC  ORDER BY v.CT DESC;"

echo "insertting data into table VDN_AVLB_DAILY ..."
hive -e "INSERT INTO TABLE VDN_AVLB_DAILY PARTITION (ds = '${current}') SELECT v.ERR, COUNT(v.ERR) AS TOTAL, '${current}'  FROM VDN_LOGS v WHERE v.DS = '${current}' AND v.ERR IN ('208000', '303000', '301010', '301020', '301030', '304001', '304002', '304003', '304004', '601000', '602000', '100000', '110000', '301030_X') GROUP BY v.CT, v.ERR ;"


echo "insertting data into table VDN_AVLB_MINUTELY ..."
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY PARTITION (ds = '${current}') SELECT v.ERR, COUNT(v.ERR) AS TOTAL, '${current}', v.TR FROM VDN_LOGS v WHERE v.DS = '${current}' AND v.ERR IN ('208000', '303000', '301010', '301020', '301030', '304001', '304002', '304003', '304004', '601000', '602000', '100000', '110000', '301030_X') GROUP BY v.ERR, v.TR ;"

echo "insertting data into table VDN_AVLB_MINUTELY_FULLY ..."
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY_FULLY PARTITION (ds = '${current}') SELECT v.ERR, COUNT(v.ERR) AS TOTAL, v.ISP, v.COUNTRY, v.CITY, '${current}', v.TR, v.CAT FROM VDN_LOGS_FULLY v WHERE v.DS = '${current}' AND v.ERR IN ('208000', '303000', '301010', '301020', '301030', '304001', '304002', '304003', '304004', '601000', '602000', '100000', '110000', '301030_X') GROUP BY v.ERR, v.ISP, v.COUNTRY, v.CITY, v.TR, v.CAT ;"

echo "insertting data into table VDN_AVLB_MINUTELY_REPORT ..."
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY_REPORT PARTITION (ds = '${current}') SELECT DISTINCT N.TOTAL AS numerator, D.TOTAL AS denominator, N.CT, N.TR, N.TOTAL / D.TOTAL AS avlb FROM (SELECT a.* FROM VDN_AVLB_MINUTELY a WHERE a.ERR = '303000' AND a.ds = '${current}' ORDER BY a.CT DESC, a.TR ASC) N, (SELECT b.* FROM VDN_AVLB_MINUTELY b WHERE b.ERR = '208000' AND b.ds = '${current}' ORDER BY b.CT DESC, b.TR ASC) D WHERE N.CT = D.CT AND N.TR = D.TR ORDER BY N.CT DESC, N.TR ASC ;"

echo "insertting data into table VDN_FLUENT_MINUTEL_REPORT ..."
hive -e "INSERT INTO TABLE VDN_FLUENT_MINUTEL_REPORT PARTITION (ds = '${current}') select a.t0, b.t1, c.t2, d.t3, e.t4, a.tr, a.ct from (SELECT v0.ct, v0.TR, v0.TOTAL AS t0 FROM VDN_AVLB_MINUTELY v0 WHERE v0.DS = '${current}' AND v0.ERR = '303000' ORDER BY v0.TR ASC) a inner join (SELECT v1.TR, v1.TOTAL AS t1 FROM VDN_AVLB_MINUTELY v1 WHERE v1.DS = '${current}' AND v1.ERR = '304001' ORDER BY v1.TR ASC) b ON a.tr = b.tr inner join (SELECT v2.TR, v2.TOTAL AS t2 FROM VDN_AVLB_MINUTELY v2 WHERE v2.DS = '${current}' AND v2.ERR = '304002' ORDER BY v2.TR ASC) c on a.tr = c.tr inner join (SELECT v3.TR, v3.TOTAL AS t3 FROM VDN_AVLB_MINUTELY v3 WHERE v3.DS = '${current}' AND v3.ERR = '304003' ORDER BY v3.TR ASC) d on a.tr = d.tr inner join (SELECT v4.TR, v4.TOTAL AS t4 FROM VDN_AVLB_MINUTELY v4 WHERE v4.DS = '${current}' AND v4.ERR = '304004' ORDER BY v4.TR ASC) e ON a.tr = e.tr ;"

echo "export data to MySQL table VDN_AVLB_DAILY .... "
sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_AVLB_DAILY  \
    --export-dir hdfs://centos136.thinker.cn:8020/apps/hive/warehouse/vdn_avlb_daily/ds=${current} --validate \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"

	
echo "export data to MySQL table VDN_AVLB_MINUTELY .... "
sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_AVLB_MINUTELY  \
    --export-dir hdfs://centos136.thinker.cn:8020/user/cloudland/vdnlogs/VDN_AVLB_MINUTELY/ds=${current} --validate \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"
	

echo "export data to MySQL table VDN_AVLB_MINUTELY_REPORT .... "
sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_AVLB_MINUTELY_REPORT  \
    --export-dir hdfs://centos136.thinker.cn:8020//apps/hive/warehouse/vdn_avlb_minutely_report/ds=${current} --validate \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"


echo "export data to MySQL table VDN_AVLB_MINUTELY_REPORT .... "
sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_FLUENT_MINUTEL_REPORT  \
    --export-dir hdfs://centos136.thinker.cn:8020//apps/hive/warehouse/vdn_fluent_minutel_report/ds=${current} --validate \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"
	

echo "export data to MySQL table VDN_AVLB_MINUTELY_FULLY .... "
sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_AVLB_MINUTELY_FULLY  \
    --export-dir hdfs://centos136.thinker.cn:8020/user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY/ds=${current} --validate \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"	
