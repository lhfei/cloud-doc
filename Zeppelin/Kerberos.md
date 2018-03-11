```verilog
stderr: 
None
 stdout:
2018-02-26 16:42:55,146 - Stack Feature Version Info: Cluster Stack=2.6, Command Stack=None, Command Version=2.6.3.0-235 -> 2.6.3.0-235
2018-02-26 16:42:55,162 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-26 16:42:55,517 - Stack Feature Version Info: Cluster Stack=2.6, Command Stack=None, Command Version=2.6.3.0-235 -> 2.6.3.0-235
2018-02-26 16:42:55,524 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-26 16:42:55,525 - Group['livy'] {}
2018-02-26 16:42:55,527 - Group['spark'] {}
2018-02-26 16:42:55,527 - Group['ranger'] {}
2018-02-26 16:42:55,528 - Group['hdfs'] {}
2018-02-26 16:42:55,528 - Group['zeppelin'] {}
2018-02-26 16:42:55,528 - Group['hadoop'] {}
2018-02-26 16:42:55,528 - Group['users'] {}
2018-02-26 16:42:55,529 - User['hive'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,530 - User['zookeeper'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,532 - User['ams'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,533 - User['ranger'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'ranger'], 'uid': None}
2018-02-26 16:42:55,534 - User['tez'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'users'], 'uid': None}
2018-02-26 16:42:55,535 - User['zeppelin'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'zeppelin', u'hadoop'], 'uid': None}
2018-02-26 16:42:55,536 - User['livy'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,537 - User['spark'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,538 - User['ambari-qa'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'users'], 'uid': None}
2018-02-26 16:42:55,539 - User['hdfs'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': ['hdfs'], 'uid': None}
2018-02-26 16:42:55,540 - User['yarn'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,541 - User['mapred'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,542 - User['hbase'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,543 - User['hcat'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-26 16:42:55,543 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-26 16:42:55,545 - Execute['/var/lib/ambari-agent/tmp/changeUid.sh ambari-qa /tmp/hadoop-ambari-qa,/tmp/hsperfdata_ambari-qa,/home/ambari-qa,/tmp/ambari-qa,/tmp/sqoop-ambari-qa 0'] {'not_if': '(test $(id -u ambari-qa) -gt 1000) || (false)'}
2018-02-26 16:42:55,563 - Skipping Execute['/var/lib/ambari-agent/tmp/changeUid.sh ambari-qa /tmp/hadoop-ambari-qa,/tmp/hsperfdata_ambari-qa,/home/ambari-qa,/tmp/ambari-qa,/tmp/sqoop-ambari-qa 0'] due to not_if
2018-02-26 16:42:55,563 - Directory['/tmp/hbase-hbase'] {'owner': 'hbase', 'create_parents': True, 'mode': 0775, 'cd_access': 'a'}
2018-02-26 16:42:55,564 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-26 16:42:55,566 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-26 16:42:55,567 - call['/var/lib/ambari-agent/tmp/changeUid.sh hbase'] {}
2018-02-26 16:42:55,589 - call returned (0, '1011')
2018-02-26 16:42:55,590 - Execute['/var/lib/ambari-agent/tmp/changeUid.sh hbase /home/hbase,/tmp/hbase,/usr/bin/hbase,/var/log/hbase,/tmp/hbase-hbase 1011'] {'not_if': '(test $(id -u hbase) -gt 1000) || (false)'}
2018-02-26 16:42:55,609 - Skipping Execute['/var/lib/ambari-agent/tmp/changeUid.sh hbase /home/hbase,/tmp/hbase,/usr/bin/hbase,/var/log/hbase,/tmp/hbase-hbase 1011'] due to not_if
2018-02-26 16:42:55,610 - Group['hdfs'] {}
2018-02-26 16:42:55,611 - User['hdfs'] {'fetch_nonlocal_groups': True, 'groups': ['hdfs', u'hdfs']}
2018-02-26 16:42:55,612 - FS Type: 
2018-02-26 16:42:55,612 - Directory['/etc/hadoop'] {'mode': 0755}
2018-02-26 16:42:55,642 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/hadoop-env.sh'] {'content': InlineTemplate(...), 'owner': 'root', 'group': 'hadoop'}
2018-02-26 16:42:55,643 - Directory['/var/lib/ambari-agent/tmp/hadoop_java_io_tmpdir'] {'owner': 'hdfs', 'group': 'hadoop', 'mode': 01777}
2018-02-26 16:42:55,676 - Execute[('setenforce', '0')] {'not_if': '(! which getenforce ) || (which getenforce && getenforce | grep -q Disabled)', 'sudo': True, 'only_if': 'test -f /selinux/enforce'}
2018-02-26 16:42:55,708 - Skipping Execute[('setenforce', '0')] due to not_if
2018-02-26 16:42:55,708 - Directory['/var/log/hadoop'] {'owner': 'root', 'create_parents': True, 'group': 'hadoop', 'mode': 0775, 'cd_access': 'a'}
2018-02-26 16:42:55,713 - Directory['/var/run/hadoop'] {'owner': 'root', 'create_parents': True, 'group': 'root', 'cd_access': 'a'}
2018-02-26 16:42:55,714 - Directory['/tmp/hadoop-hdfs'] {'owner': 'hdfs', 'create_parents': True, 'cd_access': 'a'}
2018-02-26 16:42:55,722 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/commons-logging.properties'] {'content': Template('commons-logging.properties.j2'), 'owner': 'root'}
2018-02-26 16:42:55,725 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/health_check'] {'content': Template('health_check.j2'), 'owner': 'root'}
2018-02-26 16:42:55,737 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/log4j.properties'] {'content': InlineTemplate(...), 'owner': 'hdfs', 'group': 'hadoop', 'mode': 0644}
2018-02-26 16:42:55,754 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/hadoop-metrics2.properties'] {'content': InlineTemplate(...), 'owner': 'hdfs', 'group': 'hadoop'}
2018-02-26 16:42:55,755 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/task-log4j.properties'] {'content': StaticFile('task-log4j.properties'), 'mode': 0755}
2018-02-26 16:42:55,757 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/configuration.xsl'] {'owner': 'hdfs', 'group': 'hadoop'}
2018-02-26 16:42:55,764 - File['/etc/hadoop/conf/topology_mappings.data'] {'owner': 'hdfs', 'content': Template('topology_mappings.data.j2'), 'only_if': 'test -d /etc/hadoop/conf', 'group': 'hadoop', 'mode': 0644}
2018-02-26 16:42:55,781 - File['/etc/hadoop/conf/topology_script.py'] {'content': StaticFile('topology_script.py'), 'only_if': 'test -d /etc/hadoop/conf', 'mode': 0755}
2018-02-26 16:42:56,346 - call['ambari-python-wrap /usr/bin/hdp-select status spark-client'] {'timeout': 20}
2018-02-26 16:42:56,409 - call returned (0, 'spark-client - 2.6.3.0-235')
2018-02-26 16:42:56,431 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-26 16:42:56,434 - Directory['/export/var/log/zeppelin'] {'owner': 'zeppelin', 'group': 'zeppelin', 'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-26 16:42:56,439 - Directory['/var/run/zeppelin'] {'owner': 'zeppelin', 'create_parents': True, 'group': 'zeppelin', 'mode': 0755, 'cd_access': 'a'}
2018-02-26 16:42:56,439 - Directory['/usr/hdp/current/zeppelin-server'] {'owner': 'zeppelin', 'group': 'zeppelin', 'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-26 16:42:56,441 - Execute[('chown', '-R', u'zeppelin:zeppelin', u'/var/run/zeppelin')] {'sudo': True}
2018-02-26 16:42:56,469 - XmlConfig['zeppelin-site.xml'] {'owner': 'zeppelin', 'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf', 'configurations': ...}
2018-02-26 16:42:56,491 - Generating config: /etc/zeppelin/conf/zeppelin-site.xml
2018-02-26 16:42:56,491 - File['/etc/zeppelin/conf/zeppelin-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': None, 'encoding': 'UTF-8'}
2018-02-26 16:42:56,532 - File['/etc/zeppelin/conf/zeppelin-env.sh'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin'}
2018-02-26 16:42:56,535 - File['/etc/zeppelin/conf/shiro.ini'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin'}
2018-02-26 16:42:56,536 - File['/etc/zeppelin/conf/log4j.properties'] {'owner': 'zeppelin', 'content': ..., 'group': 'zeppelin'}
2018-02-26 16:42:56,538 - Directory['/etc/zeppelin/conf/external-dependency-conf'] {'owner': 'zeppelin', 'group': 'zeppelin', 'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-26 16:42:56,538 - XmlConfig['hbase-site.xml'] {'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf/external-dependency-conf', 'mode': 0644, 'configuration_attributes': {}, 'owner': 'zeppelin', 'configurations': ...}
2018-02-26 16:42:56,550 - Generating config: /etc/zeppelin/conf/external-dependency-conf/hbase-site.xml
2018-02-26 16:42:56,551 - File['/etc/zeppelin/conf/external-dependency-conf/hbase-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': 0644, 'encoding': 'UTF-8'}
2018-02-26 16:42:56,602 - XmlConfig['hdfs-site.xml'] {'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf/external-dependency-conf', 'mode': 0644, 'configuration_attributes': {u'final': {u'dfs.support.append': u'true', u'dfs.datanode.data.dir': u'true', u'dfs.namenode.http-address': u'true', u'dfs.namenode.name.dir': u'true', u'dfs.webhdfs.enabled': u'true', u'dfs.datanode.failed.volumes.tolerated': u'true'}}, 'owner': 'zeppelin', 'configurations': ...}
2018-02-26 16:42:56,611 - Generating config: /etc/zeppelin/conf/external-dependency-conf/hdfs-site.xml
2018-02-26 16:42:56,612 - File['/etc/zeppelin/conf/external-dependency-conf/hdfs-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': 0644, 'encoding': 'UTF-8'}
2018-02-26 16:42:56,659 - XmlConfig['core-site.xml'] {'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf/external-dependency-conf', 'mode': 0644, 'configuration_attributes': {u'final': {u'fs.defaultFS': u'true'}}, 'owner': 'zeppelin', 'configurations': ...}
2018-02-26 16:42:56,667 - Generating config: /etc/zeppelin/conf/external-dependency-conf/core-site.xml
2018-02-26 16:42:56,668 - File['/etc/zeppelin/conf/external-dependency-conf/core-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': 0644, 'encoding': 'UTF-8'}
2018-02-26 16:42:56,693 - Execute[('chown', '-R', u'zeppelin:zeppelin', '/etc/zeppelin')] {'sudo': True}
2018-02-26 16:42:56,717 - Execute[('chown', '-R', u'zeppelin:zeppelin', u'/usr/hdp/current/zeppelin-server/notebook')] {'sudo': True}
2018-02-26 16:42:56,739 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; '] {'user': 'zeppelin'}
2018-02-26 16:42:56,831 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -d /user/zeppelin/notebook;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:42:59,416 - call returned (0, '0')
2018-02-26 16:42:59,418 - HdfsResource['/user/zeppelin'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-26 16:42:59,422 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.JD.COM'] {'user': 'hdfs'}
2018-02-26 16:42:59,546 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin?op=GETFILESTATUS'"'"' 1>/tmp/tmp7fDkj2 2>/tmp/tmpsuqqNd''] {'logoutput': None, 'quiet': False}
2018-02-26 16:42:59,676 - call returned (0, '')
2018-02-26 16:42:59,678 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp2J7CZ9 2>/tmp/tmpRq1NDm''] {'logoutput': None, 'quiet': False}
2018-02-26 16:42:59,804 - call returned (0, '')
2018-02-26 16:42:59,854 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpIADl_T 2>/tmp/tmp6ndprR''] {'logoutput': None, 'quiet': False}
2018-02-26 16:42:59,975 - call returned (0, '')
2018-02-26 16:42:59,977 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin?op=LISTSTATUS'"'"' 1>/tmp/tmpedGiU3 2>/tmp/tmpiN65yh''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,097 - call returned (0, '')
2018-02-26 16:43:00,100 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf?op=LISTSTATUS'"'"' 1>/tmp/tmpjjYer4 2>/tmp/tmplWQHts''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,220 - call returned (0, '')
2018-02-26 16:43:00,222 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook?op=LISTSTATUS'"'"' 1>/tmp/tmpG4QS1n 2>/tmp/tmpM9FaKp''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,340 - call returned (0, '')
2018-02-26 16:43:00,344 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git?op=LISTSTATUS'"'"' 1>/tmp/tmpfn4aAc 2>/tmp/tmpZuKpTi''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,471 - call returned (0, '')
2018-02-26 16:43:00,474 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/branches?op=LISTSTATUS'"'"' 1>/tmp/tmpZL7Yz5 2>/tmp/tmpnBZyQW''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,595 - call returned (0, '')
2018-02-26 16:43:00,597 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/hooks?op=LISTSTATUS'"'"' 1>/tmp/tmpbcuYvC 2>/tmp/tmppmlM2A''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,711 - call returned (0, '')
2018-02-26 16:43:00,713 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs?op=LISTSTATUS'"'"' 1>/tmp/tmp2uzC06 2>/tmp/tmpRNRkgk''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,825 - call returned (0, '')
2018-02-26 16:43:00,828 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs?op=LISTSTATUS'"'"' 1>/tmp/tmplW5eol 2>/tmp/tmpT9UMGc''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:00,931 - call returned (0, '')
2018-02-26 16:43:00,933 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs/heads?op=LISTSTATUS'"'"' 1>/tmp/tmpeHG0I2 2>/tmp/tmpR4QCBc''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,056 - call returned (0, '')
2018-02-26 16:43:01,058 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects?op=LISTSTATUS'"'"' 1>/tmp/tmprGQhzo 2>/tmp/tmp7Aqpbg''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,179 - call returned (0, '')
2018-02-26 16:43:01,181 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/info?op=LISTSTATUS'"'"' 1>/tmp/tmpOlzj6Q 2>/tmp/tmp5IQDV0''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,292 - call returned (0, '')
2018-02-26 16:43:01,294 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/pack?op=LISTSTATUS'"'"' 1>/tmp/tmpwLYjlU 2>/tmp/tmpnu80XH''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,403 - call returned (0, '')
2018-02-26 16:43:01,405 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs?op=LISTSTATUS'"'"' 1>/tmp/tmpG7iF84 2>/tmp/tmpCpABwi''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,523 - call returned (0, '')
2018-02-26 16:43:01,525 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/heads?op=LISTSTATUS'"'"' 1>/tmp/tmpd_Bo8p 2>/tmp/tmptzuxwo''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,643 - call returned (0, '')
2018-02-26 16:43:01,645 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/tags?op=LISTSTATUS'"'"' 1>/tmp/tmppt5Q_V 2>/tmp/tmp9xhzCt''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,759 - call returned (0, '')
2018-02-26 16:43:01,761 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z?op=LISTSTATUS'"'"' 1>/tmp/tmpMU06gU 2>/tmp/tmp7Xx8xb''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,874 - call returned (0, '')
2018-02-26 16:43:01,876 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ?op=LISTSTATUS'"'"' 1>/tmp/tmpW1WCb9 2>/tmp/tmp_E7btU''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:01,990 - call returned (0, '')
2018-02-26 16:43:01,992 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK?op=LISTSTATUS'"'"' 1>/tmp/tmpgYB9rc 2>/tmp/tmpAsEZUy''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,102 - call returned (0, '')
2018-02-26 16:43:02,104 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H?op=LISTSTATUS'"'"' 1>/tmp/tmph86jS1 2>/tmp/tmp0M1CwI''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,219 - call returned (0, '')
2018-02-26 16:43:02,221 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77?op=LISTSTATUS'"'"' 1>/tmp/tmpcbAu7F 2>/tmp/tmpQ5tS9_''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,334 - call returned (0, '')
2018-02-26 16:43:02,336 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA?op=LISTSTATUS'"'"' 1>/tmp/tmpuPaI35 2>/tmp/tmp2ZsZ9O''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,454 - call returned (0, '')
2018-02-26 16:43:02,456 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7?op=LISTSTATUS'"'"' 1>/tmp/tmpvC7dPZ 2>/tmp/tmpg70apk''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,569 - call returned (0, '')
2018-02-26 16:43:02,571 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14?op=LISTSTATUS'"'"' 1>/tmp/tmptBTETt 2>/tmp/tmpPfQKnm''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,685 - call returned (0, '')
2018-02-26 16:43:02,688 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY?op=LISTSTATUS'"'"' 1>/tmp/tmp8ThE4E 2>/tmp/tmppunRdq''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,811 - call returned (0, '')
2018-02-26 16:43:02,813 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/test?op=LISTSTATUS'"'"' 1>/tmp/tmpW_91N1 2>/tmp/tmpcF5K2f''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:02,936 - call returned (0, '')
2018-02-26 16:43:02,938 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpNN6_i0 2>/tmp/tmp1zjMgo''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,073 - call returned (0, '')
2018-02-26 16:43:03,076 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpras2NC 2>/tmp/tmpaULRdl''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,200 - call returned (0, '')
2018-02-26 16:43:03,202 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp9N8BJN 2>/tmp/tmpbEqrD2''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,324 - call returned (0, '')
2018-02-26 16:43:03,326 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpg1H3Go 2>/tmp/tmpl3Ft4o''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,451 - call returned (0, '')
2018-02-26 16:43:03,454 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/HEAD?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp0YbbAT 2>/tmp/tmp8i1v2s''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,576 - call returned (0, '')
2018-02-26 16:43:03,578 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/branches?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpV0EU9Y 2>/tmp/tmpDZOd_I''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,696 - call returned (0, '')
2018-02-26 16:43:03,698 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/config?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpDSaRZB 2>/tmp/tmpnCG3tH''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,822 - call returned (0, '')
2018-02-26 16:43:03,823 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/hooks?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpmXYBd8 2>/tmp/tmpvEVw5T''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:03,935 - call returned (0, '')
2018-02-26 16:43:03,938 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmphruF1y 2>/tmp/tmpBM7aYC''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,055 - call returned (0, '')
2018-02-26 16:43:04,058 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpCoBQ_5 2>/tmp/tmpOeE7ll''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,188 - call returned (0, '')
2018-02-26 16:43:04,190 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs/heads?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpDVkUbh 2>/tmp/tmpVWSsvC''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,324 - call returned (0, '')
2018-02-26 16:43:04,327 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpSfHZTZ 2>/tmp/tmpYLvZ2g''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,456 - call returned (0, '')
2018-02-26 16:43:04,459 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/info?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpaAMp_B 2>/tmp/tmpVPa0PG''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,588 - call returned (0, '')
2018-02-26 16:43:04,591 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/pack?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpNzcL5w 2>/tmp/tmpZ0bblp''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,714 - call returned (0, '')
2018-02-26 16:43:04,716 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpU9kl3r 2>/tmp/tmpPiEx4I''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,839 - call returned (0, '')
2018-02-26 16:43:04,841 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/heads?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp0UalfM 2>/tmp/tmpqPt0at''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:04,960 - call returned (0, '')
2018-02-26 16:43:04,962 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/tags?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpLk2TBi 2>/tmp/tmpvIPEnG''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,097 - call returned (0, '')
2018-02-26 16:43:05,099 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpXefQPb 2>/tmp/tmpmQZFEA''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,234 - call returned (0, '')
2018-02-26 16:43:05,236 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpTQJ1Lb 2>/tmp/tmpbUJYFq''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,360 - call returned (0, '')
2018-02-26 16:43:05,362 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpuzYyuv 2>/tmp/tmp10iwgf''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,481 - call returned (0, '')
2018-02-26 16:43:05,483 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpyhcuYV 2>/tmp/tmp0lc2Bw''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,600 - call returned (0, '')
2018-02-26 16:43:05,602 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpaCHTEK 2>/tmp/tmpx_Hzqd''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,732 - call returned (0, '')
2018-02-26 16:43:05,734 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp650N8W 2>/tmp/tmpZPMJlb''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,858 - call returned (0, '')
2018-02-26 16:43:05,860 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpDBOzsZ 2>/tmp/tmpjqEDCD''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:05,984 - call returned (0, '')
2018-02-26 16:43:05,986 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpvcSf6N 2>/tmp/tmp9Uj1jw''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,114 - call returned (0, '')
2018-02-26 16:43:06,116 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpdT3mYg 2>/tmp/tmpVwSf2I''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,235 - call returned (0, '')
2018-02-26 16:43:06,237 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp_5EJgE 2>/tmp/tmp6BsEWB''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,355 - call returned (0, '')
2018-02-26 16:43:06,357 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpA5tmj6 2>/tmp/tmpvhtp_Y''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,474 - call returned (0, '')
2018-02-26 16:43:06,477 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp28j9nd 2>/tmp/tmp_BDi5Z''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,594 - call returned (0, '')
2018-02-26 16:43:06,596 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpXNoD8w 2>/tmp/tmpAUFiSD''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,732 - call returned (0, '')
2018-02-26 16:43:06,734 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpntVAF6 2>/tmp/tmpsooD4Y''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,858 - call returned (0, '')
2018-02-26 16:43:06,860 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp3wC1zr 2>/tmp/tmp6qdKOr''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:06,978 - call returned (0, '')
2018-02-26 16:43:06,980 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmplCjw1R 2>/tmp/tmpS7JI7l''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:07,097 - call returned (0, '')
2018-02-26 16:43:07,099 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpQcr58C 2>/tmp/tmpU2CRDP''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:07,229 - call returned (0, '')
2018-02-26 16:43:07,231 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpSzoQNR 2>/tmp/tmpzYVhZA''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:07,349 - call returned (0, '')
2018-02-26 16:43:07,351 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/test?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpINgj2i 2>/tmp/tmpXeB4zp''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:07,469 - call returned (0, '')
2018-02-26 16:43:07,471 - HdfsResource['/user/zeppelin/test'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-26 16:43:07,471 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.JD.COM'] {'user': 'hdfs'}
2018-02-26 16:43:07,572 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/test?op=GETFILESTATUS'"'"' 1>/tmp/tmprDc9wj 2>/tmp/tmpl8NW1F''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:07,684 - call returned (0, '')
2018-02-26 16:43:07,686 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/test?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpGEp0JR 2>/tmp/tmpFafHWG''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:07,804 - call returned (0, '')
2018-02-26 16:43:07,806 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/test?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpGqgvrr 2>/tmp/tmpXehCyv''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:07,919 - call returned (0, '')
2018-02-26 16:43:07,921 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/test?op=LISTSTATUS'"'"' 1>/tmp/tmpeuWY7a 2>/tmp/tmpljRtZk''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:08,027 - call returned (0, '')
2018-02-26 16:43:08,029 - HdfsResource['/apps/zeppelin'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-26 16:43:08,030 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.JD.COM'] {'user': 'hdfs'}
2018-02-26 16:43:08,142 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/apps/zeppelin?op=GETFILESTATUS'"'"' 1>/tmp/tmpWZdpTs 2>/tmp/tmpn5n_dv''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:08,255 - call returned (0, '')
2018-02-26 16:43:08,257 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/apps/zeppelin?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpH0ApVY 2>/tmp/tmpnqBmSj''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:08,379 - call returned (0, '')
2018-02-26 16:43:08,381 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/apps/zeppelin?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpdTEdIf 2>/tmp/tmpsIP4Xq''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:08,504 - call returned (0, '')
2018-02-26 16:43:08,507 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/apps/zeppelin?op=LISTSTATUS'"'"' 1>/tmp/tmpUCdXba 2>/tmp/tmpvttReT''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:08,620 - call returned (0, '')
2018-02-26 16:43:08,622 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp3C2YgX 2>/tmp/tmpBVoRw_''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:08,732 - call returned (0, '')
2018-02-26 16:43:08,734 - HdfsResource['/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/usr/hdp/current/zeppelin-server/interpreter/spark/dep/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'group': 'zeppelin', 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'mode': 0444}
2018-02-26 16:43:08,735 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.JD.COM'] {'user': 'hdfs'}
2018-02-26 16:43:08,847 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar?op=GETFILESTATUS'"'"' 1>/tmp/tmpYtTzhg 2>/tmp/tmpPBOf3Q''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:08,975 - call returned (0, '')
2018-02-26 16:43:08,976 - DFS file /apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar is identical to /usr/hdp/current/zeppelin-server/interpreter/spark/dep/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar, skipping the copying
2018-02-26 16:43:08,977 - HdfsResource[None] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'action': ['execute'], 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf'}
2018-02-26 16:43:08,978 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -d /user/zeppelin/conf;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:43:11,698 - call returned (0, '0')
2018-02-26 16:43:11,703 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:43:14,410 - call returned (0, '0')
2018-02-26 16:43:14,411 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -z /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:43:17,039 - call returned (0, '1')
2018-02-26 16:43:17,040 - call['rm /etc/zeppelin/conf/interpreter.json;/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -get /user/zeppelin/conf/interpreter.json /etc/zeppelin/conf/interpreter.json'] {'user': 'zeppelin'}
2018-02-26 16:43:20,043 - call returned (0, '')
2018-02-26 16:43:20,048 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-26 16:43:20,049 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-26 16:43:20,049 - Changing group for /etc/zeppelin/conf/interpreter.json from 1006 to zeppelin
2018-02-26 16:43:20,051 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-26 16:43:20,051 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.JD.COM'] {'user': 'hdfs'}
2018-02-26 16:43:20,170 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpp5MrDd 2>/tmp/tmpUhEd4a''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:20,297 - call returned (0, '')
2018-02-26 16:43:20,298 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-26 16:43:20,300 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmprTbCBQ 2>/tmp/tmptKQL2J''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:20,475 - call returned (0, '')
2018-02-26 16:43:20,477 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpfJm76V 2>/tmp/tmpF6JFyH''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:20,612 - call returned (0, '')
2018-02-26 16:43:20,614 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmps0tN2_ 2>/tmp/tmprRHWFe''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:20,740 - call returned (0, '')
2018-02-26 16:43:20,742 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmp3gt7HW 2>/tmp/tmp_MdOwi''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:20,872 - call returned (0, '')
2018-02-26 16:43:20,874 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:43:23,595 - call returned (0, '0')
2018-02-26 16:43:23,596 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -z /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:43:26,479 - call returned (0, '1')
2018-02-26 16:43:26,484 - call['rm /etc/zeppelin/conf/interpreter.json;/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -get /user/zeppelin/conf/interpreter.json /etc/zeppelin/conf/interpreter.json'] {'user': 'zeppelin'}
2018-02-26 16:43:29,314 - call returned (0, '')
2018-02-26 16:43:29,321 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-26 16:43:29,321 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-26 16:43:29,323 - Changing group for /etc/zeppelin/conf/interpreter.json from 1006 to zeppelin
2018-02-26 16:43:29,324 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-26 16:43:29,325 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.JD.COM'] {'user': 'hdfs'}
2018-02-26 16:43:29,449 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmp4mMZeh 2>/tmp/tmpaRyWRh''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:29,571 - call returned (0, '')
2018-02-26 16:43:29,573 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-26 16:43:29,575 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpxPAFHw 2>/tmp/tmpx7zPHB''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:29,870 - call returned (0, '')
2018-02-26 16:43:29,996 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpx736Ob 2>/tmp/tmppoUVCL''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:30,115 - call returned (0, '')
2018-02-26 16:43:30,117 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpYsYRWh 2>/tmp/tmpOaJbVC''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:30,236 - call returned (0, '')
2018-02-26 16:43:30,238 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmpaLDoxs 2>/tmp/tmpimU8iw''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:30,360 - call returned (0, '')
2018-02-26 16:43:30,362 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:43:32,909 - call returned (0, '0')
2018-02-26 16:43:32,912 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -z /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-26 16:43:35,578 - call returned (0, '1')
2018-02-26 16:43:35,581 - call['rm /etc/zeppelin/conf/interpreter.json;/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.JD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -get /user/zeppelin/conf/interpreter.json /etc/zeppelin/conf/interpreter.json'] {'user': 'zeppelin'}
2018-02-26 16:43:38,184 - call returned (0, '')
2018-02-26 16:43:38,187 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-26 16:43:38,187 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-26 16:43:38,188 - Changing group for /etc/zeppelin/conf/interpreter.json from 1006 to zeppelin
2018-02-26 16:43:38,189 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.jd.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.JD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-26 16:43:38,189 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.JD.COM'] {'user': 'hdfs'}
2018-02-26 16:43:38,296 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpk8aI3O 2>/tmp/tmpTUjgaO''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:38,424 - call returned (0, '')
2018-02-26 16:43:38,425 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-26 16:43:38,426 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpdrjODY 2>/tmp/tmpr3_OBJ''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:38,601 - call returned (0, '')
2018-02-26 16:43:38,604 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp9_IilN 2>/tmp/tmpcDaK5n''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:38,737 - call returned (0, '')
2018-02-26 16:43:38,739 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmp_CIz10 2>/tmp/tmpY2XVah''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:38,858 - call returned (0, '')
2018-02-26 16:43:38,860 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.jd.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmpkVXpBt 2>/tmp/tmpwBu076''] {'logoutput': None, 'quiet': False}
2018-02-26 16:43:38,974 - call returned (0, '')
2018-02-26 16:43:38,976 - Execute['/usr/hdp/current/zeppelin-server/bin/zeppelin-daemon.sh restart >> /export/var/log/zeppelin/zeppelin-setup.log'] {'user': 'zeppelin'}
2018-02-26 16:43:41,324 - Pid file is: /var/run/zeppelin/zeppelin-zeppelin-a01-r03-i164-159-515w64k.jd.local.pid

Command completed successfully!

```

