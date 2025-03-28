
```shell
sudo apt-get install g++ libkrb5-dev libffi-dev libmysqlclient-dev libssl-dev libsasl2-dev libsasl2-modules-gssapi-mit libsqlite3-dev libtidy-0.99-0 libxml2-dev libxslt-dev  libldap2-dev python-dev python-setuptools libgmp3-dev

$ git clone https://github.com/cloudera/hue.git
$ cd hue
$ make apps
$ build/env/bin/hue runserver

/sbin/iptables -I INPUT -p tcp --dport 8000 -j ACCEPT


# Now Hue should be running on http://localhost:8000 !

# The configuration in development mode is desktop/conf/pseudo-distributed.ini.
```

```ini
>./build/env/bin/hue help
	[auth]
		changepassword
		createsuperuser

	[axes]
		axes_list_attempts
		axes_reset

	[beeswax]
		beeswax_install_examples
		close_queries
		close_sessions

	[desktop]
		clean_history_docs
		config_dump
		config_help
		config_upgrade
		create_desktop_app
		create_proxy_app
		create_test_fs
		create_user_directories
		generate_mdl
		is_db_alive
		kt_renewer
		runcherrypyserver
		runcpserver
		runpylint
		sync_documents
		test
		test_windmill
		version

	[django]
		check
		cleanup
		compilemessages
		createcachetable
		dbshell
		diffsettings
		dumpdata
		flush
		inspectdb
		loaddata
		makemessages
		runfcgi
		shell
		sql
		sqlall
		sqlclear
		sqlcustom
		sqldropindexes
		sqlflush
		sqlindexes
		sqlinitialdata
		sqlsequencereset
		startapp
		startproject
		validate

	[django_extensions]
		admin_generator
		clean_pyc
		clear_cache
		compile_pyc
		create_app
		create_command
		create_jobs
		create_template_tags
		describe_form
		drop_test_database
		dumpscript
		export_emails
		find_template
		generate_secret_key
		graph_models
		mail_debug
		notes
		passwd
		pipchecker
		print_settings
		print_user_for_session
		reset_db
		runjob
		runjobs
		runprofileserver
		runscript
		runserver_plus
		set_default_site
		set_fake_emails
		set_fake_passwords
		shell_plus
		show_templatetags
		show_urls
		sqlcreate
		sqldiff
		sync_s3
		syncdata
		unreferenced_files
		update_permissions
		validate_templates

	[django_openid_auth]
		openid_cleanup

	[hbase]
		hbase_setup

	[indexer]
		indexer_setup

	[notebook]
		dbproxy_server
		notebook_setup

	[oozie]
		oozie_setup

	[pig]
		pig_setup

	[search]
		search_setup

	[sessions]
		clearsessions

	[south]
		convert_to_south
		datamigration
		graphmigrations
		migrate
		migrationcheck
		schemamigration
		startmigration
		syncdb
		testserver

	[staticfiles]
		collectstatic
		findstatic
		runserver

	[useradmin]
		import_ldap_group
		import_ldap_user
		sync_ldap_users_and_groups
		useradmin_sync_with_unix
```

## Hue & MySQL Configuration

1. Open the /etc/hue/conf/hue.ini file and edit the [[database]] section:

```ini
[[database]]

	engine=mysql

	host=$DATABASEIPADDRESSORHOSTNAME

	port=$PORT

	user=$HUEUSER

	password=$HUEPASSWORD

	name=$DBNAME
```

​	

2. Synchronize Hue with the external database to create the schema and load the data.

	```shell
	cd /usr/lib/hue
	source build/env/bin/activate
	hue syncdb --noinput
	Hue migrate
	deactivate
	```
	
	



## Troubleshooting

- [x] c/_cffi_backend.c   ffi.h: No such file or directory

  ```
  yum install libffi-devel
  ```

  


- [x] libxml/xmlversion.h: No such file or directory

  ```shell
  yum install libxslt-devel libxml2-devel
  ```



- [x] gmp.h: No such file or directory

  ```
  yum install gmp-devel gmp gmp-static
  ```



- [x] Could not find suitable distribution for Requirement.parse('logilab-astng>=0.24.3')

  ```
  pip install logilab-astng
  ```

  



