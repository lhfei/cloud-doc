

[@see](https://github.com/airbnb/superset/blob/master/docs/installation.rst 'Setup Guide')

> OS dependencies

```sh
sudo yum upgrade python-setuptools
sudo yum install gcc libffi-devel python-devel python-pip python-wheel openssl-devel libsasl2-devel openldap-devel
```

> Python's setup tools and pip

```sh
pip install --upgrade setuptools pip
```

> Install gcc-c++ 

```
yum install gcc-c++ 
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





> Database dependencies

```sh
yum install mysql-devel
pip install mysqlclient
```


> Restart & Stop

```sh


```