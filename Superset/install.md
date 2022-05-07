## Requires



```shel
yum install -y gcc-c++ 

yum install -y python3-devel


```



> Pip

```shell
 pip install sqlalchemy==1.3.24 
 pip install dataclasses
```







### Pandoc

```
# Download the latest epel-release rpm from
http://dl.fedoraproject.org/pub/epel/6/x86_64/

# Install epel-release rpm:
rpm -Uvh epel-release*rpm

# Install pandoc rpm package:
yum install -y pandoc
```



```
pip install -r requirements.txt
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
CREATE DATABASE cloud_superset
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'polaris_superset'@'localhost' IDENTIFIED BY 'Superset_1473';

GRANT ALL ON cloud_superset.* TO 'polaris_superset'@'%' IDENTIFIED BY 'Superset_1473';

FLUSH PRIVILEGES;
```





> Install Directory

`/opt/rh/rh-python36/root/lib/python3.6/site-packages/superset`

or

` /usr/local/lib/python3.6/site-packages/superset/`



### Issues

> command 'gcc' failed with exit status 1

```shell
# check the name of python.devel
> sudo yum search python3 | grep devel

# install the python36.devel
> sudo yum install python36-devel
```

