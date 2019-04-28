

[@see](https://github.com/airbnb/superset/blob/master/docs/installation.rst 'Setup Guide')

> OS dependencies

```sh
sudo yum upgrade python-setuptools
sudo yum install -y gcc libffi-devel python-devel python-pip python-wheel openssl-devel libsasl2-devel openldap-devel
```

> Python's setup tools and pip

```sh
pip install --upgrade setuptools pip
```

> Install gcc-c++ 

```
yum install gcc-c++ 
```



```shell
wget https://github.com/apache/incubator-superset/blob/master/requirements.txt

pip install -r requirements.txt
```



```shell
# Fix pandas version compatibility problem
pip uninstall pandas
pip install pandas==0.23.4

# Fix sqlalchemy compatibility problem
pip uninstall sqlalchemy
pip install sqlalchemy==1.2.18
```





> Superset installation and initialization

```sh
# Install superset
pip install superset

# Create an admin user
fabmanager create-admin --app superset
-------------
Username [admin]: lhfei
User first name [admin]: Hefei
User last name [user]: Li
Email [admin@fab.org]: lhfei@xx.com
Password: [Lhfei]
Repeat for confirmation: [Lhfei]
Recognized Database Authentications.
Admin User lhfei created.

# Initialize the database
superset db upgrade

# Load some data to play with
superset load_examples

# Create default roles and permissions
superset init

# Start the web server on port 8088
superset runserver -p 8088

# To start a development web server, use the -d switch
# superset runserver -d
```

To configure your application, you can edit the *config.py* file in your {**PYTHONPATH**}*/site-packages/superset*.



```shell
# default sqllite file
sqlite:////root/.superset/superset.db

# check superset install directory
find / -name config.py | grep superset
/opt/rh/rh-python36/root/usr/lib/python3.6/site-packages/superset/config.py
```





> Database dependencies

```sh
yum install mysql-devel
pip install mysqlclient

python3 -m pip install PyMySQL
```



Update `config.py`

```ini
SQLALCHEMY_DATABASE_URI = 'mysql:pymysql://polaris_superset:Superset_1473@10.182.91.112/cloud_superset'
```






> Restart & Stop

```sh


```