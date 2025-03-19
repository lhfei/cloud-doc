https://medium.com/@DebugDrake/install-ckan-on-redhat-centos-5b4a2d5d7403





1. **Update system packages**

Ensure your system’s package repository is up to date by running:

```shell
sudo yum update
```

**2. Install Tomcat**

```shell
sudo yum install tomcat
```

Edit Tomcat config:

```shell
sudo vi /usr/share/tomcat/conf/tomcat.conf

JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"
```

Install Tomcat Admin webapp:

```shell
sudo yum install tomcat-webapps tomcat-admin-webapps
sudo vi /usr/share/tomcat/conf/tomcat-users.xml

<user username="admin" password="password" roles="manager-gui,admin-gui"/>
```

Change port number (Optional):

```shell
sed -i s/8080/8983/g /usr/share/tomcat/conf/server.xml
systemctl start tomcat
systemctl enable tomcat
```

**3. Database**

We choose PostgreSQL in this tuturial, assume it has been installed, or follow the instruction blow to install:

```shell
yum install postgresql-server
service postgresql initdb
systemctl enable postgresql.service
service postgresql start
```

List existing tables:

```shell
sudo -u postgres psql -l
```

Create db user:

```shell
sudo -u postgres createuser -S -D -R -P ckan_default
```

Create db table owned by the new user:

```shell
sudo -u postgres createdb -O ckan_default ckan_default -E utf-8
```

**4. Install CKAN**

**Create Python virtualenv:**

```shell
sudo mkdir -p /usr/lib/ckan/default
sudo chown `whoami` /usr/lib/ckan/default
pip install virtualenv
virtualenv --no-site-packages /usr/lib/ckan/default
. /usr/lib/ckan/default/bin/activate
```



### Prepared Install

> 1.gcc

```shell
rpm --import https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7
rpm --import https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-SCLo

sudo yum install -y centos-release-scl
sudo yum install -y devtoolset-11-gcc*
scl enable devtoolset-11 bash
```



> 2.postgresql-server 

**Postgresql 12**

```shell
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql12-server
```



> 3.libpq

```shell
yum install libpqxx-devel python-devel
```



>  4.Requires: llvm-toolset-7-clang >= 4.0.1

```shell
sudo bash -c 'cat << EOF > /etc/yum.repos.d/llvmtoolset-build.repo
[llvmtoolset-build]
name=LLVM Toolset 11.0 - Build
baseurl=https://buildlogs.centos.org/c7-llvm-toolset-11.0.x86_64/
gpgcheck=0
enabled=1
EOF'

# yum install centos-release-scl-rh
yum install --nogpgcheck llvm-toolset-11.0-clang-tools-extra llvm-toolset-11.0-clang
```



> 5.psycopg2

```shell
conda install  psycopg2
```





**Install latest stable release of CKAN:**

```shell
pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.11.0#egg=ckan[requirements]'
```

**Install Python modules:**

```shell
pip install -r /usr/lib/ckan/default/src/ckan/requirements.txt
```

**Fix fatal error: Python.h: No such file or directory**

```shell
deactivate
yum install python-devel
. /usr/lib/ckan/default/bin/activate
```

**Fix fatal error: libpq-fe.h: No such file or directory**

```shell
deactivate
yum install postgresql-devel
. /usr/lib/ckan/default/bin/activate
```

**Create CKAN config file**

```shell
sudo mkdir -p /etc/ckan/default
sudo chown -R `whoami` /etc/ckan/
sudo mkdir -p ~/ckan/etc
sudo chown -R `whoami` ~/ckan/etc
#paster make-config ckan /etc/ckan/default/production.ini
# vim /etc/ckan/default/production.ini
ckan generate config /etc/ckan/default/ckan.ini
vim /etc/ckan/default/ckan.ini

Edit sqlalchemy.url value
Edit ckan.site_id = default
Edit ckan.site_url = http://ckan.local.redhat
Edit solr_url=http://127.0.0.1:8983/solr/ckan
```

*(Do not add a trailing slash to the URL)*

**Setup Solr for CKAN:**

```shell
mv  /var/lib/tomcat/webapps/solr/solr/collection1  /var/lib/tomcat/webapps/solr/solr/ckan
vim /var/lib/tomcat/webapps/solr/solr/ckan/core.properties
Edit name=ckan
mv /var/lib/tomcat/webapps/solr/solr/ckan/conf/schema.xml /var/lib/tomcat/webapps/solr/solr/ckan/conf/schema.xml.bak
 
ln -s /usr/lib/ckan/default/src/ckan/ckan/config/solr/schema.xml /var/lib/tomcat/webapps/solr/solr/ckan/conf/schema.xml

chown tomcat:tomcat /var/lib/tomcat/webapps/solr/solr/ckan/conf/schema.xml
```

**Init CKAN database:**

```shell
vim /var/lib/pgsql/data/pg_hba.conf
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# # IPv6 local connections:
host    all             all             ::1/128                 trust
service postgresql restart
pip install bleach —upgrade
cd /usr/lib/ckan/default/src/ckan
paster db init -c /etc/ckan/default/production.ini
```

**Link to who.ini:**

```shell
ln -s /usr/lib/ckan/default/src/ckan/who.ini /etc/ckan/default/who.ini
```

**Install Addons:**

```shell
cd /usr/lib/ckan/default/src
git clone https://github.com/okfn/ckanext-spatial.git ckanext-spatial
git clone https://github.com/ogdch/ckanext-noregistration.git ckanext-noregistration
git clone https://github.com/ckan/ckanext-scheming.git ckanext-scheming
git clone https://github.com/ckan/ckanext-harvest.git ckanext-harvest
```

Run ‘Python [setup.py](http://setup.py/) develop’ in each subfolder, then:

```shell
pip install ckanext-pdfview 
pip install ckanext-geoview 
pip install pika 
pip install ckanapi 
paster serve /etc/ckan/default/production.ini
```

**Setup DataStore:**

```shell
sudo -u postgres psql -l  
sudo -u postgres createuser -S -D -R -P -l datastore_default  
sudo -u postgres createdb -O ckan_default datastore_default -E utf-8  
vim /etc/ckan/default/production.ini
ckan.site_title = Example Data Repository
ckan.plugins = datastore ckan.datastore.write_url = … 
ckan.datastore.read_url = …  
paster --plugin=ckan datastore set-permissions -c /etc/ckan/default/production.ini | sudo -u postgres psql --set ON_ERROR_STOP=1
```

**Configure CKAN Dump the PostgreSQL database from existing CKAN (Optional)**

Refer to http://docs.ckan.org/en/latest/contributing/database-migrations.html

**Create new user:**

```shell
. /usr/lib/ckan/default/bin/activate 
cd /usr/lib/ckan/default/src/ckan 
paster sysadmin add [username] -c /etc/ckan/default/production.ini
```

**Rebuild Solr indexing:**

```shell
paster search-index rebuild -c /etc/ckan/default/production.ini
```

**Create WSGI script file /etc/ckan/default/apache.wsgi before setup Apache:**

```shell
import os 
activate_this = os.path.join('/usr/lib/ckan/default/bin/activate_this.py') 
execfile(activate_this, dict(__file__=activate_this)) 

from paste.deploy import loadapp 
config_filepath = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'production.ini') 

from paste.script.util.logging_config import fileConfig 
fileConfig(config_filepath) 
application = loadapp('config:%s' % config_filepath)
```
