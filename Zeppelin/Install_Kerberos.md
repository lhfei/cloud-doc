



Zeppelin Notebook Install

```
stderr: 
None
 stdout:
2018-02-08 18:11:03,239 - Stack Feature Version Info: Cluster Stack=2.6, Command Stack=None, Command Version=None -> 2.6
2018-02-08 18:11:03,246 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:11:03,247 - Group['livy'] {}
2018-02-08 18:11:03,248 - Group['spark'] {}
2018-02-08 18:11:03,249 - Group['ranger'] {}
2018-02-08 18:11:03,249 - Group['hdfs'] {}
2018-02-08 18:11:03,249 - Group['zeppelin'] {}
2018-02-08 18:11:03,249 - Group['hadoop'] {}
2018-02-08 18:11:03,250 - Group['users'] {}
2018-02-08 18:11:03,250 - User['hive'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,252 - User['zookeeper'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,253 - User['ams'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,254 - User['ranger'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'ranger'], 'uid': None}
2018-02-08 18:11:03,255 - User['tez'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'users'], 'uid': None}
2018-02-08 18:11:03,256 - User['zeppelin'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'zeppelin', u'hadoop'], 'uid': None}
2018-02-08 18:11:03,257 - User['livy'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,258 - User['spark'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,259 - User['ambari-qa'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'users'], 'uid': None}
2018-02-08 18:11:03,260 - User['hdfs'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': ['hdfs'], 'uid': None}
2018-02-08 18:11:03,261 - User['yarn'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,262 - User['mapred'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,263 - User['hbase'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,264 - User['hcat'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:11:03,265 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-08 18:11:03,267 - Execute['/var/lib/ambari-agent/tmp/changeUid.sh ambari-qa /tmp/hadoop-ambari-qa,/tmp/hsperfdata_ambari-qa,/home/ambari-qa,/tmp/ambari-qa,/tmp/sqoop-ambari-qa 0'] {'not_if': '(test $(id -u ambari-qa) -gt 1000) || (false)'}
2018-02-08 18:11:03,294 - Skipping Execute['/var/lib/ambari-agent/tmp/changeUid.sh ambari-qa /tmp/hadoop-ambari-qa,/tmp/hsperfdata_ambari-qa,/home/ambari-qa,/tmp/ambari-qa,/tmp/sqoop-ambari-qa 0'] due to not_if
2018-02-08 18:11:03,295 - Directory['/tmp/hbase-hbase'] {'owner': 'hbase', 'create_parents': True, 'mode': 0775, 'cd_access': 'a'}
2018-02-08 18:11:03,297 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-08 18:11:03,299 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-08 18:11:03,301 - call['/var/lib/ambari-agent/tmp/changeUid.sh hbase'] {}
2018-02-08 18:11:03,323 - call returned (0, '1011')
2018-02-08 18:11:03,324 - Execute['/var/lib/ambari-agent/tmp/changeUid.sh hbase /home/hbase,/tmp/hbase,/usr/bin/hbase,/var/log/hbase,/tmp/hbase-hbase 1011'] {'not_if': '(test $(id -u hbase) -gt 1000) || (false)'}
2018-02-08 18:11:03,351 - Skipping Execute['/var/lib/ambari-agent/tmp/changeUid.sh hbase /home/hbase,/tmp/hbase,/usr/bin/hbase,/var/log/hbase,/tmp/hbase-hbase 1011'] due to not_if
2018-02-08 18:11:03,352 - Group['hdfs'] {}
2018-02-08 18:11:03,352 - User['hdfs'] {'fetch_nonlocal_groups': True, 'groups': ['hdfs', u'hdfs']}
2018-02-08 18:11:03,354 - FS Type: 
2018-02-08 18:11:03,354 - Directory['/etc/hadoop'] {'mode': 0755}
2018-02-08 18:11:03,385 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/hadoop-env.sh'] {'content': InlineTemplate(...), 'owner': 'root', 'group': 'hadoop'}
2018-02-08 18:11:03,386 - Directory['/var/lib/ambari-agent/tmp/hadoop_java_io_tmpdir'] {'owner': 'hdfs', 'group': 'hadoop', 'mode': 01777}
2018-02-08 18:11:03,414 - Repository['HDP-2.6-repo-1'] {'append_to_file': False, 'base_url': 'http://a01-r03-i164-156-515w9ay.test.local/HDP/centos7/2.6.3.0-235', 'action': ['create'], 'components': [u'HDP', 'main'], 'repo_template': '[{{repo_id}}]\nname={{repo_id}}\n{% if mirror_list %}mirrorlist={{mirror_list}}{% else %}baseurl={{base_url}}{% endif %}\n\npath=/\nenabled=1\ngpgcheck=0', 'repo_file_name': 'ambari-hdp-1', 'mirror_list': None}
2018-02-08 18:11:03,427 - File['/etc/yum.repos.d/ambari-hdp-1.repo'] {'content': '[HDP-2.6-repo-1]\nname=HDP-2.6-repo-1\nbaseurl=http://a01-r03-i164-156-515w9ay.test.local/HDP/centos7/2.6.3.0-235\n\npath=/\nenabled=1\ngpgcheck=0'}
2018-02-08 18:11:03,428 - Writing File['/etc/yum.repos.d/ambari-hdp-1.repo'] because contents don't match
2018-02-08 18:11:03,429 - Repository['HDP-UTILS-1.1.0.21-repo-1'] {'append_to_file': True, 'base_url': 'http://a01-r03-i164-156-515w9ay.test.local/HDP-UTILS-1.1.0.21', 'action': ['create'], 'components': [u'HDP-UTILS', 'main'], 'repo_template': '[{{repo_id}}]\nname={{repo_id}}\n{% if mirror_list %}mirrorlist={{mirror_list}}{% else %}baseurl={{base_url}}{% endif %}\n\npath=/\nenabled=1\ngpgcheck=0', 'repo_file_name': 'ambari-hdp-1', 'mirror_list': None}
2018-02-08 18:11:03,434 - File['/etc/yum.repos.d/ambari-hdp-1.repo'] {'content': '[HDP-2.6-repo-1]\nname=HDP-2.6-repo-1\nbaseurl=http://a01-r03-i164-156-515w9ay.test.local/HDP/centos7/2.6.3.0-235\n\npath=/\nenabled=1\ngpgcheck=0\n[HDP-UTILS-1.1.0.21-repo-1]\nname=HDP-UTILS-1.1.0.21-repo-1\nbaseurl=http://a01-r03-i164-156-515w9ay.test.local/HDP-UTILS-1.1.0.21\n\npath=/\nenabled=1\ngpgcheck=0'}
2018-02-08 18:11:03,434 - Writing File['/etc/yum.repos.d/ambari-hdp-1.repo'] because contents don't match
2018-02-08 18:11:03,440 - Package['unzip'] {'retry_on_repo_unavailability': False, 'retry_count': 5}
2018-02-08 18:11:03,572 - Skipping installation of existing package unzip
2018-02-08 18:11:03,572 - Package['curl'] {'retry_on_repo_unavailability': False, 'retry_count': 5}
2018-02-08 18:11:03,584 - Skipping installation of existing package curl
2018-02-08 18:11:03,585 - Package['hdp-select'] {'retry_on_repo_unavailability': False, 'retry_count': 5}
2018-02-08 18:11:03,597 - Skipping installation of existing package hdp-select
2018-02-08 18:11:03,602 - The repository with version 2.6.3.0-235 for this command has been marked as resolved. It will be used to report the version of the component which was installed
2018-02-08 18:11:03,985 - call['ambari-python-wrap /usr/bin/hdp-select status spark-client'] {'timeout': 20}
2018-02-08 18:11:04,028 - call returned (0, 'spark-client - 2.6.3.0-235')
2018-02-08 18:11:04,050 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:11:04,052 - Command repositories: HDP-2.6-repo-1, HDP-UTILS-1.1.0.21-repo-1
2018-02-08 18:11:04,052 - Applicable repositories: HDP-2.6-repo-1, HDP-UTILS-1.1.0.21-repo-1
2018-02-08 18:11:04,054 - Looking for matching packages in the following repositories: HDP-2.6-repo-1, HDP-UTILS-1.1.0.21-repo-1
2018-02-08 18:11:05,661 - Adding fallback repositories: HDP-UTILS-1.1.0.21, HDP-2.6.3.0
2018-02-08 18:11:07,268 - Package['zeppelin_2_6_3_0_235'] {'retry_on_repo_unavailability': False, 'retry_count': 5}
2018-02-08 18:11:07,350 - Installing package zeppelin_2_6_3_0_235 ('/usr/bin/yum -d 0 -e 0 -y install zeppelin_2_6_3_0_235')
2018-02-08 18:12:22,792 - Directory['/var/log/zeppelin'] {'owner': 'zeppelin', 'group': 'zeppelin', 'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-08 18:12:22,794 - Execute['echo spark2_version:2.2 detected for spark2_home: /usr/hdp/current/spark2-client >> /var/log/zeppelin/zeppelin-setup.log'] {'user': 'zeppelin'}
2018-02-08 18:12:22,918 - The repository with version 2.6.3.0-235 for this command has been marked as resolved. It will be used to report the version of the component which was installed
2018-02-08 18:12:23,359 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:12:23,419 - Execute[('ambari-python-wrap', u'/usr/bin/hdp-select', 'set', u'zeppelin-server', u'2.6.3.0-235')] {'sudo': True}
2018-02-08 18:12:23,485 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:12:23,486 - After ('ambari-python-wrap', u'/usr/bin/hdp-select', 'set', u'zeppelin-server', u'2.6.3.0-235'), reloaded module params
2018-02-08 18:12:23,486 - FS Type: 
2018-02-08 18:12:23,487 - XmlConfig['core-site.xml'] {'group': 'hadoop', 'conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'configuration_attributes': {u'final': {u'fs.defaultFS': u'true'}}, 'owner': 'hdfs', 'only_if': 'ls /usr/hdp/2.6.3.0-235/hadoop/conf', 'configurations': ...}
2018-02-08 18:12:23,525 - Generating config: /usr/hdp/2.6.3.0-235/hadoop/conf/core-site.xml
2018-02-08 18:12:23,526 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/core-site.xml'] {'owner': 'hdfs', 'content': InlineTemplate(...), 'group': 'hadoop', 'mode': None, 'encoding': 'UTF-8'}
2018-02-08 18:12:23,566 - Writing File['/usr/hdp/2.6.3.0-235/hadoop/conf/core-site.xml'] because contents don't match
2018-02-08 18:12:23,580 - Skipping the conf-select tool on nifi since /etc/nifi/conf does not exist.
2018-02-08 18:12:23,580 - Skipping the conf-select tool on ranger-kms since /etc/ranger/kms/conf does not exist.
2018-02-08 18:12:23,580 - Skipping the conf-select tool on hive2 since /etc/hive2/conf does not exist.
2018-02-08 18:12:23,580 - Skipping the conf-select tool on hive-hcatalog since /etc/hive-webhcat/conf does not exist.
2018-02-08 18:12:23,580 - Skipping the conf-select tool on pig since /etc/pig/conf does not exist.
2018-02-08 18:12:23,585 - Checking to see which directories will be created for tez on version 2.6.3.0-235
2018-02-08 18:12:23,586 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'dry-run-create', '--package', u'tez', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:23,640 - call returned (0, '/etc/tez/2.6.3.0-235/0', '')
2018-02-08 18:12:23,650 - Creating /etc/tez/2.6.3.0-235/0 if it does not exist
2018-02-08 18:12:23,651 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'create-conf-dir', '--package', u'tez', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:23,709 - call returned (1, '/etc/tez/2.6.3.0-235/0 exist already', '')
2018-02-08 18:12:23,710 - checked_call[('ambari-python-wrap', u'/usr/bin/conf-select', 'set-conf-dir', '--package', u'tez', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False}
2018-02-08 18:12:23,771 - checked_call returned (0, '')
2018-02-08 18:12:23,771 - /etc/tez/conf is already linked to /usr/hdp/current/tez-client/conf
2018-02-08 18:12:23,771 - Skipping the conf-select tool on kafka since /etc/kafka/conf does not exist.
2018-02-08 18:12:23,777 - Checking to see which directories will be created for hbase on version 2.6.3.0-235
2018-02-08 18:12:23,778 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'dry-run-create', '--package', u'hbase', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:23,837 - call returned (0, '/etc/hbase/2.6.3.0-235/0', '')
2018-02-08 18:12:23,848 - Creating /etc/hbase/2.6.3.0-235/0 if it does not exist
2018-02-08 18:12:23,848 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'create-conf-dir', '--package', u'hbase', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:23,885 - call returned (1, '/etc/hbase/2.6.3.0-235/0 exist already', '')
2018-02-08 18:12:23,886 - checked_call[('ambari-python-wrap', u'/usr/bin/conf-select', 'set-conf-dir', '--package', u'hbase', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False}
2018-02-08 18:12:23,934 - checked_call returned (0, '')
2018-02-08 18:12:23,935 - /etc/hbase/conf is already linked to /usr/hdp/current/hbase-client/conf
2018-02-08 18:12:23,941 - Checking to see which directories will be created for spark on version 2.6.3.0-235
2018-02-08 18:12:23,941 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'dry-run-create', '--package', u'spark', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:23,989 - call returned (0, '/etc/spark/2.6.3.0-235/0', '')
2018-02-08 18:12:23,989 - Package spark will have the following new configuration directories created: /etc/spark/2.6.3.0-235/0
2018-02-08 18:12:24,001 - Creating /etc/spark/2.6.3.0-235/0 if it does not exist
2018-02-08 18:12:24,002 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'create-conf-dir', '--package', u'spark', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,057 - call returned (0, '/etc/spark/2.6.3.0-235/0', '')
2018-02-08 18:12:24,057 - Directory['/etc/spark/2.6.3.0-235/0'] {'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-08 18:12:24,069 - Seeding versioned configuration directories for spark
2018-02-08 18:12:24,069 - Execute['ambari-sudo.sh  -H -E cp -R -p -v /usr/hdp/current/spark-client/conf/* /etc/spark/2.6.3.0-235/0'] {'logoutput': True}
'/usr/hdp/current/spark-client/conf/docker.properties.template' -> '/etc/spark/2.6.3.0-235/0/docker.properties.template'
'/usr/hdp/current/spark-client/conf/fairscheduler.xml.template' -> '/etc/spark/2.6.3.0-235/0/fairscheduler.xml.template'
'/usr/hdp/current/spark-client/conf/log4j.properties.template' -> '/etc/spark/2.6.3.0-235/0/log4j.properties.template'
'/usr/hdp/current/spark-client/conf/metrics.properties.template' -> '/etc/spark/2.6.3.0-235/0/metrics.properties.template'
'/usr/hdp/current/spark-client/conf/slaves.template' -> '/etc/spark/2.6.3.0-235/0/slaves.template'
'/usr/hdp/current/spark-client/conf/spark-defaults.conf' -> '/etc/spark/2.6.3.0-235/0/spark-defaults.conf'
'/usr/hdp/current/spark-client/conf/spark-defaults.conf.template' -> '/etc/spark/2.6.3.0-235/0/spark-defaults.conf.template'
'/usr/hdp/current/spark-client/conf/spark-env.sh' -> '/etc/spark/2.6.3.0-235/0/spark-env.sh'
'/usr/hdp/current/spark-client/conf/spark-env.sh.template' -> '/etc/spark/2.6.3.0-235/0/spark-env.sh.template'
2018-02-08 18:12:24,089 - checked_call[('ambari-python-wrap', u'/usr/bin/conf-select', 'set-conf-dir', '--package', u'spark', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False}
2018-02-08 18:12:24,134 - checked_call returned (0, '/usr/hdp/2.6.3.0-235/spark/conf -> /etc/spark/2.6.3.0-235/0')
2018-02-08 18:12:24,134 - /etc/spark/conf is a directory - it must be converted into a symlink
2018-02-08 18:12:24,135 - Backing up /etc/spark/conf to /etc/spark/conf.backup if destination doesn't exist already.
2018-02-08 18:12:24,135 - Execute[('cp', '-R', '-p', u'/etc/spark/conf', u'/etc/spark/conf.backup')] {'not_if': 'test -e /etc/spark/conf.backup', 'sudo': True}
2018-02-08 18:12:24,172 - Directory['/etc/spark/conf'] {'action': ['delete']}
2018-02-08 18:12:24,173 - Removing directory Directory['/etc/spark/conf'] and all its content
2018-02-08 18:12:24,174 - Link['/etc/spark/conf'] {'to': '/usr/hdp/current/spark-client/conf'}
2018-02-08 18:12:24,174 - Creating symbolic Link['/etc/spark/conf'] to /usr/hdp/current/spark-client/conf
2018-02-08 18:12:24,174 - Skipping the conf-select tool on ranger-tagsync since /etc/ranger/tagsync/conf does not exist.
2018-02-08 18:12:24,175 - Skipping the conf-select tool on superset since /etc/druid-superset/conf does not exist.
2018-02-08 18:12:24,181 - Checking to see which directories will be created for hadoop on version 2.6.3.0-235
2018-02-08 18:12:24,181 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'dry-run-create', '--package', u'hadoop', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,225 - call returned (0, '/etc/hadoop/2.6.3.0-235/0', '')
2018-02-08 18:12:24,237 - Creating /etc/hadoop/2.6.3.0-235/0 if it does not exist
2018-02-08 18:12:24,237 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'create-conf-dir', '--package', u'hadoop', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,291 - call returned (1, '/etc/hadoop/2.6.3.0-235/0 exist already', '')
2018-02-08 18:12:24,292 - checked_call[('ambari-python-wrap', u'/usr/bin/conf-select', 'set-conf-dir', '--package', u'hadoop', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False}
2018-02-08 18:12:24,343 - checked_call returned (0, '')
2018-02-08 18:12:24,343 - /etc/hadoop/conf is already linked to /usr/hdp/current/hadoop-client/conf
2018-02-08 18:12:24,344 - Skipping the conf-select tool on mahout since /etc/mahout/conf does not exist.
2018-02-08 18:12:24,344 - Skipping the conf-select tool on storm since /etc/storm/conf does not exist.
2018-02-08 18:12:24,344 - Skipping the conf-select tool on atlas since /etc/atlas/conf does not exist.
2018-02-08 18:12:24,344 - Skipping the conf-select tool on ranger-admin since /etc/ranger/admin/conf does not exist.
2018-02-08 18:12:24,345 - Skipping the conf-select tool on flume since /etc/flume/conf does not exist.
2018-02-08 18:12:24,345 - Skipping the conf-select tool on sqoop since /etc/sqoop/conf does not exist.
2018-02-08 18:12:24,345 - Skipping the conf-select tool on accumulo since /etc/accumulo/conf does not exist.
2018-02-08 18:12:24,345 - Skipping the conf-select tool on phoenix since /etc/phoenix/conf does not exist.
2018-02-08 18:12:24,345 - Skipping the conf-select tool on storm-slider-client since /etc/storm-slider-client/conf does not exist.
2018-02-08 18:12:24,345 - Skipping the conf-select tool on druid since /etc/druid/conf does not exist.
2018-02-08 18:12:24,346 - Skipping the conf-select tool on slider since /etc/slider/conf does not exist.
2018-02-08 18:12:24,352 - Checking to see which directories will be created for zeppelin on version 2.6.3.0-235
2018-02-08 18:12:24,352 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'dry-run-create', '--package', u'zeppelin', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,404 - call returned (0, '/etc/zeppelin/2.6.3.0-235/0', '')
2018-02-08 18:12:24,404 - Package zeppelin will have the following new configuration directories created: /etc/zeppelin/2.6.3.0-235/0
2018-02-08 18:12:24,416 - Creating /etc/zeppelin/2.6.3.0-235/0 if it does not exist
2018-02-08 18:12:24,416 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'create-conf-dir', '--package', u'zeppelin', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,455 - call returned (0, '/etc/zeppelin/2.6.3.0-235/0', '')
2018-02-08 18:12:24,455 - Directory['/etc/zeppelin/2.6.3.0-235/0'] {'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-08 18:12:24,463 - Seeding versioned configuration directories for zeppelin
2018-02-08 18:12:24,463 - Execute['ambari-sudo.sh  -H -E cp -R -p -v /usr/hdp/current/zeppelin-server/conf/* /etc/zeppelin/2.6.3.0-235/0'] {'logoutput': True}
'/usr/hdp/current/zeppelin-server/conf/configuration.xsl' -> '/etc/zeppelin/2.6.3.0-235/0/configuration.xsl'
'/usr/hdp/current/zeppelin-server/conf/interpreter-list' -> '/etc/zeppelin/2.6.3.0-235/0/interpreter-list'
'/usr/hdp/current/zeppelin-server/conf/log4j.properties' -> '/etc/zeppelin/2.6.3.0-235/0/log4j.properties'
'/usr/hdp/current/zeppelin-server/conf/shiro.ini.template' -> '/etc/zeppelin/2.6.3.0-235/0/shiro.ini.template'
'/usr/hdp/current/zeppelin-server/conf/zeppelin-env.cmd.template' -> '/etc/zeppelin/2.6.3.0-235/0/zeppelin-env.cmd.template'
'/usr/hdp/current/zeppelin-server/conf/zeppelin-env.sh' -> '/etc/zeppelin/2.6.3.0-235/0/zeppelin-env.sh'
'/usr/hdp/current/zeppelin-server/conf/zeppelin-env.sh.template' -> '/etc/zeppelin/2.6.3.0-235/0/zeppelin-env.sh.template'
'/usr/hdp/current/zeppelin-server/conf/zeppelin-site.xml.template' -> '/etc/zeppelin/2.6.3.0-235/0/zeppelin-site.xml.template'
2018-02-08 18:12:24,481 - checked_call[('ambari-python-wrap', u'/usr/bin/conf-select', 'set-conf-dir', '--package', u'zeppelin', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False}
2018-02-08 18:12:24,544 - checked_call returned (0, '/usr/hdp/2.6.3.0-235/zeppelin/conf -> /etc/zeppelin/2.6.3.0-235/0')
2018-02-08 18:12:24,544 - /etc/zeppelin/conf is a directory - it must be converted into a symlink
2018-02-08 18:12:24,544 - Backing up /etc/zeppelin/conf to /etc/zeppelin/conf.backup if destination doesn't exist already.
2018-02-08 18:12:24,545 - Execute[('cp', '-R', '-p', u'/etc/zeppelin/conf', u'/etc/zeppelin/conf.backup')] {'not_if': 'test -e /etc/zeppelin/conf.backup', 'sudo': True}
2018-02-08 18:12:24,578 - Directory['/etc/zeppelin/conf'] {'action': ['delete']}
2018-02-08 18:12:24,578 - Removing directory Directory['/etc/zeppelin/conf'] and all its content
2018-02-08 18:12:24,579 - Link['/etc/zeppelin/conf'] {'to': '/usr/hdp/current/zeppelin-server/conf'}
2018-02-08 18:12:24,580 - Creating symbolic Link['/etc/zeppelin/conf'] to /usr/hdp/current/zeppelin-server/conf
2018-02-08 18:12:24,580 - Skipping the conf-select tool on oozie since /etc/oozie/conf does not exist.
2018-02-08 18:12:24,580 - Skipping the conf-select tool on falcon since /etc/falcon/conf does not exist.
2018-02-08 18:12:24,581 - Skipping the conf-select tool on knox since /etc/knox/conf does not exist.
2018-02-08 18:12:24,581 - Skipping the conf-select tool on ranger-usersync since /etc/ranger/usersync/conf does not exist.
2018-02-08 18:12:24,587 - Checking to see which directories will be created for spark2 on version 2.6.3.0-235
2018-02-08 18:12:24,587 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'dry-run-create', '--package', u'spark2', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,634 - call returned (0, '/etc/spark2/2.6.3.0-235/0', '')
2018-02-08 18:12:24,645 - Creating /etc/spark2/2.6.3.0-235/0 if it does not exist
2018-02-08 18:12:24,645 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'create-conf-dir', '--package', u'spark2', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,690 - call returned (1, '/etc/spark2/2.6.3.0-235/0 exist already', '')
2018-02-08 18:12:24,691 - checked_call[('ambari-python-wrap', u'/usr/bin/conf-select', 'set-conf-dir', '--package', u'spark2', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False}
2018-02-08 18:12:24,738 - checked_call returned (0, '')
2018-02-08 18:12:24,739 - /etc/spark2/conf is already linked to /usr/hdp/current/spark2-client/conf
2018-02-08 18:12:24,739 - Skipping the conf-select tool on hive since /etc/hive/conf does not exist.
2018-02-08 18:12:24,745 - Checking to see which directories will be created for zookeeper on version 2.6.3.0-235
2018-02-08 18:12:24,746 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'dry-run-create', '--package', u'zookeeper', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,794 - call returned (0, '/etc/zookeeper/2.6.3.0-235/0', '')
2018-02-08 18:12:24,805 - Creating /etc/zookeeper/2.6.3.0-235/0 if it does not exist
2018-02-08 18:12:24,805 - call[('ambari-python-wrap', u'/usr/bin/conf-select', 'create-conf-dir', '--package', u'zookeeper', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False, 'stderr': -1}
2018-02-08 18:12:24,843 - call returned (1, '/etc/zookeeper/2.6.3.0-235/0 exist already', '')
2018-02-08 18:12:24,843 - checked_call[('ambari-python-wrap', u'/usr/bin/conf-select', 'set-conf-dir', '--package', u'zookeeper', '--stack-version', u'2.6.3.0-235', '--conf-version', '0')] {'logoutput': False, 'sudo': True, 'quiet': False}
2018-02-08 18:12:24,891 - checked_call returned (0, '')
2018-02-08 18:12:24,891 - /etc/zookeeper/conf is already linked to /usr/hdp/current/zookeeper-client/conf
2018-02-08 18:12:24,898 - The repository with version 2.6.3.0-235 for this command has been marked as resolved. It will be used to report the version of the component which was installed

Command completed successfully!

```



Set Keytab: Kerberos Client

```
stderr: 
None
 stdout:
2018-02-08 18:12:32,438 - Directory['/etc/security/keytabs'] {'owner': 'root', 'create_parents': True, 'group': 'root', 'mode': 0755}
2018-02-08 18:12:32,440 - File['/etc/security/keytabs/zeppelin.server.kerberos.keytab'] {'owner': 'zeppelin', 'content': <lambda>, 'group': 'hadoop', 'mode': 0400}
2018-02-08 18:12:32,448 - Writing File['/etc/security/keytabs/zeppelin.server.kerberos.keytab'] because contents don't match

Command completed successfully!

```



Zeppelin Notebook Start

```
stderr: 
None
 stdout:
2018-02-08 18:12:38,559 - Stack Feature Version Info: Cluster Stack=2.6, Command Stack=None, Command Version=2.6.3.0-235 -> 2.6.3.0-235
2018-02-08 18:12:38,581 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:12:38,754 - Stack Feature Version Info: Cluster Stack=2.6, Command Stack=None, Command Version=2.6.3.0-235 -> 2.6.3.0-235
2018-02-08 18:12:38,760 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:12:38,761 - Group['livy'] {}
2018-02-08 18:12:38,762 - Group['spark'] {}
2018-02-08 18:12:38,763 - Group['ranger'] {}
2018-02-08 18:12:38,763 - Group['hdfs'] {}
2018-02-08 18:12:38,764 - Group['zeppelin'] {}
2018-02-08 18:12:38,764 - Group['hadoop'] {}
2018-02-08 18:12:38,764 - Group['users'] {}
2018-02-08 18:12:38,766 - User['hive'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,767 - User['zookeeper'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,768 - User['ams'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,769 - User['ranger'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'ranger'], 'uid': None}
2018-02-08 18:12:38,770 - User['tez'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'users'], 'uid': None}
2018-02-08 18:12:38,771 - User['zeppelin'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'zeppelin', u'hadoop'], 'uid': None}
2018-02-08 18:12:38,772 - User['livy'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,773 - User['spark'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,774 - User['ambari-qa'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'users'], 'uid': None}
2018-02-08 18:12:38,774 - User['hdfs'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': ['hdfs'], 'uid': None}
2018-02-08 18:12:38,775 - User['yarn'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,776 - User['mapred'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,777 - User['hbase'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,778 - User['hcat'] {'gid': 'hadoop', 'fetch_nonlocal_groups': True, 'groups': [u'hadoop'], 'uid': None}
2018-02-08 18:12:38,779 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-08 18:12:38,780 - Execute['/var/lib/ambari-agent/tmp/changeUid.sh ambari-qa /tmp/hadoop-ambari-qa,/tmp/hsperfdata_ambari-qa,/home/ambari-qa,/tmp/ambari-qa,/tmp/sqoop-ambari-qa 0'] {'not_if': '(test $(id -u ambari-qa) -gt 1000) || (false)'}
2018-02-08 18:12:38,808 - Skipping Execute['/var/lib/ambari-agent/tmp/changeUid.sh ambari-qa /tmp/hadoop-ambari-qa,/tmp/hsperfdata_ambari-qa,/home/ambari-qa,/tmp/ambari-qa,/tmp/sqoop-ambari-qa 0'] due to not_if
2018-02-08 18:12:38,809 - Directory['/tmp/hbase-hbase'] {'owner': 'hbase', 'create_parents': True, 'mode': 0775, 'cd_access': 'a'}
2018-02-08 18:12:38,811 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-08 18:12:38,813 - File['/var/lib/ambari-agent/tmp/changeUid.sh'] {'content': StaticFile('changeToSecureUid.sh'), 'mode': 0555}
2018-02-08 18:12:38,815 - call['/var/lib/ambari-agent/tmp/changeUid.sh hbase'] {}
2018-02-08 18:12:38,837 - call returned (0, '1011')
2018-02-08 18:12:38,837 - Execute['/var/lib/ambari-agent/tmp/changeUid.sh hbase /home/hbase,/tmp/hbase,/usr/bin/hbase,/var/log/hbase,/tmp/hbase-hbase 1011'] {'not_if': '(test $(id -u hbase) -gt 1000) || (false)'}
2018-02-08 18:12:38,856 - Skipping Execute['/var/lib/ambari-agent/tmp/changeUid.sh hbase /home/hbase,/tmp/hbase,/usr/bin/hbase,/var/log/hbase,/tmp/hbase-hbase 1011'] due to not_if
2018-02-08 18:12:38,857 - Group['hdfs'] {}
2018-02-08 18:12:38,857 - User['hdfs'] {'fetch_nonlocal_groups': True, 'groups': ['hdfs', u'hdfs']}
2018-02-08 18:12:38,858 - FS Type: 
2018-02-08 18:12:38,859 - Directory['/etc/hadoop'] {'mode': 0755}
2018-02-08 18:12:38,880 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/hadoop-env.sh'] {'content': InlineTemplate(...), 'owner': 'root', 'group': 'hadoop'}
2018-02-08 18:12:38,880 - Directory['/var/lib/ambari-agent/tmp/hadoop_java_io_tmpdir'] {'owner': 'hdfs', 'group': 'hadoop', 'mode': 01777}
2018-02-08 18:12:38,899 - Execute[('setenforce', '0')] {'not_if': '(! which getenforce ) || (which getenforce && getenforce | grep -q Disabled)', 'sudo': True, 'only_if': 'test -f /selinux/enforce'}
2018-02-08 18:12:38,931 - Skipping Execute[('setenforce', '0')] due to not_if
2018-02-08 18:12:38,931 - Directory['/var/log/hadoop'] {'owner': 'root', 'create_parents': True, 'group': 'hadoop', 'mode': 0775, 'cd_access': 'a'}
2018-02-08 18:12:38,936 - Directory['/var/run/hadoop'] {'owner': 'root', 'create_parents': True, 'group': 'root', 'cd_access': 'a'}
2018-02-08 18:12:38,936 - Directory['/tmp/hadoop-hdfs'] {'owner': 'hdfs', 'create_parents': True, 'cd_access': 'a'}
2018-02-08 18:12:38,944 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/commons-logging.properties'] {'content': Template('commons-logging.properties.j2'), 'owner': 'root'}
2018-02-08 18:12:38,947 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/health_check'] {'content': Template('health_check.j2'), 'owner': 'root'}
2018-02-08 18:12:38,958 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/log4j.properties'] {'content': InlineTemplate(...), 'owner': 'hdfs', 'group': 'hadoop', 'mode': 0644}
2018-02-08 18:12:38,976 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/hadoop-metrics2.properties'] {'content': InlineTemplate(...), 'owner': 'hdfs', 'group': 'hadoop'}
2018-02-08 18:12:38,977 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/task-log4j.properties'] {'content': StaticFile('task-log4j.properties'), 'mode': 0755}
2018-02-08 18:12:38,978 - File['/usr/hdp/2.6.3.0-235/hadoop/conf/configuration.xsl'] {'owner': 'hdfs', 'group': 'hadoop'}
2018-02-08 18:12:38,986 - File['/etc/hadoop/conf/topology_mappings.data'] {'owner': 'hdfs', 'content': Template('topology_mappings.data.j2'), 'only_if': 'test -d /etc/hadoop/conf', 'group': 'hadoop', 'mode': 0644}
2018-02-08 18:12:39,003 - File['/etc/hadoop/conf/topology_script.py'] {'content': StaticFile('topology_script.py'), 'only_if': 'test -d /etc/hadoop/conf', 'mode': 0755}
2018-02-08 18:12:39,399 - call['ambari-python-wrap /usr/bin/hdp-select status spark-client'] {'timeout': 20}
2018-02-08 18:12:39,441 - call returned (0, 'spark-client - 2.6.3.0-235')
2018-02-08 18:12:39,457 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:12:39,463 - Directory['/var/log/zeppelin'] {'owner': 'zeppelin', 'group': 'zeppelin', 'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-08 18:12:39,466 - Directory['/var/run/zeppelin'] {'owner': 'zeppelin', 'create_parents': True, 'group': 'zeppelin', 'mode': 0755, 'cd_access': 'a'}
2018-02-08 18:12:39,467 - Directory['/usr/hdp/current/zeppelin-server'] {'owner': 'zeppelin', 'group': 'zeppelin', 'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-08 18:12:39,470 - Execute[('chown', '-R', u'zeppelin:zeppelin', u'/var/run/zeppelin')] {'sudo': True}
2018-02-08 18:12:39,493 - XmlConfig['zeppelin-site.xml'] {'owner': 'zeppelin', 'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf', 'configurations': ...}
2018-02-08 18:12:39,516 - Generating config: /etc/zeppelin/conf/zeppelin-site.xml
2018-02-08 18:12:39,517 - File['/etc/zeppelin/conf/zeppelin-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': None, 'encoding': 'UTF-8'}
2018-02-08 18:12:39,549 - Writing File['/etc/zeppelin/conf/zeppelin-site.xml'] because it doesn't exist
2018-02-08 18:12:39,549 - Changing owner for /etc/zeppelin/conf/zeppelin-site.xml from 0 to zeppelin
2018-02-08 18:12:39,549 - Changing group for /etc/zeppelin/conf/zeppelin-site.xml from 0 to zeppelin
2018-02-08 18:12:39,557 - File['/etc/zeppelin/conf/zeppelin-env.sh'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin'}
2018-02-08 18:12:39,557 - Writing File['/etc/zeppelin/conf/zeppelin-env.sh'] because contents don't match
2018-02-08 18:12:39,560 - File['/etc/zeppelin/conf/shiro.ini'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin'}
2018-02-08 18:12:39,561 - Writing File['/etc/zeppelin/conf/shiro.ini'] because it doesn't exist
2018-02-08 18:12:39,561 - Changing owner for /etc/zeppelin/conf/shiro.ini from 0 to zeppelin
2018-02-08 18:12:39,561 - Changing group for /etc/zeppelin/conf/shiro.ini from 0 to zeppelin
2018-02-08 18:12:39,562 - File['/etc/zeppelin/conf/log4j.properties'] {'owner': 'zeppelin', 'content': ..., 'group': 'zeppelin'}
2018-02-08 18:12:39,562 - Writing File['/etc/zeppelin/conf/log4j.properties'] because contents don't match
2018-02-08 18:12:39,564 - Directory['/etc/zeppelin/conf/external-dependency-conf'] {'owner': 'zeppelin', 'group': 'zeppelin', 'create_parents': True, 'mode': 0755, 'cd_access': 'a'}
2018-02-08 18:12:39,564 - Creating directory Directory['/etc/zeppelin/conf/external-dependency-conf'] since it doesn't exist.
2018-02-08 18:12:39,564 - Changing owner for /etc/zeppelin/conf/external-dependency-conf from 0 to zeppelin
2018-02-08 18:12:39,564 - Changing group for /etc/zeppelin/conf/external-dependency-conf from 0 to zeppelin
2018-02-08 18:12:39,565 - XmlConfig['hbase-site.xml'] {'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf/external-dependency-conf', 'mode': 0644, 'configuration_attributes': {}, 'owner': 'zeppelin', 'configurations': ...}
2018-02-08 18:12:39,577 - Generating config: /etc/zeppelin/conf/external-dependency-conf/hbase-site.xml
2018-02-08 18:12:39,578 - File['/etc/zeppelin/conf/external-dependency-conf/hbase-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': 0644, 'encoding': 'UTF-8'}
2018-02-08 18:12:39,628 - Writing File['/etc/zeppelin/conf/external-dependency-conf/hbase-site.xml'] because it doesn't exist
2018-02-08 18:12:39,629 - Changing owner for /etc/zeppelin/conf/external-dependency-conf/hbase-site.xml from 0 to zeppelin
2018-02-08 18:12:39,629 - Changing group for /etc/zeppelin/conf/external-dependency-conf/hbase-site.xml from 0 to zeppelin
2018-02-08 18:12:39,629 - XmlConfig['hdfs-site.xml'] {'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf/external-dependency-conf', 'mode': 0644, 'configuration_attributes': {u'final': {u'dfs.support.append': u'true', u'dfs.datanode.data.dir': u'true', u'dfs.namenode.http-address': u'true', u'dfs.namenode.name.dir': u'true', u'dfs.webhdfs.enabled': u'true', u'dfs.datanode.failed.volumes.tolerated': u'true'}}, 'owner': 'zeppelin', 'configurations': ...}
2018-02-08 18:12:39,638 - Generating config: /etc/zeppelin/conf/external-dependency-conf/hdfs-site.xml
2018-02-08 18:12:39,639 - File['/etc/zeppelin/conf/external-dependency-conf/hdfs-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': 0644, 'encoding': 'UTF-8'}
2018-02-08 18:12:39,686 - Writing File['/etc/zeppelin/conf/external-dependency-conf/hdfs-site.xml'] because it doesn't exist
2018-02-08 18:12:39,687 - Changing owner for /etc/zeppelin/conf/external-dependency-conf/hdfs-site.xml from 0 to zeppelin
2018-02-08 18:12:39,687 - Changing group for /etc/zeppelin/conf/external-dependency-conf/hdfs-site.xml from 0 to zeppelin
2018-02-08 18:12:39,687 - XmlConfig['core-site.xml'] {'group': 'zeppelin', 'conf_dir': '/etc/zeppelin/conf/external-dependency-conf', 'mode': 0644, 'configuration_attributes': {u'final': {u'fs.defaultFS': u'true'}}, 'owner': 'zeppelin', 'configurations': ...}
2018-02-08 18:12:39,695 - Generating config: /etc/zeppelin/conf/external-dependency-conf/core-site.xml
2018-02-08 18:12:39,695 - File['/etc/zeppelin/conf/external-dependency-conf/core-site.xml'] {'owner': 'zeppelin', 'content': InlineTemplate(...), 'group': 'zeppelin', 'mode': 0644, 'encoding': 'UTF-8'}
2018-02-08 18:12:39,721 - Writing File['/etc/zeppelin/conf/external-dependency-conf/core-site.xml'] because it doesn't exist
2018-02-08 18:12:39,721 - Changing owner for /etc/zeppelin/conf/external-dependency-conf/core-site.xml from 0 to zeppelin
2018-02-08 18:12:39,722 - Changing group for /etc/zeppelin/conf/external-dependency-conf/core-site.xml from 0 to zeppelin
2018-02-08 18:12:39,722 - Execute[('chown', '-R', u'zeppelin:zeppelin', '/etc/zeppelin')] {'sudo': True}
2018-02-08 18:12:39,743 - Execute[('chown', '-R', u'zeppelin:zeppelin', u'/usr/hdp/current/zeppelin-server/notebook')] {'sudo': True}
2018-02-08 18:12:39,779 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; '] {'user': 'zeppelin'}
2018-02-08 18:12:39,872 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -d /user/zeppelin/notebook;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:12:42,579 - call returned (0, '1')
2018-02-08 18:12:42,581 - HdfsResource['/user/zeppelin/notebook'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:12:42,585 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:12:42,701 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=GETFILESTATUS'"'"' 1>/tmp/tmpdvkynh 2>/tmp/tmp4lB_qc''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:42,825 - call returned (0, '')
2018-02-08 18:12:42,827 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=MKDIRS'"'"' 1>/tmp/tmpqMeL9V 2>/tmp/tmpn9Ik0N''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:42,962 - call returned (0, '')
2018-02-08 18:12:42,964 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpqTRZa9 2>/tmp/tmpTLBsS6''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:43,093 - call returned (0, '')
2018-02-08 18:12:43,095 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpZmG2ig 2>/tmp/tmpnNzxo4''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:43,224 - call returned (0, '')
2018-02-08 18:12:43,227 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=LISTSTATUS'"'"' 1>/tmp/tmpYl_UMr 2>/tmp/tmp5R7PmV''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:43,349 - call returned (0, '')
2018-02-08 18:12:43,351 - HdfsResource['/user/zeppelin/notebook'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/usr/hdp/current/zeppelin-server/notebook', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:12:43,352 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:12:43,469 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=GETFILESTATUS'"'"' 1>/tmp/tmp2hg7m3 2>/tmp/tmpSq4g6x''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:43,594 - call returned (0, '')
2018-02-08 18:12:43,596 - Creating DFS directory /user/zeppelin/notebook/.git
2018-02-08 18:12:43,597 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git?op=MKDIRS'"'"' 1>/tmp/tmp33adAK 2>/tmp/tmp7gFmWk''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:43,728 - call returned (0, '')
2018-02-08 18:12:43,729 - Creating DFS directory /user/zeppelin/notebook/.git/refs
2018-02-08 18:12:43,730 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs?op=MKDIRS'"'"' 1>/tmp/tmpSS59AH 2>/tmp/tmpDd2CD0''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:43,853 - call returned (0, '')
2018-02-08 18:12:43,855 - Creating DFS directory /user/zeppelin/notebook/.git/refs/heads
2018-02-08 18:12:43,856 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/heads?op=MKDIRS'"'"' 1>/tmp/tmpSvQg4p 2>/tmp/tmp7HMVML''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:43,986 - call returned (0, '')
2018-02-08 18:12:43,987 - Creating DFS directory /user/zeppelin/notebook/.git/refs/tags
2018-02-08 18:12:43,988 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/tags?op=MKDIRS'"'"' 1>/tmp/tmpe5qs2j 2>/tmp/tmp2aeNan''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,111 - call returned (0, '')
2018-02-08 18:12:44,112 - Creating DFS directory /user/zeppelin/notebook/.git/logs
2018-02-08 18:12:44,113 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs?op=MKDIRS'"'"' 1>/tmp/tmpoN9FXY 2>/tmp/tmpeHze79''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,231 - call returned (0, '')
2018-02-08 18:12:44,232 - Creating DFS directory /user/zeppelin/notebook/.git/logs/refs
2018-02-08 18:12:44,233 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs?op=MKDIRS'"'"' 1>/tmp/tmpv4BzwQ 2>/tmp/tmp4tkxzi''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,350 - call returned (0, '')
2018-02-08 18:12:44,351 - Creating DFS directory /user/zeppelin/notebook/.git/logs/refs/heads
2018-02-08 18:12:44,353 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs/heads?op=MKDIRS'"'"' 1>/tmp/tmp1D0ivo 2>/tmp/tmpp3vafc''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,458 - call returned (0, '')
2018-02-08 18:12:44,460 - Creating DFS directory /user/zeppelin/notebook/.git/objects
2018-02-08 18:12:44,461 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects?op=MKDIRS'"'"' 1>/tmp/tmpjdJ0PF 2>/tmp/tmp1EF2N7''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,578 - call returned (0, '')
2018-02-08 18:12:44,580 - Creating DFS directory /user/zeppelin/notebook/.git/objects/info
2018-02-08 18:12:44,581 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/info?op=MKDIRS'"'"' 1>/tmp/tmpKh96sW 2>/tmp/tmpjyG8K8''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,698 - call returned (0, '')
2018-02-08 18:12:44,699 - Creating DFS directory /user/zeppelin/notebook/.git/objects/pack
2018-02-08 18:12:44,700 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/pack?op=MKDIRS'"'"' 1>/tmp/tmpjCIRsP 2>/tmp/tmp4svOSk''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,824 - call returned (0, '')
2018-02-08 18:12:44,825 - Creating DFS directory /user/zeppelin/notebook/.git/branches
2018-02-08 18:12:44,826 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/branches?op=MKDIRS'"'"' 1>/tmp/tmpizFk91 2>/tmp/tmp_Ig5gU''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:44,937 - call returned (0, '')
2018-02-08 18:12:44,938 - Creating DFS directory /user/zeppelin/notebook/.git/hooks
2018-02-08 18:12:44,939 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/hooks?op=MKDIRS'"'"' 1>/tmp/tmprerRAL 2>/tmp/tmpRr6VfW''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:45,069 - call returned (0, '')
2018-02-08 18:12:45,071 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/HEAD?op=GETFILESTATUS'"'"' 1>/tmp/tmpT0O4ec 2>/tmp/tmp1IQ8b8''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:45,200 - call returned (0, '')
2018-02-08 18:12:45,201 - Creating new file /user/zeppelin/notebook/.git/HEAD in DFS
2018-02-08 18:12:45,202 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/.git/HEAD -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/HEAD?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpTRGGs4 2>/tmp/tmpGbdaA3''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:45,936 - call returned (0, '')
2018-02-08 18:12:45,938 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/config?op=GETFILESTATUS'"'"' 1>/tmp/tmpha6Uv6 2>/tmp/tmp9s8qFI''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:46,063 - call returned (0, '')
2018-02-08 18:12:46,065 - Creating new file /user/zeppelin/notebook/.git/config in DFS
2018-02-08 18:12:46,066 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/.git/config -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/config?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpGEcro0 2>/tmp/tmp0rlZkk''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:46,256 - call returned (0, '')
2018-02-08 18:12:46,257 - Creating DFS directory /user/zeppelin/notebook/2A94M5J1Z
2018-02-08 18:12:46,258 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z?op=MKDIRS'"'"' 1>/tmp/tmpNaC57R 2>/tmp/tmpEyfRdQ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:46,392 - call returned (0, '')
2018-02-08 18:12:46,395 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpFRmbW6 2>/tmp/tmp7tPOF1''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:46,575 - call returned (0, '')
2018-02-08 18:12:46,583 - Creating new file /user/zeppelin/notebook/2A94M5J1Z/note.json in DFS
2018-02-08 18:12:46,597 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2A94M5J1Z/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmp7GsUgl 2>/tmp/tmp7dBXXP''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:47,010 - call returned (0, '')
2018-02-08 18:12:47,011 - Creating DFS directory /user/zeppelin/notebook/2BWJFTXKJ
2018-02-08 18:12:47,012 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ?op=MKDIRS'"'"' 1>/tmp/tmpVJauht 2>/tmp/tmp14yPvU''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:47,135 - call returned (0, '')
2018-02-08 18:12:47,137 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpeoB7ay 2>/tmp/tmpkRYE6j''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:47,270 - call returned (0, '')
2018-02-08 18:12:47,271 - Creating new file /user/zeppelin/notebook/2BWJFTXKJ/note.json in DFS
2018-02-08 18:12:47,272 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2BWJFTXKJ/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpbWaw4q 2>/tmp/tmpmGntsL''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:47,861 - call returned (0, '')
2018-02-08 18:12:47,862 - Creating DFS directory /user/zeppelin/notebook/2C174C9EK
2018-02-08 18:12:47,863 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK?op=MKDIRS'"'"' 1>/tmp/tmpeyziwv 2>/tmp/tmp5qpfQ_''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:47,998 - call returned (0, '')
2018-02-08 18:12:48,000 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpfCPLHN 2>/tmp/tmpi1AEvK''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:48,125 - call returned (0, '')
2018-02-08 18:12:48,126 - Creating new file /user/zeppelin/notebook/2C174C9EK/note.json in DFS
2018-02-08 18:12:48,128 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2C174C9EK/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmprCQ_nm 2>/tmp/tmp_vgV2H''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:48,339 - call returned (0, '')
2018-02-08 18:12:48,341 - Creating DFS directory /user/zeppelin/notebook/2C23PDD5H
2018-02-08 18:12:48,342 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H?op=MKDIRS'"'"' 1>/tmp/tmp8Hb56b 2>/tmp/tmpPw1g_F''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:48,477 - call returned (0, '')
2018-02-08 18:12:48,479 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpO8BOD0 2>/tmp/tmpO1uG1T''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:48,598 - call returned (0, '')
2018-02-08 18:12:48,599 - Creating new file /user/zeppelin/notebook/2C23PDD5H/note.json in DFS
2018-02-08 18:12:48,600 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2C23PDD5H/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpAzqnUJ 2>/tmp/tmp2jK7ml''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:48,800 - call returned (0, '')
2018-02-08 18:12:48,801 - Creating DFS directory /user/zeppelin/notebook/2CA587K77
2018-02-08 18:12:48,802 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77?op=MKDIRS'"'"' 1>/tmp/tmpUGJ74X 2>/tmp/tmp9I_6Df''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:48,931 - call returned (0, '')
2018-02-08 18:12:48,934 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmppSJX0A 2>/tmp/tmp_SFKLx''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:49,046 - call returned (0, '')
2018-02-08 18:12:49,047 - Creating new file /user/zeppelin/notebook/2CA587K77/note.json in DFS
2018-02-08 18:12:49,048 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2CA587K77/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpl0dDHW 2>/tmp/tmpC4qdDu''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:49,231 - call returned (0, '')
2018-02-08 18:12:49,233 - Creating DFS directory /user/zeppelin/notebook/2CAX5JCTA
2018-02-08 18:12:49,234 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA?op=MKDIRS'"'"' 1>/tmp/tmpvkxf0Y 2>/tmp/tmp4sDFmj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:49,368 - call returned (0, '')
2018-02-08 18:12:49,371 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpZyR4BF 2>/tmp/tmp_tsxEx''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:49,483 - call returned (0, '')
2018-02-08 18:12:49,484 - Creating new file /user/zeppelin/notebook/2CAX5JCTA/note.json in DFS
2018-02-08 18:12:49,485 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2CAX5JCTA/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpOgtabP 2>/tmp/tmpxmjxhj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:49,657 - call returned (0, '')
2018-02-08 18:12:49,658 - Creating DFS directory /user/zeppelin/notebook/2CBPZJDB7
2018-02-08 18:12:49,659 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7?op=MKDIRS'"'"' 1>/tmp/tmp5coDJ5 2>/tmp/tmpWJGiJQ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:49,782 - call returned (0, '')
2018-02-08 18:12:49,784 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpDpIFTL 2>/tmp/tmpNrj3FV''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:49,915 - call returned (0, '')
2018-02-08 18:12:49,916 - Creating new file /user/zeppelin/notebook/2CBPZJDB7/note.json in DFS
2018-02-08 18:12:49,918 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2CBPZJDB7/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmptakrng 2>/tmp/tmptejL9D''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:50,100 - call returned (0, '')
2018-02-08 18:12:50,102 - Creating DFS directory /user/zeppelin/notebook/2CBTZPY14
2018-02-08 18:12:50,103 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14?op=MKDIRS'"'"' 1>/tmp/tmpVSTIMs 2>/tmp/tmp9pckLD''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:50,237 - call returned (0, '')
2018-02-08 18:12:50,239 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmp8sQvH0 2>/tmp/tmpfqMpPG''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:50,369 - call returned (0, '')
2018-02-08 18:12:50,371 - Creating new file /user/zeppelin/notebook/2CBTZPY14/note.json in DFS
2018-02-08 18:12:50,372 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2CBTZPY14/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpjVzFXT 2>/tmp/tmp0i3H_B''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:50,543 - call returned (0, '')
2018-02-08 18:12:50,545 - Creating DFS directory /user/zeppelin/notebook/2CCBNZ5YY
2018-02-08 18:12:50,546 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY?op=MKDIRS'"'"' 1>/tmp/tmp_BpC5Z 2>/tmp/tmpg8d6y0''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:50,680 - call returned (0, '')
2018-02-08 18:12:50,683 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY/note.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpZjV1IB 2>/tmp/tmp1ZVTfF''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:50,807 - call returned (0, '')
2018-02-08 18:12:50,808 - Creating new file /user/zeppelin/notebook/2CCBNZ5YY/note.json in DFS
2018-02-08 18:12:50,809 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/notebook/2CCBNZ5YY/note.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY/note.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpXNNgGX 2>/tmp/tmpESCOiI''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:50,992 - call returned (0, '')
2018-02-08 18:12:50,994 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpXgnypF 2>/tmp/tmp3jXBpY''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:51,123 - call returned (0, '')
2018-02-08 18:12:51,125 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpHDQz_W 2>/tmp/tmplPIyPY''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:51,256 - call returned (0, '')
2018-02-08 18:12:51,258 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=LISTSTATUS'"'"' 1>/tmp/tmpzgiYTL 2>/tmp/tmp32F1Kj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:51,379 - call returned (0, '')
2018-02-08 18:12:51,383 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git?op=LISTSTATUS'"'"' 1>/tmp/tmpGtPg9s 2>/tmp/tmpx4rvmw''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:51,514 - call returned (0, '')
2018-02-08 18:12:51,517 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/branches?op=LISTSTATUS'"'"' 1>/tmp/tmpDB2Dgj 2>/tmp/tmpz1FeY9''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:51,638 - call returned (0, '')
2018-02-08 18:12:51,640 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/hooks?op=LISTSTATUS'"'"' 1>/tmp/tmpAIreNd 2>/tmp/tmp2JMl0S''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:51,768 - call returned (0, '')
2018-02-08 18:12:51,770 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs?op=LISTSTATUS'"'"' 1>/tmp/tmpMljsZb 2>/tmp/tmppBcrkN''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:51,889 - call returned (0, '')
2018-02-08 18:12:51,891 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs?op=LISTSTATUS'"'"' 1>/tmp/tmpnyNJyM 2>/tmp/tmpDk386_''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:52,093 - call returned (0, '')
2018-02-08 18:12:52,100 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs/heads?op=LISTSTATUS'"'"' 1>/tmp/tmp0yUUqV 2>/tmp/tmpgVafWR''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:52,284 - call returned (0, '')
2018-02-08 18:12:52,286 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects?op=LISTSTATUS'"'"' 1>/tmp/tmpF7yFy6 2>/tmp/tmpRXuwcZ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:52,404 - call returned (0, '')
2018-02-08 18:12:52,406 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/info?op=LISTSTATUS'"'"' 1>/tmp/tmpey9lwE 2>/tmp/tmpAJONzZ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:52,534 - call returned (0, '')
2018-02-08 18:12:52,536 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/pack?op=LISTSTATUS'"'"' 1>/tmp/tmpJEy6qu 2>/tmp/tmpfdGaWt''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:52,665 - call returned (0, '')
2018-02-08 18:12:52,667 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs?op=LISTSTATUS'"'"' 1>/tmp/tmplPhaUG 2>/tmp/tmpz8ZL7F''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:52,783 - call returned (0, '')
2018-02-08 18:12:52,785 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/heads?op=LISTSTATUS'"'"' 1>/tmp/tmpzJ1Tl7 2>/tmp/tmp6TyTOO''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:52,914 - call returned (0, '')
2018-02-08 18:12:52,916 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/tags?op=LISTSTATUS'"'"' 1>/tmp/tmpDECnHP 2>/tmp/tmpoML1XX''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,042 - call returned (0, '')
2018-02-08 18:12:53,044 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z?op=LISTSTATUS'"'"' 1>/tmp/tmpU6uXsU 2>/tmp/tmpi2QGuM''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,158 - call returned (0, '')
2018-02-08 18:12:53,160 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ?op=LISTSTATUS'"'"' 1>/tmp/tmp5I8zyn 2>/tmp/tmpDh4qUe''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,278 - call returned (0, '')
2018-02-08 18:12:53,280 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK?op=LISTSTATUS'"'"' 1>/tmp/tmpWwI5tV 2>/tmp/tmpCezrHb''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,409 - call returned (0, '')
2018-02-08 18:12:53,412 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H?op=LISTSTATUS'"'"' 1>/tmp/tmppqi_If 2>/tmp/tmpjpaqJD''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,523 - call returned (0, '')
2018-02-08 18:12:53,525 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77?op=LISTSTATUS'"'"' 1>/tmp/tmpTvphsu 2>/tmp/tmppVPviA''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,635 - call returned (0, '')
2018-02-08 18:12:53,637 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA?op=LISTSTATUS'"'"' 1>/tmp/tmpKGeSwQ 2>/tmp/tmpkUEAly''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,753 - call returned (0, '')
2018-02-08 18:12:53,755 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7?op=LISTSTATUS'"'"' 1>/tmp/tmpEJsVN8 2>/tmp/tmpBLzZTj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:53,887 - call returned (0, '')
2018-02-08 18:12:53,890 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14?op=LISTSTATUS'"'"' 1>/tmp/tmp8DffHH 2>/tmp/tmpjR4sET''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,002 - call returned (0, '')
2018-02-08 18:12:54,004 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY?op=LISTSTATUS'"'"' 1>/tmp/tmpS9SNek 2>/tmp/tmpdQgWJs''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,119 - call returned (0, '')
2018-02-08 18:12:54,122 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpUohrkf 2>/tmp/tmpjsHsAp''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,249 - call returned (0, '')
2018-02-08 18:12:54,251 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/HEAD?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpris38r 2>/tmp/tmpq9DuYo''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,374 - call returned (0, '')
2018-02-08 18:12:54,377 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/branches?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmprqN7vf 2>/tmp/tmpzIadJv''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,494 - call returned (0, '')
2018-02-08 18:12:54,496 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/config?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpoSINGx 2>/tmp/tmpd3zOGG''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,620 - call returned (0, '')
2018-02-08 18:12:54,622 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/hooks?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpDh0uM0 2>/tmp/tmp7v6dqd''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,746 - call returned (0, '')
2018-02-08 18:12:54,748 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpJhWISK 2>/tmp/tmpNGVJwQ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:54,883 - call returned (0, '')
2018-02-08 18:12:54,885 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpFDPXaH 2>/tmp/tmpAXYdNG''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,003 - call returned (0, '')
2018-02-08 18:12:55,005 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs/heads?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpOv1YKj 2>/tmp/tmpmMVwMK''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,135 - call returned (0, '')
2018-02-08 18:12:55,137 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpk_VjqD 2>/tmp/tmprL9Ecm''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,261 - call returned (0, '')
2018-02-08 18:12:55,263 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/info?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpMKMz0X 2>/tmp/tmprCfGck''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,380 - call returned (0, '')
2018-02-08 18:12:55,383 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/pack?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp1OX08W 2>/tmp/tmpktSgmz''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,500 - call returned (0, '')
2018-02-08 18:12:55,502 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpAxnIxT 2>/tmp/tmppR_taH''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,620 - call returned (0, '')
2018-02-08 18:12:55,622 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/heads?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp7PrFAJ 2>/tmp/tmpMVL4rU''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,746 - call returned (0, '')
2018-02-08 18:12:55,747 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/tags?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmptUk2iv 2>/tmp/tmptyTUxP''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,877 - call returned (0, '')
2018-02-08 18:12:55,880 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpn3ALXM 2>/tmp/tmpVZhJay''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:55,998 - call returned (0, '')
2018-02-08 18:12:56,000 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpESK77z 2>/tmp/tmpUARwAr''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:56,117 - call returned (0, '')
2018-02-08 18:12:56,120 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp1xNutq 2>/tmp/tmpvVgTaA''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:56,260 - call returned (0, '')
2018-02-08 18:12:56,263 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpufg_It 2>/tmp/tmp7H_0Da''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:56,380 - call returned (0, '')
2018-02-08 18:12:56,382 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpAhogbn 2>/tmp/tmpvA2PRh''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:56,518 - call returned (0, '')
2018-02-08 18:12:56,520 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp_3K1G1 2>/tmp/tmpVh1RG2''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:56,650 - call returned (0, '')
2018-02-08 18:12:56,652 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpdhMRk0 2>/tmp/tmplHUKea''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:56,776 - call returned (0, '')
2018-02-08 18:12:56,778 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpSjxznc 2>/tmp/tmp3UcrJz''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:56,907 - call returned (0, '')
2018-02-08 18:12:56,909 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp11mJbm 2>/tmp/tmplkiprj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,027 - call returned (0, '')
2018-02-08 18:12:57,029 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpv1A3kZ 2>/tmp/tmp3Idj0E''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,152 - call returned (0, '')
2018-02-08 18:12:57,154 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpMEiJ7u 2>/tmp/tmp7rtHQq''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,316 - call returned (0, '')
2018-02-08 18:12:57,319 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpjwHFX7 2>/tmp/tmpbcmFmp''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,446 - call returned (0, '')
2018-02-08 18:12:57,448 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp9RuMiz 2>/tmp/tmpn0p7v2''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,572 - call returned (0, '')
2018-02-08 18:12:57,574 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpTQGmok 2>/tmp/tmpKtL5ZQ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,691 - call returned (0, '')
2018-02-08 18:12:57,693 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpderpgc 2>/tmp/tmpqFGnkJ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,817 - call returned (0, '')
2018-02-08 18:12:57,819 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpnHSkUA 2>/tmp/tmpEd9lZv''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:57,943 - call returned (0, '')
2018-02-08 18:12:57,945 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpNms5iu 2>/tmp/tmp9mxKIX''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:58,069 - call returned (0, '')
2018-02-08 18:12:58,071 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpF08vme 2>/tmp/tmp7xlYm6''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:58,195 - call returned (0, '')
2018-02-08 18:12:58,198 - HdfsResource['/user/zeppelin'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:12:58,199 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:12:58,313 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin?op=GETFILESTATUS'"'"' 1>/tmp/tmp93Wa9D 2>/tmp/tmpFRX8Bp''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:58,444 - call returned (0, '')
2018-02-08 18:12:58,446 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpKFFcSw 2>/tmp/tmp0V5ZmS''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:58,572 - call returned (0, '')
2018-02-08 18:12:58,574 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpeNmWkL 2>/tmp/tmp4L0ToW''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:58,691 - call returned (0, '')
2018-02-08 18:12:58,693 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin?op=LISTSTATUS'"'"' 1>/tmp/tmpNFLNYs 2>/tmp/tmpzVlp37''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:58,809 - call returned (0, '')
2018-02-08 18:12:58,811 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=LISTSTATUS'"'"' 1>/tmp/tmpToBKZK 2>/tmp/tmpG2SWnv''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:58,925 - call returned (0, '')
2018-02-08 18:12:58,929 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git?op=LISTSTATUS'"'"' 1>/tmp/tmppc6xUP 2>/tmp/tmpTIKaLO''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,056 - call returned (0, '')
2018-02-08 18:12:59,060 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/branches?op=LISTSTATUS'"'"' 1>/tmp/tmppRVXaR 2>/tmp/tmpA8iCW_''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,175 - call returned (0, '')
2018-02-08 18:12:59,177 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/hooks?op=LISTSTATUS'"'"' 1>/tmp/tmpy2dM1x 2>/tmp/tmpjfPQIQ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,300 - call returned (0, '')
2018-02-08 18:12:59,302 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs?op=LISTSTATUS'"'"' 1>/tmp/tmpYHjkgP 2>/tmp/tmpxNYb46''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,418 - call returned (0, '')
2018-02-08 18:12:59,420 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs?op=LISTSTATUS'"'"' 1>/tmp/tmpfkIg4z 2>/tmp/tmpO3GavR''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,539 - call returned (0, '')
2018-02-08 18:12:59,541 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs/heads?op=LISTSTATUS'"'"' 1>/tmp/tmpF4TQ9y 2>/tmp/tmpJo6Krs''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,655 - call returned (0, '')
2018-02-08 18:12:59,656 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects?op=LISTSTATUS'"'"' 1>/tmp/tmpSJ3zYI 2>/tmp/tmpSc71Xt''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,772 - call returned (0, '')
2018-02-08 18:12:59,774 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/info?op=LISTSTATUS'"'"' 1>/tmp/tmp8rsexQ 2>/tmp/tmpvn36Lo''] {'logoutput': None, 'quiet': False}
2018-02-08 18:12:59,885 - call returned (0, '')
2018-02-08 18:12:59,887 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/pack?op=LISTSTATUS'"'"' 1>/tmp/tmp58kgcG 2>/tmp/tmp54s937''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,002 - call returned (0, '')
2018-02-08 18:13:00,004 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs?op=LISTSTATUS'"'"' 1>/tmp/tmpQfqDGx 2>/tmp/tmpWIilwy''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,119 - call returned (0, '')
2018-02-08 18:13:00,121 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/heads?op=LISTSTATUS'"'"' 1>/tmp/tmpe86ENE 2>/tmp/tmpubwbJp''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,244 - call returned (0, '')
2018-02-08 18:13:00,246 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/tags?op=LISTSTATUS'"'"' 1>/tmp/tmpoEOgSS 2>/tmp/tmp2nWdfl''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,373 - call returned (0, '')
2018-02-08 18:13:00,375 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z?op=LISTSTATUS'"'"' 1>/tmp/tmphgtEMR 2>/tmp/tmp18O94U''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,491 - call returned (0, '')
2018-02-08 18:13:00,493 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ?op=LISTSTATUS'"'"' 1>/tmp/tmpUacpuL 2>/tmp/tmp_Zk0rr''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,622 - call returned (0, '')
2018-02-08 18:13:00,624 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK?op=LISTSTATUS'"'"' 1>/tmp/tmpbRLgn2 2>/tmp/tmptiXf_l''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,737 - call returned (0, '')
2018-02-08 18:13:00,739 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H?op=LISTSTATUS'"'"' 1>/tmp/tmpF2zOYJ 2>/tmp/tmpgx877c''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,863 - call returned (0, '')
2018-02-08 18:13:00,865 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77?op=LISTSTATUS'"'"' 1>/tmp/tmphtsmNL 2>/tmp/tmpZTsAQp''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:00,978 - call returned (0, '')
2018-02-08 18:13:00,981 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA?op=LISTSTATUS'"'"' 1>/tmp/tmpP050aF 2>/tmp/tmpb67rZG''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,099 - call returned (0, '')
2018-02-08 18:13:01,102 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7?op=LISTSTATUS'"'"' 1>/tmp/tmp8FizJJ 2>/tmp/tmpTqfOvs''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,218 - call returned (0, '')
2018-02-08 18:13:01,221 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14?op=LISTSTATUS'"'"' 1>/tmp/tmpiba_Je 2>/tmp/tmpButcL9''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,347 - call returned (0, '')
2018-02-08 18:13:01,349 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY?op=LISTSTATUS'"'"' 1>/tmp/tmp_7D1fM 2>/tmp/tmpwDMYrn''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,465 - call returned (0, '')
2018-02-08 18:13:01,467 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpwkdL3J 2>/tmp/tmpZk6H6w''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,583 - call returned (0, '')
2018-02-08 18:13:01,585 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpf4q21u 2>/tmp/tmplOo07l''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,703 - call returned (0, '')
2018-02-08 18:13:01,706 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/HEAD?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp_49GKW 2>/tmp/tmpPCUHvd''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,823 - call returned (0, '')
2018-02-08 18:13:01,825 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/branches?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpF8r2IW 2>/tmp/tmp1HLUyJ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:01,949 - call returned (0, '')
2018-02-08 18:13:01,952 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/config?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpiSiZVw 2>/tmp/tmpjw4RuZ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:02,075 - call returned (0, '')
2018-02-08 18:13:02,077 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/hooks?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpTk_3ko 2>/tmp/tmpUCTAq8''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:02,206 - call returned (0, '')
2018-02-08 18:13:02,208 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpq0EELG 2>/tmp/tmpNsnOop''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:02,350 - call returned (0, '')
2018-02-08 18:13:02,352 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpx6ul28 2>/tmp/tmpanhwGG''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:02,476 - call returned (0, '')
2018-02-08 18:13:02,479 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/logs/refs/heads?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpvwzt64 2>/tmp/tmp9CZSod''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:02,608 - call returned (0, '')
2018-02-08 18:13:02,610 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpXRG1Zq 2>/tmp/tmpSJHtxP''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:02,745 - call returned (0, '')
2018-02-08 18:13:02,747 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/info?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpIdGCR1 2>/tmp/tmpfwNF7L''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:02,872 - call returned (0, '')
2018-02-08 18:13:02,874 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/objects/pack?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpvd5OoG 2>/tmp/tmpFLdxwE''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,004 - call returned (0, '')
2018-02-08 18:13:03,006 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpjDx9cK 2>/tmp/tmprJOa0q''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,129 - call returned (0, '')
2018-02-08 18:13:03,131 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/heads?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpOiFbjP 2>/tmp/tmpiqgy9K''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,249 - call returned (0, '')
2018-02-08 18:13:03,251 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/.git/refs/tags?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp9Citjm 2>/tmp/tmpujHAE0''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,386 - call returned (0, '')
2018-02-08 18:13:03,388 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpb0OIOg 2>/tmp/tmptex0Ax''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,518 - call returned (0, '')
2018-02-08 18:13:03,520 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2A94M5J1Z/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpZ8lHXJ 2>/tmp/tmpUCNo9j''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,650 - call returned (0, '')
2018-02-08 18:13:03,652 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp_Bu4Wu 2>/tmp/tmpk7wn_i''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,781 - call returned (0, '')
2018-02-08 18:13:03,783 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2BWJFTXKJ/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpSN6czd 2>/tmp/tmpcS3sf3''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:03,902 - call returned (0, '')
2018-02-08 18:13:03,904 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpTCZXEq 2>/tmp/tmpbZztlj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,033 - call returned (0, '')
2018-02-08 18:13:04,036 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C174C9EK/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp0w5oGL 2>/tmp/tmp7joU1k''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,153 - call returned (0, '')
2018-02-08 18:13:04,156 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp6XJPVh 2>/tmp/tmpxGe9Xw''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,278 - call returned (0, '')
2018-02-08 18:13:04,281 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2C23PDD5H/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpg1pe2N 2>/tmp/tmpTQAZrc''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,404 - call returned (0, '')
2018-02-08 18:13:04,406 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpDjUUYs 2>/tmp/tmpb2NYxJ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,529 - call returned (0, '')
2018-02-08 18:13:04,531 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CA587K77/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp81clqc 2>/tmp/tmp2_lHJT''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,650 - call returned (0, '')
2018-02-08 18:13:04,652 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmppVC8kX 2>/tmp/tmpGH2GwZ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,770 - call returned (0, '')
2018-02-08 18:13:04,772 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CAX5JCTA/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpngQgon 2>/tmp/tmpRljcKS''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:04,902 - call returned (0, '')
2018-02-08 18:13:04,903 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpk_LiXS 2>/tmp/tmpT59owQ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:05,039 - call returned (0, '')
2018-02-08 18:13:05,041 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBPZJDB7/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpNO4OQV 2>/tmp/tmp4yuIWX''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:05,160 - call returned (0, '')
2018-02-08 18:13:05,162 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp1zyFLF 2>/tmp/tmpik1EVj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:05,291 - call returned (0, '')
2018-02-08 18:13:05,293 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CBTZPY14/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpSfIL7p 2>/tmp/tmpwQDdJj''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:05,422 - call returned (0, '')
2018-02-08 18:13:05,424 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpmu8op5 2>/tmp/tmpwxYLIO''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:05,542 - call returned (0, '')
2018-02-08 18:13:05,544 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/notebook/2CCBNZ5YY/note.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp81NGcU 2>/tmp/tmpc4svtz''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:05,680 - call returned (0, '')
2018-02-08 18:13:05,682 - HdfsResource['/user/zeppelin/test'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:05,683 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:05,788 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/test?op=GETFILESTATUS'"'"' 1>/tmp/tmp__ZJLn 2>/tmp/tmpmPXXNV''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:05,906 - call returned (0, '')
2018-02-08 18:13:05,908 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/test?op=MKDIRS'"'"' 1>/tmp/tmpIOUu09 2>/tmp/tmpb_s4Rl''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:06,045 - call returned (0, '')
2018-02-08 18:13:06,048 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/test?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpLOHcyK 2>/tmp/tmpH9Scgh''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:06,177 - call returned (0, '')
2018-02-08 18:13:06,179 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/test?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpxqN0WL 2>/tmp/tmp6e2qcz''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:06,297 - call returned (0, '')
2018-02-08 18:13:06,300 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/test?op=LISTSTATUS'"'"' 1>/tmp/tmpqfnN74 2>/tmp/tmp8n5S_e''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:06,429 - call returned (0, '')
2018-02-08 18:13:06,431 - HdfsResource['/apps/zeppelin'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:06,431 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:06,536 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin?op=GETFILESTATUS'"'"' 1>/tmp/tmpwvk60a 2>/tmp/tmpD_E_df''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:06,646 - call returned (0, '')
2018-02-08 18:13:06,648 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin?op=MKDIRS'"'"' 1>/tmp/tmpLnf28V 2>/tmp/tmplz4pXt''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:06,769 - call returned (0, '')
2018-02-08 18:13:06,771 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp8TyPSl 2>/tmp/tmpvhFRv1''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:06,895 - call returned (0, '')
2018-02-08 18:13:06,897 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpComKjt 2>/tmp/tmpAYLlJG''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:07,008 - call returned (0, '')
2018-02-08 18:13:07,010 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin?op=LISTSTATUS'"'"' 1>/tmp/tmpGkdTYW 2>/tmp/tmpe3IgO_''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:07,138 - call returned (0, '')
2018-02-08 18:13:07,140 - HdfsResource['/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/usr/hdp/current/zeppelin-server/interpreter/spark/dep/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'group': 'zeppelin', 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'mode': 0444}
2018-02-08 18:13:07,141 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:07,260 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar?op=GETFILESTATUS'"'"' 1>/tmp/tmp3CnQUU 2>/tmp/tmplj0BAW''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:07,374 - call returned (0, '')
2018-02-08 18:13:07,375 - Creating new file /apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar in DFS
2018-02-08 18:13:07,376 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/usr/hdp/current/zeppelin-server/interpreter/spark/dep/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar?op=CREATE&overwrite=True&permission=444'"'"' 1>/tmp/tmpPdSs8W 2>/tmp/tmpiOzyBn''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:09,429 - call returned (0, '')
2018-02-08 18:13:09,431 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar?op=SETPERMISSION&permission=444'"'"' 1>/tmp/tmpKDXMnI 2>/tmp/tmpTGUhIX''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:09,566 - call returned (0, '')
2018-02-08 18:13:09,569 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/apps/zeppelin/zeppelin-spark-dependencies_2.11-0.7.3.2.6.3.0-235.jar?op=SETOWNER&owner=zeppelin&group=zeppelin'"'"' 1>/tmp/tmp8bH2mv 2>/tmp/tmpocKHCR''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:09,692 - call returned (0, '')
2018-02-08 18:13:09,694 - HdfsResource[None] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'action': ['execute'], 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf'}
2018-02-08 18:13:09,695 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -d /user/zeppelin/conf;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:12,357 - call returned (0, '1')
2018-02-08 18:13:12,358 - HdfsResource['/user/zeppelin/conf'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'directory', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:12,359 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:12,468 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf?op=GETFILESTATUS'"'"' 1>/tmp/tmpNchfSG 2>/tmp/tmpi13Lh3''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:12,587 - call returned (0, '')
2018-02-08 18:13:12,589 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf?op=MKDIRS'"'"' 1>/tmp/tmpFjNfUC 2>/tmp/tmpklp6Hu''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:12,709 - call returned (0, '')
2018-02-08 18:13:12,711 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp_51Sty 2>/tmp/tmpJIIjmJ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:12,835 - call returned (0, '')
2018-02-08 18:13:12,837 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpbkqStG 2>/tmp/tmpex1nmT''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:12,963 - call returned (0, '')
2018-02-08 18:13:12,965 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf?op=LISTSTATUS'"'"' 1>/tmp/tmpffUjC0 2>/tmp/tmpooMxJJ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:13,077 - call returned (0, '')
2018-02-08 18:13:13,084 - File['/etc/zeppelin/conf/interpreter.json'] {'owner': 'zeppelin', 'content': ..., 'group': 'zeppelin', 'mode': 0664}
2018-02-08 18:13:13,085 - Writing File['/etc/zeppelin/conf/interpreter.json'] because it doesn't exist
2018-02-08 18:13:13,085 - Changing owner for /etc/zeppelin/conf/interpreter.json from 0 to zeppelin
2018-02-08 18:13:13,086 - Changing group for /etc/zeppelin/conf/interpreter.json from 0 to zeppelin
2018-02-08 18:13:13,086 - Changing permission for /etc/zeppelin/conf/interpreter.json from 644 to 664
2018-02-08 18:13:13,089 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:15,677 - call returned (0, '1')
2018-02-08 18:13:15,689 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-08 18:13:15,690 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-08 18:13:15,691 - Changing permission for /etc/zeppelin/conf/interpreter.json from 664 to 644
2018-02-08 18:13:15,692 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:15,693 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:15,799 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpvWbcLy 2>/tmp/tmpgBWQL9''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:15,933 - call returned (0, '')
2018-02-08 18:13:15,934 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-08 18:13:15,936 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmp8E8S4v 2>/tmp/tmpvhTRz1''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:16,124 - call returned (0, '')
2018-02-08 18:13:16,127 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpKzkwau 2>/tmp/tmpebwG8r''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:16,254 - call returned (0, '')
2018-02-08 18:13:16,257 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpNmYbgM 2>/tmp/tmpBXPuxL''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:16,384 - call returned (0, '')
2018-02-08 18:13:16,386 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmpO3_SoR 2>/tmp/tmpOLaBOD''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:16,509 - call returned (0, '')
2018-02-08 18:13:16,511 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:19,051 - call returned (0, '0')
2018-02-08 18:13:19,052 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -z /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:21,706 - call returned (0, '1')
2018-02-08 18:13:21,707 - call['rm /etc/zeppelin/conf/interpreter.json;/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -get /user/zeppelin/conf/interpreter.json /etc/zeppelin/conf/interpreter.json'] {'user': 'zeppelin'}
2018-02-08 18:13:24,465 - call returned (0, '')
2018-02-08 18:13:24,468 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-08 18:13:24,468 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-08 18:13:24,469 - Changing group for /etc/zeppelin/conf/interpreter.json from 1006 to zeppelin
2018-02-08 18:13:24,470 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:24,471 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:24,589 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpKGh3H9 2>/tmp/tmpk9RNMT''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:24,710 - call returned (0, '')
2018-02-08 18:13:24,711 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-08 18:13:24,712 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpqbmBLa 2>/tmp/tmpPnNatT''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:24,878 - call returned (0, '')
2018-02-08 18:13:24,880 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpHKFjXF 2>/tmp/tmpGO6OFC''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:25,009 - call returned (0, '')
2018-02-08 18:13:25,011 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpMv5r4N 2>/tmp/tmp3o6tC7''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:25,125 - call returned (0, '')
2018-02-08 18:13:25,127 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmpVpH1DL 2>/tmp/tmpJNYAqH''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:25,249 - call returned (0, '')
2018-02-08 18:13:25,252 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:27,897 - call returned (0, '0')
2018-02-08 18:13:27,898 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -z /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:30,535 - call returned (0, '1')
2018-02-08 18:13:30,536 - call['rm /etc/zeppelin/conf/interpreter.json;/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -get /user/zeppelin/conf/interpreter.json /etc/zeppelin/conf/interpreter.json'] {'user': 'zeppelin'}
2018-02-08 18:13:33,395 - call returned (0, '')
2018-02-08 18:13:33,397 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-08 18:13:33,398 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-08 18:13:33,398 - Changing group for /etc/zeppelin/conf/interpreter.json from 1006 to zeppelin
2018-02-08 18:13:33,399 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:33,400 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:33,521 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpYFLc8t 2>/tmp/tmpaK5SkS''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:33,646 - call returned (0, '')
2018-02-08 18:13:33,647 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-08 18:13:33,648 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpdKEUhd 2>/tmp/tmpblXSF8''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:33,891 - call returned (0, '')
2018-02-08 18:13:33,893 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmp5_yHvC 2>/tmp/tmp6J3yew''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:34,015 - call returned (0, '')
2018-02-08 18:13:34,017 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpQT7819 2>/tmp/tmp3BnG4r''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:34,147 - call returned (0, '')
2018-02-08 18:13:34,149 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmpN2PDlb 2>/tmp/tmpVAY0sd''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:34,261 - call returned (0, '')
2018-02-08 18:13:34,263 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:36,824 - call returned (0, '0')
2018-02-08 18:13:36,825 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -z /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:39,370 - call returned (0, '1')
2018-02-08 18:13:39,372 - call['rm /etc/zeppelin/conf/interpreter.json;/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -get /user/zeppelin/conf/interpreter.json /etc/zeppelin/conf/interpreter.json'] {'user': 'zeppelin'}
2018-02-08 18:13:42,144 - call returned (0, '')
2018-02-08 18:13:42,146 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-08 18:13:42,146 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-08 18:13:42,147 - Changing group for /etc/zeppelin/conf/interpreter.json from 1006 to zeppelin
2018-02-08 18:13:42,147 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:42,148 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:42,261 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpJU036k 2>/tmp/tmpVRaoR8''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:42,384 - call returned (0, '')
2018-02-08 18:13:42,385 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-08 18:13:42,386 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpiIjKy1 2>/tmp/tmpR7psHo''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:42,580 - call returned (0, '')
2018-02-08 18:13:42,583 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpT4ywQX 2>/tmp/tmpfuHyqy''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:42,725 - call returned (0, '')
2018-02-08 18:13:42,727 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpHF5ju3 2>/tmp/tmprydNJZ''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:42,849 - call returned (0, '')
2018-02-08 18:13:42,851 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmpbkmano 2>/tmp/tmpPep4NS''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:42,970 - call returned (0, '')
2018-02-08 18:13:42,972 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -f /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:45,591 - call returned (0, '0')
2018-02-08 18:13:45,592 - call['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -test -z /user/zeppelin/conf/interpreter.json;echo $?'] {'user': 'zeppelin'}
2018-02-08 18:13:48,309 - call returned (0, '1')
2018-02-08 18:13:48,310 - call['rm /etc/zeppelin/conf/interpreter.json;/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; hdfs --config /usr/hdp/2.6.3.0-235/hadoop/conf dfs -get /user/zeppelin/conf/interpreter.json /etc/zeppelin/conf/interpreter.json'] {'user': 'zeppelin'}
2018-02-08 18:13:51,201 - call returned (0, '')
2018-02-08 18:13:51,204 - File['/etc/zeppelin/conf/interpreter.json'] {'content': ..., 'owner': 'zeppelin', 'group': 'zeppelin', 'mode': 0644}
2018-02-08 18:13:51,205 - Writing File['/etc/zeppelin/conf/interpreter.json'] because contents don't match
2018-02-08 18:13:51,206 - Changing group for /etc/zeppelin/conf/interpreter.json from 1006 to zeppelin
2018-02-08 18:13:51,207 - HdfsResource['/user/zeppelin/conf/interpreter.json'] {'security_enabled': True, 'hadoop_bin_dir': '/usr/hdp/2.6.3.0-235/hadoop/bin', 'keytab': '/etc/security/keytabs/hdfs.headless.keytab', 'source': '/etc/zeppelin/conf/interpreter.json', 'default_fs': 'hdfs://a01-r03-i164-156-515w9ay.test.local:8020', 'replace_existing_files': True, 'hdfs_resource_ignore_file': '/var/lib/ambari-agent/data/.hdfs_resource_ignore', 'hdfs_site': ..., 'kinit_path_local': '/usr/bin/kinit', 'principal_name': 'hdfs-pss_cloud_dev@POLARIS.TESTD.COM', 'user': 'hdfs', 'owner': 'zeppelin', 'recursive_chown': True, 'hadoop_conf_dir': '/usr/hdp/2.6.3.0-235/hadoop/conf', 'type': 'file', 'action': ['create_on_execute'], 'recursive_chmod': True}
2018-02-08 18:13:51,208 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/hdfs.headless.keytab hdfs-pss_cloud_dev@POLARIS.TESTD.COM'] {'user': 'hdfs'}
2018-02-08 18:13:51,329 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETFILESTATUS'"'"' 1>/tmp/tmpjYfzaw 2>/tmp/tmp7yu4Aa''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:51,465 - call returned (0, '')
2018-02-08 18:13:51,466 - Creating new file /user/zeppelin/conf/interpreter.json in DFS
2018-02-08 18:13:51,468 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --data-binary @/etc/zeppelin/conf/interpreter.json -H '"'"'Content-Type: application/octet-stream'"'"' --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=CREATE&overwrite=True'"'"' 1>/tmp/tmpYFoEo_ 2>/tmp/tmpcGvPmr''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:52,058 - call returned (0, '')
2018-02-08 18:13:52,060 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X PUT --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=SETOWNER&owner=zeppelin&group='"'"' 1>/tmp/tmpjqQayk 2>/tmp/tmp4i4ZPs''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:52,191 - call returned (0, '')
2018-02-08 18:13:52,193 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=GETCONTENTSUMMARY'"'"' 1>/tmp/tmpSbnyTt 2>/tmp/tmpsNM41k''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:52,318 - call returned (0, '')
2018-02-08 18:13:52,321 - call['ambari-sudo.sh su hdfs -l -s /bin/bash -c 'curl -sS -L -w '"'"'%{http_code}'"'"' -X GET --negotiate -u : '"'"'http://a01-r03-i164-156-515w9ay.test.local:50070/webhdfs/v1/user/zeppelin/conf/interpreter.json?op=LISTSTATUS'"'"' 1>/tmp/tmpoI6kvz 2>/tmp/tmpdOgXN9''] {'logoutput': None, 'quiet': False}
2018-02-08 18:13:52,446 - call returned (0, '')
2018-02-08 18:13:52,448 - Execute['/usr/hdp/current/zeppelin-server/bin/zeppelin-daemon.sh restart >> /var/log/zeppelin/zeppelin-setup.log'] {'user': 'zeppelin'}
2018-02-08 18:13:54,581 - Pid file is: /var/run/zeppelin/zeppelin-zeppelin-a01-r03-i164-156-515w9ay.test.local.pid

Command completed successfully!

```



Check Zeppelin

```
stderr: 
None
 stdout:
2018-02-08 18:13:58,175 - call['ambari-python-wrap /usr/bin/hdp-select status spark-client'] {'timeout': 20}
2018-02-08 18:13:58,223 - call returned (0, 'spark-client - 2.6.3.0-235')
2018-02-08 18:13:58,248 - Using hadoop conf dir: /usr/hdp/2.6.3.0-235/hadoop/conf
2018-02-08 18:13:58,250 - Execute['/usr/bin/kinit -kt /etc/security/keytabs/zeppelin.server.kerberos.keytab zeppelin-pss_cloud_dev@POLARIS.TESTD.COM; '] {'user': 'zeppelin'}
2018-02-08 18:13:58,357 - Execute['curl -s -o /dev/null -w'%{http_code}' --negotiate -u: -k http://a01-r03-i164-156-515w9ay.test.local:9995 | grep 200'] {'logoutput': True, 'tries': 10, 'try_sleep': 3}
2018-02-08 18:13:58,397 - Retrying after 3 seconds. Reason: Execution of 'curl -s -o /dev/null -w'%{http_code}' --negotiate -u: -k http://a01-r03-i164-156-515w9ay.test.local:9995 | grep 200' returned 1. 
200

Command completed successfully!

```





