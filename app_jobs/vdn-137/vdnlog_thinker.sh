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
hive -e "INSERT INTO TABLE VDN_AVLB_DAILY PARTITION (ds = '${current}') SELECT v.ERR, COUNT(v.ERR) AS TOTAL, '${current}'  FROM VDN_LOGS v WHERE v.DS = '${current}' AND v.ERR IN ('208000', '303000', '301010', '301020', '301030', '301040' '304001', '304002', '304003', '304004', '601000', '602000', '100000', '110000', '301030_X') GROUP BY v.CT, v.ERR ;"


echo "insertting data into table VDN_AVLB_MINUTELY ..."
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY PARTITION (ds = '${current}') SELECT v.ERR, COUNT(v.ERR) AS TOTAL, '${current}', v.TR FROM VDN_LOGS v WHERE v.DS = '${current}' AND v.ERR IN ('208000', '303000', '301010', '301020', '301030', '301040' '304001', '304002', '304003', '304004', '601000', '602000', '100000', '110000', '301030_X') GROUP BY v.ERR, v.TR ;"

echo "insertting data into table VDN_AVLB_MINUTELY_FULLY ..."
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY_FULLY PARTITION (ds = '${current}') SELECT v.ERR, COUNT(v.ERR) AS TOTAL, v.ISP, v.COUNTRY, v.CITY, '${current}', v.TR, v.CAT FROM VDN_LOGS_FULLY v WHERE v.DS = '${current}' AND v.ERR IN ('208000', '303000', '301010', '301020', '301030', '301040' '304001', '304002', '304003', '304004', '601000', '602000', '100000', '110000', '301030_X') GROUP BY v.ERR, v.ISP, v.COUNTRY, v.CITY, v.TR, v.CAT ;"

echo "INSERTING INTO TABLE VDN_AVLB_MINUTELY_FULLY_REPORT ..."
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY_FULLY_REPORT PARTITION (ds = '${current}') SELECT a.isp, a.ct, a.tr, a.cat, a.total AS a, b.total AS b, c.total AS c, c2.total AS c2, c3.total AS c3, c4.total AS c4, d.total AS d, d2.total AS d2, d3.total AS d3, e.total AS e, f.total AS f, f2.total AS f2, g.total AS g, g2.total AS g2 FROM (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '208000' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) a LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '303000' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) b ON a.ct = b.ct AND a.tr = b.tr AND a.isp = b.isp AND a.cat = b.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '304001' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) c ON a.ct = c.ct AND a.tr = c.tr AND a.isp = c.isp AND a.cat = c.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '304002' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) c2 ON a.ct = c2.ct AND a.tr = c2.tr AND a.isp = c2.isp AND a.cat = c2.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '304003' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) c3 ON a.ct = c3.ct AND a.tr = c3.tr AND a.isp = c3.isp AND a.cat = c3.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '304004' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) c4 ON a.ct = c4.ct AND a.tr = c4.tr AND a.isp = c4.isp AND a.cat = c4.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '301010' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) d ON a.ct = d.ct AND a.tr = d.tr AND a.isp = d.isp AND a.cat = d.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '301020' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) d2 ON a.ct = d2.ct AND a.tr = d2.tr AND a.isp = d2.isp AND a.cat = d2.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '301040' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) d3 ON a.ct = d3.ct AND a.tr = d3.tr AND a.isp = d3.isp AND a.cat = d3.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '301030_X' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) e ON a.ct = e.ct AND a.tr = e.tr AND a.isp = e.isp AND a.cat = e.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '100000' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) f ON a.ct = f.ct AND a.tr = f.tr AND a.isp = f.isp AND a.cat = f.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '11000' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) f2 ON a.ct = f2.ct AND a.tr = f2.tr AND a.isp = f2.isp AND a.cat = f2.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '601000' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) g ON a.ct = g.ct AND a.tr = g.tr AND a.isp = g.isp AND a.cat = g.cat LEFT JOIN (SELECT v.ERR, v.ISP, v.CT, v.TR, v.CAT, SUM(v.TOTAL) AS total FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.ERR = '602000' AND v.CT = '${current}' GROUP BY v.ERR, v.ISP, v.CT, v.TR, v.CAT ORDER BY v.CT DESC, v.TR ASC) g2 ON a.ct = g2.ct AND a.tr = g2.tr AND a.isp = g2.isp AND a.cat = g2.cat ;"

echo "INSERTING INTO TABLE VDN_AVLB_MINUTELY_FULLY_GATHER ..."
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY_FULLY_GATHER PARTITION (ds = '${current}') SELECT v.ERR, v.TOTAL, v.ISP, v.COUNTRY, v.CT, v.TR, v.CAT FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.DS='$current' AND v.ISP IN ('电信', '移动', '联通') AND v.ERR IN ('208000', '303000') ORDER BY v.CT ASC, v.TR ASC;" 
hive -e "INSERT INTO TABLE VDN_AVLB_MINUTELY_FULLY_GATHER PARTITION (ds = '${current}') SELECT v.ERR, SUM(v.TOTAL) AS TOTAL, '其他运营商', v.COUNTRY, v.CT, v.TR, v.CAT FROM VDN_AVLB_MINUTELY_FULLY v WHERE v.DS = '$current' AND v.ISP NOT IN ('电信', '移动', '联通') AND v.ERR IN ('208000', '303000') GROUP BY v.ERR, v.COUNTRY, v.CT, v.TR, v.CAT ORDER BY v.CT ASC, v.TR ASC; "

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
	
echo "export data to MySQL table VDN_AVLB_MINUTELY_FULLY_REPORT .... "
sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_AVLB_MINUTELY_FULLY_REPORT  \
    --export-dir hdfs://centos136.thinker.cn:8020/user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_REPORT/ds=${current} --validate --input-null-string '\\N'  --input-null-non-string '\\N' \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"	

	
echo "export data to MySQL table VDN_AVLB_MINUTELY_FULLY_REPORT .... "
sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_AVLB_MINUTELY_FULLY_GATHER  \
    --export-dir hdfs://centos136.thinker.cn:8020/user/cloudland/vdnlogs/VDN_AVLB_MINUTELY_FULLY_GATHER/ds=${current} --validate --input-null-string '\\N'  --input-null-non-string '\\N' \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"	