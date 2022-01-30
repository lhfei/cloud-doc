### HUE MySQL Setup

Edit `/export/app_workspaces/hue/desktop/conf/pseudo-distributed.ini`

```ini
  [[database]]
    # Database engine is typically one of:
    # postgresql_psycopg2, mysql, sqlite3 or oracle.
    #
    # Note that for sqlite3, 'name', below is a path to the filename. For other backends, it is the database name.
    # Note for Oracle, options={"threaded":true} must be set in order to avoid crashes.
    # Note for Oracle, you can use the Oracle Service Name by setting "host=" and "port=" and then "name=<host>:<port>/<service_name>".
    # Note for MariaDB use the 'mysql' engine.
    engine=mysql
    host=10.0.0.3
    port=3306
    user=cloud_hue
    password=Hueuser_1473
    # conn_max_age option to make database connection persistent value in seconds
    # https://docs.djangoproject.com/en/1.9/ref/databases/#persistent-connections
    ## conn_max_age=0
    # Execute this script to produce the database password. This will be used when 'password' is not set.
    ## password_script=/path/script
    name=cloud_hue
    ## options={}

  # Configuration options for specifying the Desktop session.
  # For more info, see https://docs.djangoproject.com/en/1.11/topics/http/sessions/
  # ------------------------------------------------------------------------
```



### Init DB

```shell
{HUE_HOME}/build/env/bin/hue syncdb

{HUE_HOME}/build/env/bin/hue migrate
```



### Create Superuser

```shell
{HUE_HOME}/build/env/bin/hue createsuperuser --username lhfei

Email address: lihefei@jd.com
Password: 
Password (again): [*****@****01]
Superuser created successfully.
```





