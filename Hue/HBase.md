### Start HBase Thrift Server

Navigate to `HBase Master` node, and start thrift server as `hbase` user:

```shell
su hbase
/usr/hdp/current/hbase-master/bin/hbase-daemon.sh start thrift
```



### HBase Proxy

>  hbase-site.xml

```xml
<property>
  <name>hbase.thrift.support.proxyuser</name>
  <value>true</value>
</property>
 
<property>
  <name>hbase.regionserver.thrift.http</name>
  <value>true</value>
</property>
```



### HDFS Proxy

> hdfs-site.xml

```xml
<property>
	<name>hadoop.proxyuser.hbase.hosts</name>
	<value>*</value>
</property>
<property>
	<name>hadoop.proxyuser.hbase.groups</name>
	<value>*</value>
</property>
```



### HUE Configuration

> pseudo-distributed.ini

```ini
###########################################################################
# Settings to configure HBase Browser
###########################################################################

[hbase]
  # Comma-separated list of HBase Thrift servers for clusters in the format of '(name|host:port)'.
  # Use full hostname. If hbase.thrift.ssl.enabled in hbase-site is set to true, https will be used otherwise it will use http
  # If using Kerberos we assume GSSAPI SASL, not PLAIN.
  hbase_clusters=(Cluster|data-thinker-4:9090)

  # HBase configuration directory, where hbase-site.xml is located.
  hbase_conf_dir=/etc/hbase/conf

  # Hard limit of rows or columns per row fetched before truncating.
  ## truncate_limit = 500

  # Should come from hbase-site.xml, do not set. 'framed' is used to chunk up responses, used with the nonblocking server in Thrift but is not supported in Hue.
  # 'buffered' used to be the default of the HBase Thrift Server. Default is buffered when not set in hbase-site.xml.
  thrift_transport=buffered

  # Choose whether Hue should validate certificates received from the server.
  ## ssl_cert_ca_verify=true
```

