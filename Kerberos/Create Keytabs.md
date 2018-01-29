```shell
curl -i -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -X POST -d '{"Credential" : {"principal" : "kdcadmin/kdcadmin", "key" : "master","type" : "temporary"}}' http://a01-r03-i164-154-515w92j.xx.local:8080/api/v1/clusters/PSS_CLOUD_DEV/credentials/kdc.admin.credential
```





```
stderr: 

 stdout:
2018-01-04 21:35:32,562 - Processing identities...
2018-01-04 21:35:32,685 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,687 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,688 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,688 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,689 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,691 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,692 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,693 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,694 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,695 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,696 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,697 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,697 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,698 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,699 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,700 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,700 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,701 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,702 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,703 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,703 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,704 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,705 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,705 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,706 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,707 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,708 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,708 - Creating keytab file for infra-solr/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,709 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,710 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,711 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,711 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,712 - Creating keytab file for atlas/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,713 - Creating keytab file for atlas/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,713 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,714 - Creating keytab file for atlas/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,715 - Creating keytab file for kafka/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,716 - Creating keytab file for infra-solr/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,716 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,717 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,718 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,719 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,719 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,720 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,721 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,722 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,722 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,723 - Creating keytab file for hbase/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,724 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,724 - Creating keytab file for hbase/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,725 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,726 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,727 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,727 - Creating keytab file for hbase/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,728 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,729 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,730 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,731 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,731 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,732 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,733 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,734 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,734 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,735 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,736 - Creating keytab file for nfs/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,737 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,738 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,738 - Creating keytab file for dn/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,739 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,740 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,741 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,741 - Creating keytab file for nn/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,742 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,743 - Creating keytab file for nn/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,744 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,744 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,745 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,746 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,747 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,747 - Creating keytab file for kafka/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,748 - Creating keytab file for kafka/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,749 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,750 - Creating keytab file for knox/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,750 - Creating keytab file for knox/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,751 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,752 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,753 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,753 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,754 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,755 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,756 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,757 - Creating keytab file for rangeradmin/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,758 - Creating keytab file for rangerlookup/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,759 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,759 - Creating keytab file for rangeradmin/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,760 - Creating keytab file for infra-solr/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,761 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,762 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,762 - Creating keytab file for rangerusersync/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,763 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,764 - Creating keytab file for activity_analyzer/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,765 - Creating keytab file for activity_explorer/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,766 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,766 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,767 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,768 - Creating keytab file for livy/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,769 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,770 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,770 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,771 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,772 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,773 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,774 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,774 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,776 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,776 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,777 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,778 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,779 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,780 - Creating keytab file for nm/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,781 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,781 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,782 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,783 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,784 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,785 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,785 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,786 - Creating keytab file for zeppelin-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,787 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,788 - Creating keytab file for zookeeper/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,789 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,789 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:32,790 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,791 - Creating keytab file for accumulo/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,792 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,793 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,793 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,794 - Creating keytab file for accumulo/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,795 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,796 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,797 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,798 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,799 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,799 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,800 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,801 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,802 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,802 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,803 - Creating keytab file for falcon/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,804 - Creating keytab file for falcon/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,805 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,805 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,806 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,807 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,808 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,809 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,809 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,810 - Creating keytab file for hbase/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,811 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,812 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,813 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,813 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,814 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,815 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,816 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,817 - Creating keytab file for nn/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,818 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,819 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,819 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,820 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,821 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,822 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,822 - Creating keytab file for nfs/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,823 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,824 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,825 - Creating keytab file for dn/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,825 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,826 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,827 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,827 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,828 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,829 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,830 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,830 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,831 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,832 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,833 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,833 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,834 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,835 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,836 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,837 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,837 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,838 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,839 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,840 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,840 - Creating keytab file for jhs/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,841 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,842 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,843 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,843 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,844 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,845 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,846 - Creating keytab file for oozie/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,846 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,847 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,848 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,848 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,849 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,850 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,851 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,852 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,852 - Creating keytab file for livy/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,853 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,854 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,854 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,855 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,856 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,857 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,857 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,858 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,859 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,860 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,860 - Creating keytab file for nm/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,861 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,862 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,863 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,863 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,864 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,865 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,866 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,866 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,867 - Creating keytab file for yarn/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,868 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,869 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,869 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,870 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,871 - Creating keytab file for rm/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,871 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,872 - Creating keytab file for rm/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,873 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,874 - Creating keytab file for zookeeper/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,874 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,875 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:32,876 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,877 - Creating keytab file for accumulo/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,878 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,879 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,879 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,880 - Creating keytab file for accumulo/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,881 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,882 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,883 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,884 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,885 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,886 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,887 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,888 - Creating keytab file for amshbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,888 - Creating keytab file for amshbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,889 - Creating keytab file for amshbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,890 - Creating keytab file for amszk/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,890 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,891 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,892 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,893 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,894 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,894 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,895 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,896 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,897 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,898 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,898 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,899 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,900 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,901 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,901 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,902 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,903 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,904 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,904 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,905 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,906 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,907 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,907 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,908 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,909 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,910 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,911 - Creating keytab file for hbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,911 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,912 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,913 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,914 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,914 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,916 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,917 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,918 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,919 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,919 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,920 - Creating keytab file for nfs/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,921 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,922 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,923 - Creating keytab file for dn/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,923 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,924 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,925 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,926 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,927 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,928 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,929 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,930 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,931 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,932 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,933 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,934 - Creating keytab file for rangertagsync/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,935 - Creating keytab file for rangertagsync/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,936 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,937 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,938 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,939 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,940 - Creating keytab file for livy/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,941 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,942 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,943 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,944 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,945 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,946 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,946 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,947 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,948 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,949 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,950 - Creating keytab file for nm/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,950 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,951 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,952 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,952 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,953 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,954 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,955 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,956 - Creating keytab file for zookeeper/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,957 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,957 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:32,958 - Creating keytab file for ambari-server-pss_cloud_dev@POLARIS.xx.COM on host ambari_server
2018-01-04 21:35:32,959 - Creating keytab file for HTTP/a01-r03-i164-154-515w92j.xx.local@POLARIS.xx.COM on host ambari_server
2018-01-04 21:35:32,960 - Processing identities completed.

```





```shell
stderr: 

 stdout:
2018-01-03 16:17:18,291 - Processing identities...
2018-01-03 16:17:18,401 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,403 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,403 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,404 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,405 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,405 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,406 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,406 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,407 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,408 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,408 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,409 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,410 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,410 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,411 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,411 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,412 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,413 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,413 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,414 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,414 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,415 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,416 - Creating keytab file for accumulo/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,416 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,417 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,417 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,418 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,419 - Creating keytab file for infra-solr/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,419 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,420 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,420 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,421 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,421 - Creating keytab file for atlas/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,422 - Creating keytab file for atlas/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,423 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,423 - Creating keytab file for atlas/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,424 - Creating keytab file for kafka/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,424 - Creating keytab file for infra-solr/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,425 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,426 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,426 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,427 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,427 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,428 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,428 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,429 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,430 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,430 - Creating keytab file for hbase/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,431 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,431 - Creating keytab file for hbase/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,432 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,433 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,433 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,434 - Creating keytab file for hbase/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,434 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,435 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,435 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,436 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,437 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,437 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,438 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,438 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,439 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,440 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,440 - Creating keytab file for nfs/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,441 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,441 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,442 - Creating keytab file for dn/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,442 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,443 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,444 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,444 - Creating keytab file for nn/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,445 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,445 - Creating keytab file for nn/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,446 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,446 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,447 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,448 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,448 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,449 - Creating keytab file for kafka/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,449 - Creating keytab file for kafka/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,450 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,451 - Creating keytab file for knox/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,451 - Creating keytab file for knox/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,452 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,452 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,453 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,454 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,455 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,456 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,457 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,458 - Creating keytab file for rangeradmin/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,458 - Creating keytab file for rangerlookup/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,459 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,460 - Creating keytab file for rangeradmin/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,461 - Creating keytab file for infra-solr/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,462 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,463 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,463 - Creating keytab file for rangerusersync/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,464 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,465 - Creating keytab file for activity_analyzer/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,466 - Creating keytab file for activity_explorer/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,467 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,468 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,469 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,469 - Creating keytab file for livy/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,470 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,471 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,472 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,472 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,473 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,474 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,475 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,476 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,477 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,477 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,478 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,479 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,480 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,481 - Creating keytab file for nm/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,481 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,482 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,483 - Creating keytab file for hive/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,484 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,484 - Creating keytab file for HTTP/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,485 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,486 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,487 - Creating keytab file for zeppelin-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,487 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,488 - Creating keytab file for zookeeper/a01-r03-i164-156-515w9ay.xx.local@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,489 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,489 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-156-515w9ay.xx.local
2018-01-03 16:17:18,490 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,491 - Creating keytab file for accumulo/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,492 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,493 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,493 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,494 - Creating keytab file for accumulo/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,495 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,496 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,497 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,497 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,498 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,499 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,500 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,500 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,501 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,502 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,502 - Creating keytab file for falcon/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,503 - Creating keytab file for falcon/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,504 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,505 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,505 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,506 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,507 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,507 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,508 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,508 - Creating keytab file for hbase/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,509 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,509 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,510 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,511 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,511 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,512 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,512 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,513 - Creating keytab file for nn/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,514 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,514 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,515 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,516 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,516 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,517 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,517 - Creating keytab file for nfs/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,518 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,519 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,519 - Creating keytab file for dn/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,520 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,520 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,521 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,522 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,522 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,523 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,523 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,524 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,525 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,525 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,526 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,526 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,527 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,527 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,528 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,529 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,529 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,530 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,530 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,531 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,532 - Creating keytab file for jhs/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,532 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,533 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,533 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,534 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,535 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,535 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,536 - Creating keytab file for oozie/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,537 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,537 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,538 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,538 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,539 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,540 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,540 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,541 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,541 - Creating keytab file for livy/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,542 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,543 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,543 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,544 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,545 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,545 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,546 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,546 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,547 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,548 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,548 - Creating keytab file for nm/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,549 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,549 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,550 - Creating keytab file for hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,551 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,551 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,552 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,552 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,553 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,554 - Creating keytab file for yarn/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,554 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,555 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,556 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,556 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,557 - Creating keytab file for rm/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,558 - Creating keytab file for HTTP/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,558 - Creating keytab file for rm/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,559 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,559 - Creating keytab file for zookeeper/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,560 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,561 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-157-515w8ey.xx.local
2018-01-03 16:17:18,561 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,562 - Creating keytab file for accumulo/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,563 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,563 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,564 - Creating keytab file for accumulo-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,564 - Creating keytab file for accumulo/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,565 - Creating keytab file for tracer-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,566 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,566 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,567 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,567 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,568 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,569 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,569 - Creating keytab file for amshbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,570 - Creating keytab file for amshbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,571 - Creating keytab file for amshbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,571 - Creating keytab file for amszk/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,572 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,572 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,573 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,573 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,574 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,574 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,575 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,575 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,576 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,576 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,577 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,577 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,578 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,578 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,579 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,579 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,579 - Creating keytab file for druid-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,580 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,580 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,581 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,581 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,582 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,582 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,583 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,583 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,584 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,584 - Creating keytab file for hbase/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,585 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,585 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,586 - Creating keytab file for hbase-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,586 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,587 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,587 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,588 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,588 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,589 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,589 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,589 - Creating keytab file for nfs/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,590 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,590 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,591 - Creating keytab file for dn/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,591 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,592 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,592 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,593 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,593 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,594 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,594 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,595 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,595 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,596 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,596 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,597 - Creating keytab file for rangertagsync/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,597 - Creating keytab file for rangertagsync/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,597 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,598 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,598 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,599 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,599 - Creating keytab file for livy/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,600 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,600 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,601 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,601 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,602 - Creating keytab file for spark-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,602 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,603 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,603 - Creating keytab file for hdfs-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,604 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,604 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,605 - Creating keytab file for nm/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,605 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,606 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,606 - Creating keytab file for hive/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,607 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,607 - Creating keytab file for HTTP/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,608 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,608 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,609 - Creating keytab file for zookeeper/a01-r03-i164-159-515w64k.xx.local@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,609 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,610 - Creating keytab file for ambari-qa-pss_cloud_dev@POLARIS.xx.COM on host a01-r03-i164-159-515w64k.xx.local
2018-01-03 16:17:18,610 - Creating keytab file for ambari-server-pss_cloud_dev@POLARIS.xx.COM on host ambari_server
2018-01-03 16:17:18,611 - Creating keytab file for HTTP/a01-r03-i164-154-515w92j.xx.local@POLARIS.xx.COM on host ambari_server
2018-01-03 16:17:18,611 - Processing identities completed.

```





Update Configuration

```
stderr: 

 stdout:
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/kafka.service.keytab
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.jaas.Client.option.principal: kafka/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,669 - Setting property ranger-kafka-audit/xasecure.audit.destination.solr.force.use.inmemory.jaas.config: true
2018-01-04 21:35:36,669 - Setting property capacity-scheduler/yarn.scheduler.capacity.root.acl_administer_jobs: yarn
2018-01-04 21:35:36,669 - Setting property capacity-scheduler/yarn.scheduler.capacity.root.default.acl_submit_applications: yarn
2018-01-04 21:35:36,669 - Setting property capacity-scheduler/yarn.scheduler.capacity.root.default.acl_administer_queue: yarn
2018-01-04 21:35:36,669 - Setting property capacity-scheduler/yarn.scheduler.capacity.root.acl_administer_queue: yarn
2018-01-04 21:35:36,669 - Setting property capacity-scheduler/yarn.scheduler.capacity.root.default.acl_administer_jobs: yarn
2018-01-04 21:35:36,669 - Setting property falcon-startup.properties/*.dfs.namenode.kerberos.principal: nn/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property falcon-startup.properties/*.falcon.http.authentication.kerberos.name.rules: RULE:[1:$1@$0](accumulo-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[1:$1@$0](ambari-qa-pss_cloud_dev@POLARIS.xx.COM)s/.*/ambari-qa/\
RULE:[1:$1@$0](druid-pss_cloud_dev@POLARIS.xx.COM)s/.*/druid/\
RULE:[1:$1@$0](hbase-pss_cloud_dev@POLARIS.xx.COM)s/.*/hbase/\
RULE:[1:$1@$0](hdfs-pss_cloud_dev@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[1:$1@$0](spark-pss_cloud_dev@POLARIS.xx.COM)s/.*/spark/\
RULE:[1:$1@$0](tracer-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[1:$1@$0](zeppelin-pss_cloud_dev@POLARIS.xx.COM)s/.*/zeppelin/\
RULE:[1:$1@$0](.*@POLARIS.xx.COM)s/@.*//\
RULE:[2:$1@$0](accumulo@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[2:$1@$0](activity_analyzer@POLARIS.xx.COM)s/.*/activity_analyzer/\
RULE:[2:$1@$0](activity_explorer@POLARIS.xx.COM)s/.*/activity_explorer/\
RULE:[2:$1@$0](amshbase@POLARIS.xx.COM)s/.*/ams/\
RULE:[2:$1@$0](amszk@POLARIS.xx.COM)s/.*/ams/\
RULE:[2:$1@$0](atlas@POLARIS.xx.COM)s/.*/atlas/\
RULE:[2:$1@$0](beacon@POLARIS.xx.COM)s/.*/beacon/\
RULE:[2:$1@$0](dn@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](falcon@POLARIS.xx.COM)s/.*/falcon/\
RULE:[2:$1@$0](hbase@POLARIS.xx.COM)s/.*/hbase/\
RULE:[2:$1@$0](hive@POLARIS.xx.COM)s/.*/hive/\
RULE:[2:$1@$0](jhs@POLARIS.xx.COM)s/.*/mapred/\
RULE:[2:$1@$0](knox@POLARIS.xx.COM)s/.*/knox/\
RULE:[2:$1@$0](livy@POLARIS.xx.COM)s/.*/livy/\
RULE:[2:$1@$0](nfs@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](nm@POLARIS.xx.COM)s/.*/yarn/\
RULE:[2:$1@$0](nn@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](oozie@POLARIS.xx.COM)s/.*/oozie/\
RULE:[2:$1@$0](rangeradmin@POLARIS.xx.COM)s/.*/ranger/\
RULE:[2:$1@$0](rangertagsync@POLARIS.xx.COM)s/.*/rangertagsync/\
RULE:[2:$1@$0](rangerusersync@POLARIS.xx.COM)s/.*/rangerusersync/\
RULE:[2:$1@$0](rm@POLARIS.xx.COM)s/.*/yarn/\
RULE:[2:$1@$0](yarn@POLARIS.xx.COM)s/.*/yarn/\
DEFAULT
2018-01-04 21:35:36,670 - Setting property falcon-startup.properties/*.falcon.http.authentication.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,670 - Setting property falcon-startup.properties/*.falcon.http.authentication.type: kerberos
2018-01-04 21:35:36,670 - Setting property falcon-startup.properties/*.falcon.service.authentication.kerberos.principal: falcon/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property falcon-startup.properties/*.falcon.http.authentication.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property falcon-startup.properties/*.falcon.service.authentication.kerberos.keytab: /etc/security/keytabs/falcon.service.keytab
2018-01-04 21:35:36,670 - Setting property falcon-startup.properties/*.falcon.authentication.type: kerberos
2018-01-04 21:35:36,670 - Setting property ams-hbase-site/hbase.superuser: activity_explorer,ams,activity_analyzer
2018-01-04 21:35:36,670 - Setting property ams-hbase-site/zookeeper.znode.parent: /ams-hbase-secure
2018-01-04 21:35:36,670 - Setting property hbase-env/hbase_user_keytab: /etc/security/keytabs/hbase.headless.keytab
2018-01-04 21:35:36,670 - Setting property hbase-env/hbase_principal_name: hbase-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.jaas.KafkaClient.option.storeKey: true
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.kafka.security.protocol: PLAINTEXTSASL
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.jaas.KafkaClient.loginModuleControlFlag: required
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.jaas.KafkaClient.option.useKeyTab: true
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.jaas.KafkaClient.option.keyTab: /etc/security/keytabs/rangertagsync.service.keytab
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.kafka.sasl.kerberos.service.name: kafka
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.jaas.KafkaClient.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.jaas.KafkaClient.option.principal: rangertagsync/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property tagsync-application-properties/atlas.jaas.KafkaClient.option.serviceName: kafka
2018-01-04 21:35:36,670 - Setting property ranger-ugsync-site/ranger.usersync.kerberos.keytab: /etc/security/keytabs/rangerusersync.service.keytab
2018-01-04 21:35:36,670 - Setting property ranger-ugsync-site/ranger.usersync.kerberos.principal: rangerusersync/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property sqoop-atlas-application.properties/atlas.jaas.KafkaClient.option.renewTicket: true
2018-01-04 21:35:36,670 - Setting property sqoop-atlas-application.properties/atlas.jaas.KafkaClient.option.useTicketCache: true
2018-01-04 21:35:36,670 - Setting property knox-env/knox_principal_name: knox/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property knox-env/knox_keytab_path: /etc/security/keytabs/knox.service.keytab
2018-01-04 21:35:36,670 - Setting property ranger-tagsync-site/ranger.tagsync.kerberos.keytab: /etc/security/keytabs/rangertagsync.service.keytab
2018-01-04 21:35:36,670 - Setting property ranger-tagsync-site/ranger.tagsync.kerberos.principal: rangertagsync/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.kafka.security.protocol: PLAINTEXTSASL
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.authentication.method.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.authentication.method.kerberos: true
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.jaas.KafkaClient.option.useKeyTab: true
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.jaas.KafkaClient.option.keyTab: /etc/security/keytabs/atlas.service.keytab
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.server.ha.zookeeper.acl: auth:
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.jaas.KafkaClient.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.jaas.KafkaClient.option.principal: atlas/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.jaas.KafkaClient.option.serviceName: kafka
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.jaas.KafkaClient.option.storeKey: true
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.solr.kerberos.enable: true
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.jaas.KafkaClient.loginModuleControlFlag: required
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.authentication.keytab: /etc/security/keytabs/atlas.service.keytab
2018-01-04 21:35:36,670 - Setting property application-properties/atlas.authentication.principal: atlas/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property application-properties/atlas.kafka.sasl.kerberos.service.name: kafka
2018-01-04 21:35:36,671 - Setting property application-properties/atlas.authentication.method.kerberos.name.rules: RULE:[1:$1@$0](accumulo-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[1:$1@$0](ambari-qa-pss_cloud_dev@POLARIS.xx.COM)s/.*/ambari-qa/\
RULE:[1:$1@$0](druid-pss_cloud_dev@POLARIS.xx.COM)s/.*/druid/\
RULE:[1:$1@$0](hbase-pss_cloud_dev@POLARIS.xx.COM)s/.*/hbase/\
RULE:[1:$1@$0](hdfs-pss_cloud_dev@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[1:$1@$0](spark-pss_cloud_dev@POLARIS.xx.COM)s/.*/spark/\
RULE:[1:$1@$0](tracer-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[1:$1@$0](zeppelin-pss_cloud_dev@POLARIS.xx.COM)s/.*/zeppelin/\
RULE:[1:$1@$0](.*@POLARIS.xx.COM)s/@.*//\
RULE:[2:$1@$0](accumulo@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[2:$1@$0](activity_analyzer@POLARIS.xx.COM)s/.*/activity_analyzer/\
RULE:[2:$1@$0](activity_explorer@POLARIS.xx.COM)s/.*/activity_explorer/\
RULE:[2:$1@$0](amshbase@POLARIS.xx.COM)s/.*/ams/\
RULE:[2:$1@$0](amszk@POLARIS.xx.COM)s/.*/ams/\
RULE:[2:$1@$0](atlas@POLARIS.xx.COM)s/.*/atlas/\
RULE:[2:$1@$0](beacon@POLARIS.xx.COM)s/.*/beacon/\
RULE:[2:$1@$0](dn@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](falcon@POLARIS.xx.COM)s/.*/falcon/\
RULE:[2:$1@$0](hbase@POLARIS.xx.COM)s/.*/hbase/\
RULE:[2:$1@$0](hive@POLARIS.xx.COM)s/.*/hive/\
RULE:[2:$1@$0](jhs@POLARIS.xx.COM)s/.*/mapred/\
RULE:[2:$1@$0](knox@POLARIS.xx.COM)s/.*/knox/\
RULE:[2:$1@$0](livy@POLARIS.xx.COM)s/.*/livy/\
RULE:[2:$1@$0](nfs@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](nm@POLARIS.xx.COM)s/.*/yarn/\
RULE:[2:$1@$0](nn@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](oozie@POLARIS.xx.COM)s/.*/oozie/\
RULE:[2:$1@$0](rangeradmin@POLARIS.xx.COM)s/.*/ranger/\
RULE:[2:$1@$0](rangertagsync@POLARIS.xx.COM)s/.*/rangertagsync/\
RULE:[2:$1@$0](rangerusersync@POLARIS.xx.COM)s/.*/rangerusersync/\
RULE:[2:$1@$0](rm@POLARIS.xx.COM)s/.*/yarn/\
RULE:[2:$1@$0](yarn@POLARIS.xx.COM)s/.*/yarn/\
DEFAULT
2018-01-04 21:35:36,671 - Setting property application-properties/atlas.authentication.method.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.coprocessor.master.classes: org.apache.hadoop.hbase.security.access.AccessController
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.security.authentication.spnego.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,671 - Setting property hbase-site/zookeeper.znode.parent: /hbase-secure
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.regionserver.keytab.file: /etc/security/keytabs/hbase.service.keytab
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.regionserver.kerberos.principal: hbase/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property hbase-site/phoenix.queryserver.keytab.file: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.coprocessor.regionserver.classes: org.apache.hadoop.hbase.security.access.AccessController
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.master.ui.readonly: true
2018-01-04 21:35:36,671 - Setting property hbase-site/phoenix.queryserver.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.coprocessor.region.classes: org.apache.hadoop.hbase.security.access.AccessController,org.apache.hadoop.hbase.security.token.TokenProvider,org.apache.hadoop.hbase.security.access.SecureBulkLoadEndpoint
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.security.authentication: kerberos
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.master.keytab.file: /etc/security/keytabs/hbase.service.keytab
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.bulkload.staging.dir: /apps/hbase/staging
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.security.authorization: true
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.security.authentication.spnego.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property hbase-site/hbase.master.kerberos.principal: hbase/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property gateway-site/gateway.hadoop.kerberos.secured: true
2018-01-04 21:35:36,671 - Setting property gateway-site/java.security.krb5.conf: /etc/krb5.conf
2018-01-04 21:35:36,671 - Setting property mapred-site/mapreduce.jobhistory.keytab: /etc/security/keytabs/jhs.service.keytab
2018-01-04 21:35:36,671 - Setting property mapred-site/mapreduce.jobhistory.webapp.spnego-principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property mapred-site/mapreduce.jobhistory.principal: jhs/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property mapred-site/mapreduce.jobhistory.webapp.spnego-keytab-file: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/rangeradmin.service.keytab
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/ranger.spnego.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/ranger.lookup.kerberos.keytab: /etc/security/keytabs/rangerlookup.service.keytab
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/ranger.admin.kerberos.keytab: /etc/security/keytabs/rangeradmin.service.keytab
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/ranger.admin.kerberos.principal: rangeradmin/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/xasecure.audit.jaas.Client.option.principal: rangeradmin/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property ranger-admin-site/ranger.lookup.kerberos.principal: rangerlookup/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property spark2-thrift-sparkconf/spark.yarn.keytab: {{hive_kerberos_keytab}}
2018-01-04 21:35:36,671 - Setting property spark2-thrift-sparkconf/spark.yarn.principal: {{hive_kerberos_principal}}
2018-01-04 21:35:36,671 - Setting property hive-site/hive.metastore.kerberos.keytab.file: /etc/security/keytabs/hive.service.keytab
2018-01-04 21:35:36,671 - Setting property hive-site/hive.server2.authentication: KERBEROS
2018-01-04 21:35:36,671 - Setting property hive-site/hive.metastore.sasl.enabled: true
2018-01-04 21:35:36,671 - Setting property hive-site/hive.server2.authentication.spnego.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property hive-site/hive.server2.authentication.spnego.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,671 - Setting property hive-site/hive.server2.authentication.kerberos.principal: hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property hive-site/hive.server2.authentication.kerberos.keytab: /etc/security/keytabs/hive.service.keytab
2018-01-04 21:35:36,671 - Setting property hive-site/hive.metastore.kerberos.principal: hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property activity-conf/global.activity.analyzer.user.principal: activity_analyzer/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property activity-conf/global.activity.analyzer.user.keytab: /etc/security/keytabs/activity-analyzer.headless.keytab
2018-01-04 21:35:36,671 - Setting property activity-conf/activity.explorer.user.keytab: /etc/security/keytabs/activity-explorer.headless.keytab
2018-01-04 21:35:36,671 - Setting property activity-conf/activity.explorer.user.principal: activity_explorer/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property tez-site/tez.am.view-acls: 
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/rm.service.keytab
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.jaas.Client.option.principal: rm/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property ranger-yarn-audit/xasecure.audit.destination.solr.force.use.inmemory.jaas.config: true
2018-01-04 21:35:36,671 - Setting property client/kerberos.server.primary: {{bare_accumulo_principal}}
2018-01-04 21:35:36,671 - Setting property webhcat-site/webhcat.proxyuser.knox.groups: users
2018-01-04 21:35:36,671 - Setting property webhcat-site/webhcat.proxyuser.ambari-server-pss_cloud_dev.groups: *
2018-01-04 21:35:36,671 - Setting property webhcat-site/webhcat.proxyuser.ambari-server-pss_cloud_dev.hosts: a01-r03-i164-154-515w92j.xx.local
2018-01-04 21:35:36,671 - Setting property webhcat-site/templeton.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,671 - Setting property webhcat-site/templeton.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,671 - Setting property webhcat-site/templeton.hive.properties: hive.metastore.local=false,hive.metastore.uris=thrift://a01-r03-i164-157-515w8ey.xx.local:9083,hive.metastore.sasl.enabled=true,hive.metastore.execute.setugi=true,hive.metastore.warehouse.dir=/apps/hive/warehouse,hive.exec.mode.local.auto=false,hive.metastore.kerberos.principal=hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property webhcat-site/templeton.kerberos.secret: secret
2018-01-04 21:35:36,672 - Setting property webhcat-site/webhcat.proxyuser.knox.hosts: a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:36,672 - Setting property accumulo-env/accumulo_user_keytab: /etc/security/keytabs/accumulo.headless.keytab
2018-01-04 21:35:36,672 - Setting property accumulo-env/accumulo_principal_name: accumulo-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property falcon-atlas-application.properties/atlas.jaas.KafkaClient.option.keyTab: /etc/security/keytabs/falcon.service.keytab
2018-01-04 21:35:36,672 - Setting property falcon-atlas-application.properties/atlas.jaas.KafkaClient.option.principal: falcon/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.ambari-server-pss_cloud_dev.hosts: a01-r03-i164-154-515w92j.xx.local
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.beacon.groups: *
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.ambari-server-pss_cloud_dev.groups: *
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.security.authentication: kerberos
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.zeppelin.hosts: *
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.beacon.users: *
2018-01-04 21:35:36,672 - Setting property core-site/ha.zookeeper.acl: sasl:nn:rwcda
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.zeppelin.groups: *
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.security.auth_to_local: RULE:[1:$1@$0](accumulo-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/
RULE:[1:$1@$0](ambari-qa-pss_cloud_dev@POLARIS.xx.COM)s/.*/ambari-qa/
RULE:[1:$1@$0](druid-pss_cloud_dev@POLARIS.xx.COM)s/.*/druid/
RULE:[1:$1@$0](hbase-pss_cloud_dev@POLARIS.xx.COM)s/.*/hbase/
RULE:[1:$1@$0](hdfs-pss_cloud_dev@POLARIS.xx.COM)s/.*/hdfs/
RULE:[1:$1@$0](spark-pss_cloud_dev@POLARIS.xx.COM)s/.*/spark/
RULE:[1:$1@$0](tracer-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/
RULE:[1:$1@$0](zeppelin-pss_cloud_dev@POLARIS.xx.COM)s/.*/zeppelin/
RULE:[1:$1@$0](.*@POLARIS.xx.COM)s/@.*//
RULE:[2:$1@$0](accumulo@POLARIS.xx.COM)s/.*/accumulo/
RULE:[2:$1@$0](activity_analyzer@POLARIS.xx.COM)s/.*/activity_analyzer/
RULE:[2:$1@$0](activity_explorer@POLARIS.xx.COM)s/.*/activity_explorer/
RULE:[2:$1@$0](amshbase@POLARIS.xx.COM)s/.*/ams/
RULE:[2:$1@$0](amszk@POLARIS.xx.COM)s/.*/ams/
RULE:[2:$1@$0](atlas@POLARIS.xx.COM)s/.*/atlas/
RULE:[2:$1@$0](beacon@POLARIS.xx.COM)s/.*/beacon/
RULE:[2:$1@$0](dn@POLARIS.xx.COM)s/.*/hdfs/
RULE:[2:$1@$0](falcon@POLARIS.xx.COM)s/.*/falcon/
RULE:[2:$1@$0](hbase@POLARIS.xx.COM)s/.*/hbase/
RULE:[2:$1@$0](hive@POLARIS.xx.COM)s/.*/hive/
RULE:[2:$1@$0](jhs@POLARIS.xx.COM)s/.*/mapred/
RULE:[2:$1@$0](knox@POLARIS.xx.COM)s/.*/knox/
RULE:[2:$1@$0](livy@POLARIS.xx.COM)s/.*/livy/
RULE:[2:$1@$0](nfs@POLARIS.xx.COM)s/.*/hdfs/
RULE:[2:$1@$0](nm@POLARIS.xx.COM)s/.*/yarn/
RULE:[2:$1@$0](nn@POLARIS.xx.COM)s/.*/hdfs/
RULE:[2:$1@$0](oozie@POLARIS.xx.COM)s/.*/oozie/
RULE:[2:$1@$0](rangeradmin@POLARIS.xx.COM)s/.*/ranger/
RULE:[2:$1@$0](rangertagsync@POLARIS.xx.COM)s/.*/rangertagsync/
RULE:[2:$1@$0](rangerusersync@POLARIS.xx.COM)s/.*/rangerusersync/
RULE:[2:$1@$0](rm@POLARIS.xx.COM)s/.*/yarn/
RULE:[2:$1@$0](yarn@POLARIS.xx.COM)s/.*/yarn/
DEFAULT
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.yarn.groups: *
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.livy.hosts: *
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.knox.hosts: a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.security.authorization: true
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.yarn.hosts: a01-r03-i164-157-515w8ey.xx.local
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.knox.groups: users
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.livy.groups: *
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.HTTP.hosts: a01-r03-i164-156-515w9ay.xx.local,a01-r03-i164-157-515w8ey.xx.local,a01-r03-i164-159-515w64k.xx.local
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.HTTP.groups: users
2018-01-04 21:35:36,672 - Setting property core-site/hadoop.proxyuser.beacon.hosts: *
2018-01-04 21:35:36,672 - Setting property spark2-defaults/spark.history.kerberos.keytab: /etc/security/keytabs/spark.headless.keytab
2018-01-04 21:35:36,672 - Setting property spark2-defaults/spark.history.kerberos.principal: spark-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property spark2-defaults/spark.history.kerberos.enabled: true
2018-01-04 21:35:36,672 - Setting property druid-common/druid.security.extensions.loadList: ["druid-kerberos"]
2018-01-04 21:35:36,672 - Setting property druid-common/druid.hadoop.security.spnego.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,672 - Setting property druid-common/druid.hadoop.security.spnego.excludedPaths: ["/status"]
2018-01-04 21:35:36,672 - Setting property druid-common/druid.hadoop.security.kerberos.keytab: /etc/security/keytabs/druid.headless.keytab
2018-01-04 21:35:36,672 - Setting property druid-common/druid.hadoop.security.spnego.authToLocal: RULE:[1:$1@$0](accumulo-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[1:$1@$0](ambari-qa-pss_cloud_dev@POLARIS.xx.COM)s/.*/ambari-qa/\
RULE:[1:$1@$0](druid-pss_cloud_dev@POLARIS.xx.COM)s/.*/druid/\
RULE:[1:$1@$0](hbase-pss_cloud_dev@POLARIS.xx.COM)s/.*/hbase/\
RULE:[1:$1@$0](hdfs-pss_cloud_dev@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[1:$1@$0](spark-pss_cloud_dev@POLARIS.xx.COM)s/.*/spark/\
RULE:[1:$1@$0](tracer-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[1:$1@$0](zeppelin-pss_cloud_dev@POLARIS.xx.COM)s/.*/zeppelin/\
RULE:[1:$1@$0](.*@POLARIS.xx.COM)s/@.*//\
RULE:[2:$1@$0](accumulo@POLARIS.xx.COM)s/.*/accumulo/\
RULE:[2:$1@$0](activity_analyzer@POLARIS.xx.COM)s/.*/activity_analyzer/\
RULE:[2:$1@$0](activity_explorer@POLARIS.xx.COM)s/.*/activity_explorer/\
RULE:[2:$1@$0](amshbase@POLARIS.xx.COM)s/.*/ams/\
RULE:[2:$1@$0](amszk@POLARIS.xx.COM)s/.*/ams/\
RULE:[2:$1@$0](atlas@POLARIS.xx.COM)s/.*/atlas/\
RULE:[2:$1@$0](beacon@POLARIS.xx.COM)s/.*/beacon/\
RULE:[2:$1@$0](dn@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](falcon@POLARIS.xx.COM)s/.*/falcon/\
RULE:[2:$1@$0](hbase@POLARIS.xx.COM)s/.*/hbase/\
RULE:[2:$1@$0](hive@POLARIS.xx.COM)s/.*/hive/\
RULE:[2:$1@$0](jhs@POLARIS.xx.COM)s/.*/mapred/\
RULE:[2:$1@$0](knox@POLARIS.xx.COM)s/.*/knox/\
RULE:[2:$1@$0](livy@POLARIS.xx.COM)s/.*/livy/\
RULE:[2:$1@$0](nfs@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](nm@POLARIS.xx.COM)s/.*/yarn/\
RULE:[2:$1@$0](nn@POLARIS.xx.COM)s/.*/hdfs/\
RULE:[2:$1@$0](oozie@POLARIS.xx.COM)s/.*/oozie/\
RULE:[2:$1@$0](rangeradmin@POLARIS.xx.COM)s/.*/ranger/\
RULE:[2:$1@$0](rangertagsync@POLARIS.xx.COM)s/.*/rangertagsync/\
RULE:[2:$1@$0](rangerusersync@POLARIS.xx.COM)s/.*/rangerusersync/\
RULE:[2:$1@$0](rm@POLARIS.xx.COM)s/.*/yarn/\
RULE:[2:$1@$0](yarn@POLARIS.xx.COM)s/.*/yarn/\
DEFAULT
2018-01-04 21:35:36,672 - Setting property druid-common/druid.hadoop.security.spnego.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property druid-common/druid.hadoop.security.kerberos.principal: druid-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property hdfs-site/dfs.web.authentication.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property hdfs-site/dfs.secondary.namenode.kerberos.internal.spnego.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property hdfs-site/dfs.secondary.namenode.kerberos.principal: nn/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,672 - Setting property hdfs-site/dfs.datanode.address: 0.0.0.0:1019
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.namenode.keytab.file: /etc/security/keytabs/nn.service.keytab
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.datanode.kerberos.principal: dn/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.namenode.kerberos.internal.spnego.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property hdfs-site/nfs.keytab.file: /etc/security/keytabs/nfs.service.keytab
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.secondary.namenode.keytab.file: /etc/security/keytabs/nn.service.keytab
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.datanode.keytab.file: /etc/security/keytabs/dn.service.keytab
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.namenode.kerberos.principal: nn/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.web.authentication.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,673 - Setting property hdfs-site/nfs.kerberos.principal: nfs/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.datanode.http.address: 0.0.0.0:1022
2018-01-04 21:35:36,673 - Setting property hdfs-site/dfs.block.access.token.enable: true
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/atlas.service.keytab
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.jaas.Client.option.principal: atlas/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property ranger-atlas-audit/xasecure.audit.destination.solr.force.use.inmemory.jaas.config: true
2018-01-04 21:35:36,673 - Setting property kafka-broker/principal.to.local.class: kafka.security.auth.KerberosPrincipalToLocal
2018-01-04 21:35:36,673 - Setting property kafka-broker/authorizer.class.name: kafka.security.auth.SimpleAclAuthorizer
2018-01-04 21:35:36,673 - Setting property kafka-broker/security.inter.broker.protocol: PLAINTEXTSASL
2018-01-04 21:35:36,673 - Setting property kafka-broker/super.users: User:kafka
2018-01-04 21:35:36,673 - Setting property kafka-broker/zookeeper.set.acl: true
2018-01-04 21:35:36,673 - Setting property kafka-broker/sasl.kerberos.principal.to.local.rules: RULE:[1:$1@$0](accumulo-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/,RULE:[1:$1@$0](ambari-qa-pss_cloud_dev@POLARIS.xx.COM)s/.*/ambari-qa/,RULE:[1:$1@$0](druid-pss_cloud_dev@POLARIS.xx.COM)s/.*/druid/,RULE:[1:$1@$0](hbase-pss_cloud_dev@POLARIS.xx.COM)s/.*/hbase/,RULE:[1:$1@$0](hdfs-pss_cloud_dev@POLARIS.xx.COM)s/.*/hdfs/,RULE:[1:$1@$0](spark-pss_cloud_dev@POLARIS.xx.COM)s/.*/spark/,RULE:[1:$1@$0](tracer-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/,RULE:[1:$1@$0](zeppelin-pss_cloud_dev@POLARIS.xx.COM)s/.*/zeppelin/,RULE:[1:$1@$0](.*@POLARIS.xx.COM)s/@.*//,RULE:[2:$1@$0](accumulo@POLARIS.xx.COM)s/.*/accumulo/,RULE:[2:$1@$0](activity_analyzer@POLARIS.xx.COM)s/.*/activity_analyzer/,RULE:[2:$1@$0](activity_explorer@POLARIS.xx.COM)s/.*/activity_explorer/,RULE:[2:$1@$0](amshbase@POLARIS.xx.COM)s/.*/ams/,RULE:[2:$1@$0](amszk@POLARIS.xx.COM)s/.*/ams/,RULE:[2:$1@$0](atlas@POLARIS.xx.COM)s/.*/atlas/,RULE:[2:$1@$0](beacon@POLARIS.xx.COM)s/.*/beacon/,RULE:[2:$1@$0](dn@POLARIS.xx.COM)s/.*/hdfs/,RULE:[2:$1@$0](falcon@POLARIS.xx.COM)s/.*/falcon/,RULE:[2:$1@$0](hbase@POLARIS.xx.COM)s/.*/hbase/,RULE:[2:$1@$0](hive@POLARIS.xx.COM)s/.*/hive/,RULE:[2:$1@$0](jhs@POLARIS.xx.COM)s/.*/mapred/,RULE:[2:$1@$0](knox@POLARIS.xx.COM)s/.*/knox/,RULE:[2:$1@$0](livy@POLARIS.xx.COM)s/.*/livy/,RULE:[2:$1@$0](nfs@POLARIS.xx.COM)s/.*/hdfs/,RULE:[2:$1@$0](nm@POLARIS.xx.COM)s/.*/yarn/,RULE:[2:$1@$0](nn@POLARIS.xx.COM)s/.*/hdfs/,RULE:[2:$1@$0](oozie@POLARIS.xx.COM)s/.*/oozie/,RULE:[2:$1@$0](rangeradmin@POLARIS.xx.COM)s/.*/ranger/,RULE:[2:$1@$0](rangertagsync@POLARIS.xx.COM)s/.*/rangertagsync/,RULE:[2:$1@$0](rangerusersync@POLARIS.xx.COM)s/.*/rangerusersync/,RULE:[2:$1@$0](rm@POLARIS.xx.COM)s/.*/yarn/,RULE:[2:$1@$0](yarn@POLARIS.xx.COM)s/.*/yarn/,DEFAULT
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.proxyuser.*.groups: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.signer.secret.provider.object: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.webapp.spnego-principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.proxyuser.*.groups: 
2018-01-04 21:35:36,673 - Setting property yarn-site/hadoop.registry.secure: true
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.nodemanager.container-executor.class: org.apache.hadoop.yarn.server.nodemanager.LinuxContainerExecutor
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.nodemanager.keytab: /etc/security/keytabs/nm.service.keytab
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.proxyuser.*.hosts: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.token.validity: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.admin.acl: dr.who,activity_analyzer,yarn
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.keytab: /etc/security/keytabs/rm.service.keytab
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.cookie.path: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.type: kerberos
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.nodemanager.principal: nm/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.proxy-user-privileges.enabled: true
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.acl.enable: true
2018-01-04 21:35:36,673 - Setting property yarn-site/hadoop.registry.client.auth: kerberos
2018-01-04 21:35:36,673 - Setting property yarn-site/hadoop.registry.jaas.context: Client
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.proxyuser.ambari-server-pss_cloud_dev.groups: *
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.proxyuser.ambari-server-pss_cloud_dev.hosts: a01-r03-i164-154-515w92j.xx.local
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.principal: rm/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.enabled: true
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.proxyuser.*.users: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.nodemanager.webapp.spnego-keytab-file: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.keytab: /etc/security/keytabs/yarn.service.keytab
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.nodemanager.webapp.spnego-principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.kerberos.name.rules: 
2018-01-04 21:35:36,673 - Setting property yarn-site/hadoop.registry.system.accounts: sasl:yarn,sasl:jhs,sasl:hdfs-pss_cloud_dev,sasl:rm,sasl:hive
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.signer.secret.provider: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.zk-acl: sasl:rm:rwcda
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.proxyuser.*.users: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.signature.secret: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.principal: yarn/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.signature.secret.file: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.resourcemanager.webapp.spnego-keytab-file: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.proxyuser.*.hosts: 
2018-01-04 21:35:36,673 - Setting property yarn-site/yarn.timeline-service.http-authentication.cookie.domain: 
2018-01-04 21:35:36,673 - Setting property zeppelin-env/zeppelin.server.kerberos.keytab: /etc/security/keytabs/zeppelin.server.kerberos.keytab
2018-01-04 21:35:36,673 - Setting property zeppelin-env/zeppelin.server.kerberos.principal: zeppelin-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property zeppelin-env/zeppelin.kerberos.enabled: true
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/hbase.service.keytab
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.jaas.Client.option.principal: hbase/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,673 - Setting property ranger-hbase-audit/xasecure.audit.destination.solr.force.use.inmemory.jaas.config: true
2018-01-04 21:35:36,673 - Setting property hive-atlas-application.properties/atlas.jaas.ticketBased-KafkaClient.option.useTicketCache: true
2018-01-04 21:35:36,674 - Setting property hive-atlas-application.properties/atlas.jaas.KafkaClient.option.keyTab: /etc/security/keytabs/hive.service.keytab
2018-01-04 21:35:36,674 - Setting property hive-atlas-application.properties/atlas.jaas.ticketBased-KafkaClient.loginModuleControlFlag: required
2018-01-04 21:35:36,674 - Setting property hive-atlas-application.properties/atlas.jaas.ticketBased-KafkaClient.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,674 - Setting property hive-atlas-application.properties/atlas.jaas.KafkaClient.option.principal: hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property kafka-env/kafka_keytab: /etc/security/keytabs/kafka.service.keytab
2018-01-04 21:35:36,674 - Setting property kafka-env/kafka_principal_name: kafka/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.coprocessor.master.classes: org.apache.hadoop.hbase.security.access.AccessController
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.myclient.keytab: /etc/security/keytabs/ams.collector.keytab
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hadoop.security.authentication: kerberos
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.myclient.principal: amshbase/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/ams.zookeeper.keytab: /etc/security/keytabs/ams-zk.service.keytab
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.zookeeper.property.jaasLoginRenew: 3600000
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.zookeeper.property.authProvider.1: org.apache.zookeeper.server.auth.SASLAuthenticationProvider
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.regionserver.keytab.file: /etc/security/keytabs/ams-hbase.regionserver.keytab
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.zookeeper.property.kerberos.removeHostFromPrincipal: true
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.regionserver.kerberos.principal: amshbase/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.coprocessor.region.classes: org.apache.hadoop.hbase.security.token.TokenProvider,org.apache.hadoop.hbase.security.access.AccessController
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.security.authentication: kerberos
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.master.keytab.file: /etc/security/keytabs/ams-hbase.master.keytab
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.security.authorization: true
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.zookeeper.property.kerberos.removeRealmFromPrincipal: true
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/hbase.master.kerberos.principal: amshbase/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property ams-hbase-security-site/ams.zookeeper.principal: amszk/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property hadoop-env/hdfs_user_keytab: /etc/security/keytabs/hdfs.headless.keytab
2018-01-04 21:35:36,674 - Setting property hadoop-env/hdfs_principal_name: hdfs-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property accumulo-site/trace.user: tracer-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property accumulo-site/instance.security.authenticator: org.apache.accumulo.server.security.handler.KerberosAuthenticator
2018-01-04 21:35:36,674 - Setting property accumulo-site/general.kerberos.principal: accumulo/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property accumulo-site/instance.rpc.sasl.enabled: true
2018-01-04 21:35:36,674 - Setting property accumulo-site/general.delegation.token.lifetime: 7d
2018-01-04 21:35:36,674 - Setting property accumulo-site/trace.token.type: org.apache.accumulo.core.client.security.tokens.KerberosToken
2018-01-04 21:35:36,674 - Setting property accumulo-site/instance.security.permissionHandler: org.apache.accumulo.server.security.handler.KerberosPermissionHandler
2018-01-04 21:35:36,674 - Setting property accumulo-site/general.kerberos.keytab: /etc/security/keytabs/accumulo.service.keytab
2018-01-04 21:35:36,674 - Setting property accumulo-site/trace.token.property.keytab: /etc/security/keytabs/accumulo-tracer.headless.keytab
2018-01-04 21:35:36,674 - Setting property accumulo-site/general.delegation.token.update.interval: 1d
2018-01-04 21:35:36,674 - Setting property accumulo-site/instance.security.authorizor: org.apache.accumulo.server.security.handler.KerberosAuthorizor
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/nn.service.keytab
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.jaas.Client.option.principal: nn/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property ranger-hdfs-audit/xasecure.audit.destination.solr.force.use.inmemory.jaas.config: true
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.service.ProxyUserService.proxyuser.knox.hosts: a01-r03-i164-156-515w9ay.xx.local
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.authentication.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.service.AuthorizationService.authorization.enabled: true
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.service.HadoopAccessorService.keytab.file: /etc/security/keytabs/oozie.service.keytab
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.service.HadoopAccessorService.kerberos.enabled: true
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.authentication.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.authentication.kerberos.name.rules: RULE:[1:$1@$0](accumulo-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/
RULE:[1:$1@$0](ambari-qa-pss_cloud_dev@POLARIS.xx.COM)s/.*/ambari-qa/
RULE:[1:$1@$0](druid-pss_cloud_dev@POLARIS.xx.COM)s/.*/druid/
RULE:[1:$1@$0](hbase-pss_cloud_dev@POLARIS.xx.COM)s/.*/hbase/
RULE:[1:$1@$0](hdfs-pss_cloud_dev@POLARIS.xx.COM)s/.*/hdfs/
RULE:[1:$1@$0](spark-pss_cloud_dev@POLARIS.xx.COM)s/.*/spark/
RULE:[1:$1@$0](tracer-pss_cloud_dev@POLARIS.xx.COM)s/.*/accumulo/
RULE:[1:$1@$0](zeppelin-pss_cloud_dev@POLARIS.xx.COM)s/.*/zeppelin/
RULE:[1:$1@$0](.*@POLARIS.xx.COM)s/@.*//
RULE:[2:$1@$0](accumulo@POLARIS.xx.COM)s/.*/accumulo/
RULE:[2:$1@$0](activity_analyzer@POLARIS.xx.COM)s/.*/activity_analyzer/
RULE:[2:$1@$0](activity_explorer@POLARIS.xx.COM)s/.*/activity_explorer/
RULE:[2:$1@$0](amshbase@POLARIS.xx.COM)s/.*/ams/
RULE:[2:$1@$0](amszk@POLARIS.xx.COM)s/.*/ams/
RULE:[2:$1@$0](atlas@POLARIS.xx.COM)s/.*/atlas/
RULE:[2:$1@$0](beacon@POLARIS.xx.COM)s/.*/beacon/
RULE:[2:$1@$0](dn@POLARIS.xx.COM)s/.*/hdfs/
RULE:[2:$1@$0](falcon@POLARIS.xx.COM)s/.*/falcon/
RULE:[2:$1@$0](hbase@POLARIS.xx.COM)s/.*/hbase/
RULE:[2:$1@$0](hive@POLARIS.xx.COM)s/.*/hive/
RULE:[2:$1@$0](jhs@POLARIS.xx.COM)s/.*/mapred/
RULE:[2:$1@$0](knox@POLARIS.xx.COM)s/.*/knox/
RULE:[2:$1@$0](livy@POLARIS.xx.COM)s/.*/livy/
RULE:[2:$1@$0](nfs@POLARIS.xx.COM)s/.*/hdfs/
RULE:[2:$1@$0](nm@POLARIS.xx.COM)s/.*/yarn/
RULE:[2:$1@$0](nn@POLARIS.xx.COM)s/.*/hdfs/
RULE:[2:$1@$0](oozie@POLARIS.xx.COM)s/.*/oozie/
RULE:[2:$1@$0](rangeradmin@POLARIS.xx.COM)s/.*/ranger/
RULE:[2:$1@$0](rangertagsync@POLARIS.xx.COM)s/.*/rangertagsync/
RULE:[2:$1@$0](rangerusersync@POLARIS.xx.COM)s/.*/rangerusersync/
RULE:[2:$1@$0](rm@POLARIS.xx.COM)s/.*/yarn/
RULE:[2:$1@$0](yarn@POLARIS.xx.COM)s/.*/yarn/
DEFAULT
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.credentials.credentialclasses: hcat=org.apache.oozie.action.hadoop.HCatCredentials,hive2=org.apache.oozie.action.hadoop.Hive2Credentials
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.service.HadoopAccessorService.kerberos.principal: oozie/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.service.ProxyUserService.proxyuser.knox.groups: users
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.authentication.type: kerberos
2018-01-04 21:35:36,674 - Setting property oozie-site/oozie.zookeeper.secure: true
2018-01-04 21:35:36,674 - Setting property oozie-site/local.realm: POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property zookeeper-env/zookeeper_principal_name: zookeeper/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property zookeeper-env/zookeeper_keytab_path: /etc/security/keytabs/zk.service.keytab
2018-01-04 21:35:36,674 - Setting property cluster-env/smokeuser_keytab: /etc/security/keytabs/smokeuser.headless.keytab
2018-01-04 21:35:36,674 - Setting property cluster-env/security_enabled: true
2018-01-04 21:35:36,674 - Setting property cluster-env/smokeuser_principal_name: ambari-qa-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property cluster-env/ambari_principal_name: ambari-server-pss_cloud_dev@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property livy2-conf/livy.server.auth.kerberos.principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property livy2-conf/livy.server.launch.kerberos.principal: livy/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property livy2-conf/livy.server.launch.kerberos.keytab: /etc/security/keytabs/livy.service.keytab
2018-01-04 21:35:36,674 - Setting property livy2-conf/livy.impersonation.enabled: true
2018-01-04 21:35:36,674 - Setting property livy2-conf/livy.server.auth.type: kerberos
2018-01-04 21:35:36,674 - Setting property livy2-conf/livy.server.auth.kerberos.keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,674 - Setting property hive-interactive-site/hive.llap.daemon.keytab.file: /etc/security/keytabs/hive.service.keytab
2018-01-04 21:35:36,674 - Setting property hive-interactive-site/hive.llap.task.keytab.file: /etc/security/keytabs/hive.llap.task.keytab
2018-01-04 21:35:36,674 - Setting property hive-interactive-site/hive.llap.zk.sm.principal: hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property hive-interactive-site/hive.llap.daemon.service.principal: hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property hive-interactive-site/hive.llap.task.principal: hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,674 - Setting property hive-interactive-site/hive.llap.zk.sm.keytab.file: /etc/security/keytabs/hive.llap.zk.sm.keytab
2018-01-04 21:35:36,674 - Setting property ranger-hive-audit/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/hive.service.keytab
2018-01-04 21:35:36,675 - Setting property ranger-hive-audit/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,675 - Setting property ranger-hive-audit/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,675 - Setting property ranger-hive-audit/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,675 - Setting property ranger-hive-audit/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,675 - Setting property ranger-hive-audit/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,675 - Setting property ranger-hive-audit/xasecure.audit.jaas.Client.option.principal: hive/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,675 - Setting property ranger-hive-audit/xasecure.audit.destination.solr.force.use.inmemory.jaas.config: true
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.jaas.Client.option.keyTab: /etc/security/keytabs/knox.service.keytab
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.jaas.Client.loginModuleControlFlag: required
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.jaas.Client.option.serviceName: solr
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.jaas.Client.loginModuleName: com.sun.security.auth.module.Krb5LoginModule
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.jaas.Client.option.useKeyTab: true
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.jaas.Client.option.storeKey: false
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.jaas.Client.option.principal: knox/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,675 - Setting property ranger-knox-audit/xasecure.audit.destination.solr.force.use.inmemory.jaas.config: true
2018-01-04 21:35:36,675 - Setting property infra-solr-env/infra_solr_web_kerberos_principal: HTTP/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,675 - Setting property infra-solr-env/infra_solr_kerberos_keytab: /etc/security/keytabs/ambari-infra-solr.service.keytab
2018-01-04 21:35:36,675 - Setting property infra-solr-env/infra_solr_web_kerberos_keytab: /etc/security/keytabs/spnego.service.keytab
2018-01-04 21:35:36,675 - Setting property infra-solr-env/infra_solr_kerberos_principal: infra-solr/_HOST@POLARIS.xx.COM
2018-01-04 21:35:36,675 - Removing property yarn-site/yarn.timeline-service.http-authentication.proxyuser.root.groups
2018-01-04 21:35:36,675 - Removing property yarn-site/yarn.timeline-service.http-authentication.proxyuser.root.hosts
2018-01-04 21:35:36,675 - Removing property webhcat-site/webhcat.proxyuser.root.groups
2018-01-04 21:35:36,675 - Removing property webhcat-site/webhcat.proxyuser.root.hosts
2018-01-04 21:35:36,675 - Removing property hbase-site/hbase.bucketcache.percentage.in.combinedcache
2018-01-04 21:35:36,675 - Removing property core-site/hadoop.proxyuser.root.groups
2018-01-04 21:35:36,675 - Removing property core-site/hadoop.proxyuser.root.hosts

```







Finalize Operations

```
stderr: 

 stdout:
2018-01-04 21:35:40,746 - Setting securityState for ACCUMULO/ACCUMULO_MASTER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,760 - Setting securityState for ACCUMULO/ACCUMULO_MONITOR on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,774 - Setting securityState for ACCUMULO/ACCUMULO_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,786 - Setting securityState for ACCUMULO/ACCUMULO_TRACER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,799 - Setting securityState for ACCUMULO/ACCUMULO_TSERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,811 - Setting securityState for ACCUMULO/ACCUMULO_GC on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,822 - Setting securityState for AMBARI_INFRA/INFRA_SOLR on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,835 - Setting securityState for AMBARI_INFRA/INFRA_SOLR_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,847 - Setting securityState for AMBARI_METRICS/METRICS_MONITOR on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,856 - Setting securityState for AMBARI_METRICS/METRICS_GRAFANA on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,872 - Setting securityState for ATLAS/ATLAS_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,887 - Setting securityState for ATLAS/ATLAS_SERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,901 - Setting securityState for FALCON/FALCON_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,912 - Setting securityState for HBASE/HBASE_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,926 - Setting securityState for HBASE/HBASE_MASTER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,942 - Setting securityState for HBASE/HBASE_REGIONSERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,954 - Setting securityState for HBASE/PHOENIX_QUERY_SERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,963 - Setting securityState for HDFS/HDFS_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:40,980 - Setting securityState for HDFS/NFS_GATEWAY on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,000 - Setting securityState for HDFS/DATANODE on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,014 - Setting securityState for HDFS/NAMENODE on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,026 - Setting securityState for HIVE/HIVE_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,039 - Setting securityState for HIVE/HCAT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,051 - Setting securityState for KAFKA/KAFKA_BROKER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,061 - Setting securityState for KNOX/KNOX_GATEWAY on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,074 - Setting securityState for MAPREDUCE2/MAPREDUCE2_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,087 - Setting securityState for OOZIE/OOZIE_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,102 - Setting securityState for PIG/PIG on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,118 - Setting securityState for RANGER/RANGER_ADMIN on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,133 - Setting securityState for RANGER/RANGER_USERSYNC on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,146 - Setting securityState for SLIDER/SLIDER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,158 - Setting securityState for SMARTSENSE/ACTIVITY_ANALYZER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,171 - Setting securityState for SMARTSENSE/HST_AGENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,187 - Setting securityState for SMARTSENSE/ACTIVITY_EXPLORER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,200 - Setting securityState for SMARTSENSE/HST_SERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,212 - Setting securityState for SPARK2/LIVY2_SERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,226 - Setting securityState for SPARK2/SPARK2_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,242 - Setting securityState for SPARK2/SPARK2_THRIFTSERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,253 - Setting securityState for SPARK2/SPARK2_JOBHISTORYSERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,262 - Setting securityState for SQOOP/SQOOP on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,279 - Setting securityState for TEZ/TEZ_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,293 - Setting securityState for YARN/NODEMANAGER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,310 - Setting securityState for YARN/YARN_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,325 - Setting securityState for ZEPPELIN/ZEPPELIN_MASTER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,338 - Setting securityState for ZOOKEEPER/ZOOKEEPER_SERVER on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,350 - Setting securityState for ZOOKEEPER/ZOOKEEPER_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,364 - Setting securityState for KERBEROS/KERBEROS_CLIENT on host a01-r03-i164-156-515w9ay.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,380 - Setting securityState for ACCUMULO/ACCUMULO_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,392 - Setting securityState for ACCUMULO/ACCUMULO_TSERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,401 - Setting securityState for AMBARI_INFRA/INFRA_SOLR_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,417 - Setting securityState for AMBARI_METRICS/METRICS_MONITOR on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,432 - Setting securityState for ATLAS/ATLAS_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,445 - Setting securityState for FALCON/FALCON_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,456 - Setting securityState for FALCON/FALCON_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,474 - Setting securityState for HBASE/HBASE_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,489 - Setting securityState for HBASE/HBASE_REGIONSERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,499 - Setting securityState for HBASE/PHOENIX_QUERY_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,508 - Setting securityState for HDFS/SECONDARY_NAMENODE on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,524 - Setting securityState for HDFS/HDFS_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,539 - Setting securityState for HDFS/NFS_GATEWAY on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,553 - Setting securityState for HDFS/DATANODE on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,565 - Setting securityState for HIVE/HIVE_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,578 - Setting securityState for HIVE/HIVE_METASTORE on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,590 - Setting securityState for HIVE/HIVE_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,603 - Setting securityState for HIVE/HCAT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,619 - Setting securityState for HIVE/WEBHCAT_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,632 - Setting securityState for MAPREDUCE2/HISTORYSERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,641 - Setting securityState for MAPREDUCE2/MAPREDUCE2_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,657 - Setting securityState for OOZIE/OOZIE_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,672 - Setting securityState for OOZIE/OOZIE_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,685 - Setting securityState for PIG/PIG on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,697 - Setting securityState for SLIDER/SLIDER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,710 - Setting securityState for SMARTSENSE/HST_AGENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,726 - Setting securityState for SPARK2/LIVY2_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,739 - Setting securityState for SPARK2/SPARK2_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,750 - Setting securityState for SPARK2/SPARK2_THRIFTSERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,765 - Setting securityState for SQOOP/SQOOP on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,782 - Setting securityState for TEZ/TEZ_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,792 - Setting securityState for YARN/NODEMANAGER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,801 - Setting securityState for YARN/YARN_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,818 - Setting securityState for YARN/APP_TIMELINE_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,832 - Setting securityState for YARN/RESOURCEMANAGER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,849 - Setting securityState for ZOOKEEPER/ZOOKEEPER_SERVER on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,864 - Setting securityState for ZOOKEEPER/ZOOKEEPER_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,877 - Setting securityState for KERBEROS/KERBEROS_CLIENT on host a01-r03-i164-157-515w8ey.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,889 - Setting securityState for ACCUMULO/ACCUMULO_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,903 - Setting securityState for ACCUMULO/ACCUMULO_TSERVER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,919 - Setting securityState for AMBARI_INFRA/INFRA_SOLR_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,931 - Setting securityState for AMBARI_METRICS/METRICS_MONITOR on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,939 - Setting securityState for AMBARI_METRICS/METRICS_COLLECTOR on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,956 - Setting securityState for ATLAS/ATLAS_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,971 - Setting securityState for DRUID/DRUID_OVERLORD on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,985 - Setting securityState for DRUID/DRUID_MIDDLEMANAGER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:41,996 - Setting securityState for DRUID/DRUID_COORDINATOR on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,010 - Setting securityState for DRUID/DRUID_ROUTER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,027 - Setting securityState for DRUID/DRUID_HISTORICAL on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,038 - Setting securityState for DRUID/DRUID_BROKER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,047 - Setting securityState for FALCON/FALCON_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,063 - Setting securityState for HBASE/HBASE_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,078 - Setting securityState for HBASE/HBASE_REGIONSERVER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,092 - Setting securityState for HBASE/PHOENIX_QUERY_SERVER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,103 - Setting securityState for HDFS/HDFS_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,117 - Setting securityState for HDFS/NFS_GATEWAY on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,129 - Setting securityState for HDFS/DATANODE on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,142 - Setting securityState for HIVE/HIVE_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,158 - Setting securityState for HIVE/HCAT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,171 - Setting securityState for MAPREDUCE2/MAPREDUCE2_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,179 - Setting securityState for OOZIE/OOZIE_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,196 - Setting securityState for PIG/PIG on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,215 - Setting securityState for RANGER/RANGER_TAGSYNC on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,230 - Setting securityState for SLIDER/SLIDER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,242 - Setting securityState for SMARTSENSE/HST_AGENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,255 - Setting securityState for SPARK2/LIVY2_SERVER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,271 - Setting securityState for SPARK2/SPARK2_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,284 - Setting securityState for SPARK2/SPARK2_THRIFTSERVER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,295 - Setting securityState for SQOOP/SQOOP on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,309 - Setting securityState for TEZ/TEZ_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,327 - Setting securityState for YARN/NODEMANAGER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,337 - Setting securityState for YARN/YARN_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,346 - Setting securityState for ZOOKEEPER/ZOOKEEPER_SERVER on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,362 - Setting securityState for ZOOKEEPER/ZOOKEEPER_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,377 - Setting securityState for KERBEROS/KERBEROS_CLIENT on host a01-r03-i164-159-515w64k.xx.local to state SECURED_KERBEROS
2018-01-04 21:35:42,393 - Processing identities...
2018-01-04 21:35:42,586 - Processing identities completed.

```



## Hive Service Check



```ini
stderr: 
None
 stdout:
2018-01-18 16:41:48,798 - MariaDB RedHat Support: false
2018-01-18 16:41:48,802 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-01-18 16:41:48,818 - call['ambari-python-wrap /usr/bin/hdp-select status hive-server2'] {'timeout': 20}
2018-01-18 16:41:48,875 - call returned (0, 'hive-server2 - 2.6.3.0-235')
2018-01-18 16:41:48,876 - Stack Feature Version Info: Cluster Stack=2.6, Command Stack=None, Command Version=2.6.3.0-235 -> 2.6.3.0-235
2018-01-18 16:41:48,924 - Running Hive Server checks
2018-01-18 16:41:48,924 - --------------------------

2018-01-18 16:41:48,926 - Server Address List : [u'a01-r03-i164-157-515w8ey.xx.local'], Port : 10000, SSL KeyStore : None
2018-01-18 16:41:48,926 - Waiting for the Hive Server to start...
2018-01-18 16:41:48,926 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/smokeuser.headless.keytab ambari-qa-pss_cloud_dev@POLARIS.xx.COM; '] {'user': 'ambari-qa'}
2018-01-18 16:41:49,027 - Execute['! beeline -u 'jdbc:hive2://a01-r03-i164-157-515w8ey.xx.local:10000/;transportMode=binary;principal=hive/_HOST@POLARIS.xx.COM'  -e '' 2>&1| awk '{print}'|grep -i -e 'Connection refused' -e 'Invalid URL''] {'path': ['/bin/', '/usr/bin/', '/usr/lib/hive/bin/', '/usr/sbin/'], 'timeout_kill_strategy': 2, 'timeout': 30, 'user': 'ambari-qa'}
2018-01-18 16:41:53,449 - Successfully connected to a01-r03-i164-157-515w8ey.xx.local on port 10000
2018-01-18 16:41:53,449 - Successfully stayed connected to 'Hive Server' on host: a01-r03-i164-154-515w92j.xx.local and port 10000 after 4.52300786972 seconds
2018-01-18 16:41:53,449 - Running HCAT checks
2018-01-18 16:41:53,450 - -------------------

2018-01-18 16:41:53,452 - checked_call['hostid'] {}
2018-01-18 16:41:53,482 - checked_call returned (0, '13ac9aa4')
2018-01-18 16:41:53,483 - File['/var/lib/ambari-agent/tmp/hcatSmoke.sh'] {'content': StaticFile('hcatSmoke.sh'), 'mode': 0755}
2018-01-18 16:41:53,486 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/smokeuser.headless.keytab ambari-qa-pss_cloud_dev@POLARIS.xx.COM; env JAVA_HOME=/export/cloud/jdk1.8.0_151 /var/lib/ambari-agent/tmp/hcatSmoke.sh hcatsmokeid13ac9aa4_date411818 prepare true'] {'logoutput': True, 'path': ['/usr/sbin', '/usr/local/bin', '/bin', '/usr/bin', u'/usr/sbin:/sbin:/usr/lib/ambari-server/*:/usr/sbin:/sbin:/usr/lib/ambari-server/*:/export/cloud/jdk1.8.0_151/bin:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/var/lib/ambari-agent:/var/lib/ambari-agent:/usr/hdp/2.6.3.0-235/hadoop/bin:/usr/hdp/2.6.3.0-235/hive/bin'], 'tries': 3, 'user': 'ambari-qa', 'try_sleep': 5}
OK
Time taken: 3.513 seconds
OK
Time taken: 1.869 seconds
OK
Time taken: 2.701 seconds
2018-01-18 16:42:12,618 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.xx.COM'] {'user': 'hdfs'}
2018-01-18 16:42:12,742 - ExecuteHadoop['fs -test -e /apps/hive/warehouse/hcatsmokeid13ac9aa4_date411818'] {'logoutput': True, 'bin_dir': '/usr/sbin:/sbin:/usr/lib/ambari-server/*:/usr/sbin:/sbin:/usr/lib/ambari-server/*:/export/cloud/jdk1.8.0_151/bin:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/var/lib/ambari-agent:/var/lib/ambari-agent:/usr/hdp/current/hive-client/bin:/usr/hdp/2.6.3.0-235/hadoop/bin', 'user': 'hdfs', 'conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf'}
2018-01-18 16:42:12,743 - Execute['hadoop --config /usr/hdp/2.6.3.0-235/hadoop/conf fs -test -e /apps/hive/warehouse/hcatsmokeid13ac9aa4_date411818'] {'logoutput': True, 'try_sleep': 0, 'environment': {}, 'tries': 1, 'user': 'hdfs', 'path': [u'/usr/sbin:/sbin:/usr/lib/ambari-server/*:/usr/sbin:/sbin:/usr/lib/ambari-server/*:/export/cloud/jdk1.8.0_151/bin:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/var/lib/ambari-agent:/var/lib/ambari-agent:/usr/hdp/current/hive-client/bin:/usr/hdp/2.6.3.0-235/hadoop/bin']}
2018-01-18 16:42:15,475 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/smokeuser.headless.keytab ambari-qa-pss_cloud_dev@POLARIS.xx.COM;  /var/lib/ambari-agent/tmp/hcatSmoke.sh hcatsmokeid13ac9aa4_date411818 cleanup true'] {'logoutput': True, 'path': ['/usr/sbin', '/usr/local/bin', '/bin', '/usr/bin', u'/usr/sbin:/sbin:/usr/lib/ambari-server/*:/usr/sbin:/sbin:/usr/lib/ambari-server/*:/export/cloud/jdk1.8.0_151/bin:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/var/lib/ambari-agent:/var/lib/ambari-agent:/usr/hdp/2.6.3.0-235/hadoop/bin:/usr/hdp/2.6.3.0-235/hive/bin'], 'tries': 3, 'user': 'ambari-qa', 'try_sleep': 5}
OK
Time taken: 2.717 seconds
2018-01-18 16:42:22,065 - Running WEBHCAT checks
2018-01-18 16:42:22,066 - ---------------------

2018-01-18 16:42:22,067 - File['/var/lib/ambari-agent/tmp/templetonSmoke.sh'] {'content': StaticFile('templetonSmoke.sh'), 'mode': 0755}
2018-01-18 16:42:22,078 - File['/var/lib/ambari-agent/tmp/idtest.ambari-qa.1516264942.07.pig'] {'owner': 'hdfs', 'content': Template('templeton_smoke.pig.j2')}
2018-01-18 16:42:22,080 - Writing File['/var/lib/ambari-agent/tmp/idtest.ambari-qa.1516264942.07.pig'] because it doesn't exist
2018-01-18 16:42:22,081 - Changing owner for /var/lib/ambari-agent/tmp/idtest.ambari-qa.1516264942.07.pig from 0 to hdfs
2018-01-18 16:42:22,082 - HdfsResource['/tmp/idtest.ambari-qa.1516264942.07.pig'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/var/lib/ambari-agent/tmp/idtest.ambari-qa.1516264942.07.pig', 'dfs_type': '', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.xx.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.xx.COM', 'user': 'hdfs', 'owner': 'ambari-qa', 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'immutable_paths': [u'/apps/falcon', u'/apps/hive/warehouse', u'/mr-history/done', u'/app-logs', u'/tmp']}
2018-01-18 16:42:22,085 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.xx.COM'] {'user': 'hdfs'}
2018-01-18 16:42:22,201 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.xx.local:50070/webhdfs/v1/tmp/idtest.ambari-qa.1516264942.07.pig?op=GETFILESTATUS'"'"' 1>/tmp/tmpO4lnUG 2>/tmp/tmpWPj095''] {'logoutput': None, 'quiet': False}
2018-01-18 16:42:22,331 - call returned (0, '')
2018-01-18 16:42:22,333 - Creating new file /tmp/idtest.ambari-qa.1516264942.07.pig in DFS
2018-01-18 16:42:22,334 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/var/lib/ambari-agent/tmp/idtest.ambari-qa.1516264942.07.pig -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.xx.local:50070/webhdfs/v1/tmp/idtest.ambari-qa.1516264942.07.pig?op=CREATE&overwrite=True'"'"' 1>/tmp/tmphBVIjy 2>/tmp/tmpB72VX1''] {'logoutput': None, 'quiet': False}
2018-01-18 16:42:23,011 - call returned (0, '')
2018-01-18 16:42:23,014 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.xx.local:50070/webhdfs/v1/tmp/idtest.ambari-qa.1516264942.07.pig?op=SETOWNER&owner=ambari-qa&group='"'"' 1>/tmp/tmpuDFzJC 2>/tmp/tmpjap_C8''] {'logoutput': None, 'quiet': False}
2018-01-18 16:42:23,150 - call returned (0, '')
2018-01-18 16:42:23,152 - HdfsResource['/tmp/idtest.ambari-qa.1516264942.07.in'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/passwd', 'dfs_type': '', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.xx.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.xx.COM', 'user': 'hdfs', 'owner': 'ambari-qa', 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'immutable_paths': [u'/apps/falcon', u'/apps/hive/warehouse', u'/mr-history/done', u'/app-logs', u'/tmp']}
2018-01-18 16:42:23,153 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.xx.COM'] {'user': 'hdfs'}
2018-01-18 16:42:23,259 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.xx.local:50070/webhdfs/v1/tmp/idtest.ambari-qa.1516264942.07.in?op=GETFILESTATUS'"'"' 1>/tmp/tmpnTfNZc 2>/tmp/tmp2cEwZC''] {'logoutput': None, 'quiet': False}
2018-01-18 16:42:23,381 - call returned (0, '')
2018-01-18 16:42:23,383 - Creating new file /tmp/idtest.ambari-qa.1516264942.07.in in DFS
2018-01-18 16:42:23,384 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/passwd -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.xx.local:50070/webhdfs/v1/tmp/idtest.ambari-qa.1516264942.07.in?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpYGHOTj 2>/tmp/tmp6jrld0''] {'logoutput': None, 'quiet': False}
2018-01-18 16:42:23,624 - call returned (0, '')
2018-01-18 16:42:23,627 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.xx.local:50070/webhdfs/v1/tmp/idtest.ambari-qa.1516264942.07.in?op=SETOWNER&owner=ambari-qa&group='"'"' 1>/tmp/tmpNLCG1P 2>/tmp/tmpEaYZLq''] {'logoutput': None, 'quiet': False}
2018-01-18 16:42:23,773 - call returned (0, '')
2018-01-18 16:42:23,775 - HdfsResource[None] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'dfs_type': '', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.xx.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.xx.COM', 'user': 'hdfs', 'action': ['execute'], 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'immutable_paths': [u'/apps/falcon', u'/apps/hive/warehouse', u'/mr-history/done', u'/app-logs', u'/tmp']}
2018-01-18 16:42:23,777 - Execute['/var/lib/ambari-agent/tmp/templetonSmoke.sh a01-r03-i164-157-515w8ey.xx.local ambari-qa 50111 idtest.ambari-qa.1516264942.07.pig /etc/security/keytabs/smokeuser.headless.keytab true /usr/bin/kinit ambari-qa-pss_cloud_dev@POLARIS.xx.COM /var/lib/ambari-agent/tmp'] {'logoutput': True, 'path': ['/usr/sbin:/sbin:/usr/local/bin:/bin:/usr/bin'], 'tries': 3, 'try_sleep': 5}
Templeton Pig Smoke Tests not run in secure mode

Command completed successfully!

```

