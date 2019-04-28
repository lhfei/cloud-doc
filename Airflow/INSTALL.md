## Install

## Getting Airflow

The easiest way to install the latest stable version of Airflow is with `pip`:

```sh
pip install apache-airflow
```

You can also install Airflow with support for extra features like `s3` or `postgres`:

```sh
pip install "apache-airflow[s3, postgres]"
```

Note

GPL dependency

One of the dependencies of Apache Airflow by default pulls in a GPL library (‘unidecode’). In case this is a concern you can force a non GPL library by issuing`export SLUGIFY_USES_TEXT_UNIDECODE=yes` and then proceed with the normal installation. Please note that this needs to be specified at every upgrade. Also note that if unidecode is already present on the system the dependency will still be used.

```sh
# airflow needs a home, ~/airflow is the default,
# but you can lay foundation somewhere else if you prefer
# (optional)
export AIRFLOW_HOME=~/airflow

# install from pypi using pip
pip install apache-airflow

# initialize the database
airflow initdb

# start the web server, default port is 8080
airflow webserver -p 8080

# start the scheduler
airflow scheduler

# visit localhost:8080 in the browser and enable the example dag in the home page
```



## Init DB

Edit `${AIRFLOW_HOME}/airflow.cfg`,

```sh
sql_alchemy_conn = mysql://root:Lhfeilaile@01@10.182.93.66/airflow
```



### Install PyMySQL

```shell
yum install -y mysql-devel
pip install -y mysqlclient

python3 -m pip install PyMySQL
```





### MySQL

> Set password

```shell
>mysqladmin password -u root -p
Enter password: [Lhfeilaile@01]
New password: [Lhfeilaile@01]
Confirm new password: 
Warning: Since password will be sent to server in plain text, use ssl connection to ensure password safety.
```



```sql
mysql>set global max_connections = 100000;
mysql>set global max_connect_errors = 1844674407370954751;
```



> Create DB 

```sql
CREATE DATABASE cloud_airflow
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'polaris_airflow'@'localhost' IDENTIFIED BY 'Airflow_1473';
GRANT ALL ON cloud_airflow.* TO 'polaris_superset'@'10.182.2.88' IDENTIFIED BY 'Airflow_1473';

GRANT ALL ON cloud_airflow.* TO 'polaris_airflow'@'%' IDENTIFIED BY 'Airflow_1473';

FLUSH PRIVILEGES;
```





### Issues

#### set slugify_uses_text_unidecode=yes

```ini
set slugify_uses_text_unidecode=yes in your environment when you install or upgrade airflow
```

Try the following:

```sh
export AIRFLOW_GPL_UNIDECODE=yes
```

or

```sh
export SLUGIFY_USES_TEXT_UNIDECODE=yes
```



#### Python.h: No Such File or Directory

```
Python.h: No Such File or Directory” when compiling python file to a c executable file?
```

You should install the development package of Python which contains header files and the library of Python.

```sh
yum -y install python36u-devel
```



#### OSError: mysql_config not found

On Red Hat, try the following:

```
yum install mysql-community-devel
```

or:

```sh
sudo yum install mysql-devel gcc gcc-devel python-devel
sudo easy_install mysql-python
```



#### No module named 'sasl'

```sh
yum install libffi-devel libgsasl-devel libmemcached-devel
```



#### No module named thrift_sasl

```sh
yum -y install easy_install
easy_install thrift
pip install thrift_sasl
```



#### Could not start SASL: b'Error in sasl_client_start (-4) SASL(-4): no mechanism available: No worthy mechs found'

```
yum install cyrus-sasl-plain  cyrus-sasl-devel  cyrus-sasl-gssapi
```



#### FileNotFoundError: [Errno 2] No such file or directory: 'hive': 'hive'

HiveOperator is a wrapper around the hive cli (or the beeline) binary. You need to have the `hive` command in your path wherever that code is running. If you have the HiveServer2 service running in your environment you may want to check out the HiveServer2Operator.