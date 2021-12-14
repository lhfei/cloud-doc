

### Prepare

Error: must have python development packages for 2.6 or 2.7. Could not find Python.h. Please install python2.6-devel or python2.7-devel".  Stop.



```shell
sudo yum install python-devel.x86_64

```



fatal error: sqlite3.h: No such file or directory

```shell
sudo yum install sqlite-devel.x86_64
```



gcc: error trying to exec 'cc1plus': execvp: No such file or directory

```shell
yum groupinstall "Development tools"
```



sasl/saslwrapper.cpp:21:23: fatal error: sasl/sasl.h: No such file or directory

```shell
yum install cyrus-sasl saslwrapper
yum install gcc-c++ python-devel.x86_64 cyrus-sasl-devel.x86_64
```



Modules/errors.h:8:18: fatal error: lber.h: No such file or directory

```shell
pip install ldapcherry

yum -y install openldap-devel
```



fatal error: libxml/xmlversion.h: No such file or directory

```shell
yum install libxml++.x86_64 libxml++-devel.x86_64 
yum install libxslt-devel libxml2-devel
```



/bin/bash: npm: command not found

```shell
```

