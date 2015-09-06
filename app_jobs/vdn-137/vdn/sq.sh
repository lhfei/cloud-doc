sqoop export --connect jdbc:mysql://114.80.177.146:3306/vdn_dashboard --table VDN_AVLB_DAILY  \
    --export-dir hdfs://centos136.thinker.cn:8020/apps/hive/warehouse/vdn_avlb_daily --validate \
    --username vdnuser -password Ifeng01 --input-fields-terminated-by "\t"
