

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

> Superset installation and initialization

```sh
# Install superset
pip install superset

# Create an admin user
fabmanager create-admin --app superset

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

> Database dependencies

```sh
yum install mysql-devel
pip install mysqlclient
```


> Restart & Stop

```sh


```