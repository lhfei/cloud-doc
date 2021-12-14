# Building from source

## Environment

### JDK 11

- Check Java version `java -version`. It should be 11. Otherwise proceed he following steps

- Install JDK 11:

  ```
  yum install java-11-openjdk
  ```

- Select java mashine by default:

  ```
  sudo alternatives --config java
  ```

- Select the previously installed jdk 11

- Check it `java -version`:

  ```
  openjdk version "11.0.6"
  ```

### PostgreSQL 11

- Configure the repo:

  ```
  rpm -Uvh https://yum.postgresql.org/11/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
  ```

- Install Postgres:

  ```
  yum install postgresql11-server
  ```

- Initialize the database:

  ```
  /usr/pgsql-11/bin/postgresql-11-setup initdb
  ```

- Enable PostgreSQL Server to autostart:

  ```
  systemctl enable postgresql-11.service
  ```

- Allow IP4 local connections. Edit `vi /var/lib/pgsql/11/data/pg_hba.conf`:

  ```
  local   all             all                                     trust
  host    all             all             127.0.0.1/32            trust
  ```

- Start Postgres:

  ```
  systemctl start postgresql-11.service
  ```

- Check its status:

  ```
  systemctl status postgresql-11.service
  ```

- Install Postgres FWD package:

  ```
  yum install postgresql11-contrib
  ```

### Elastic Search 7.X

- Register repo. Command:

  ```
  cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo`
  ```

- Example result:

  ```
  [elasticsearch-7.x]
  name=Elasticsearch repository for 7.x packages
  baseurl=https://artifacts.elastic.co/packages/oss-7.x/yum
  gpgcheck=1
  gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
  enabled=1
  autorefresh=1
  type=rpm-md
  EOF
  ```

- Refresh yum:

  ```
  yum clean all
  yum makecache
  ```

- Install ES:

  ```
  yum -y install elasticsearch-oss
  ```

- Change cluster name to `unidata`:

  ```
  vi /etc/elasticsearch/elasticsearch.yml
  ```

- Changed line:

  ```
  cluster.name: unidata
  ```

- Enable ES service to autostart:

  ```
  systemctl enable elasticsearch.service
  ```

- Start ES:

  ```
  systemctl start elasticsearch.service
  ```

- Check its status:

  ```
  systemctl status elasticsearch.service
  ```

### Tomcat

- Install Tomcat:

  ```
  yum install tomcat tomcat-native
  ```

- Enable Tomcat service to autostart:

  ```
  systemctl enable tomcat
  ```

- Start Tomcat:

  ```
  systemctl start tomcat
  ```

- Check its status:

  ```
  systemctl status tomcat
  ```

### Disable SELinux

- Open the /etc/selinux/config file and set the SELINUX mod to disabled:

  ```
  # This file controls the state of SELinux on the system.
  # SELINUX= can take one of these three values:
  #       enforcing - SELinux security policy is enforced.
  #       permissive - SELinux prints warnings instead of enforcing.
  #       disabled - No SELinux policy is loaded.
  SELINUX=disabled
  # SELINUXTYPE= can take one of these two values:
  #       targeted - Targeted processes are protected,
  #       mls - Multi Level Security protection.
  SELINUXTYPE=targeted
  ```

- Save the file and reboot your CentOS system:

  ```
  sudo shutdown -r now
  ```

## Unidata

### Deploy third party staff

#### ES dictionaries

Install dictionaries ru_RU and en_US. The detailed instructions please refer to the official ES docs (see https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-hunspell-tokenfilter.html).

For example you can do the following steps:

```
cd /etc/elasticsearch/
mkdir hunspell
cd hunspell/
mkdir ru_RU
mkdir en_US
cd /etc/elasticsearch/hunspell/ru_RU
wget https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.dic
wget https://cgit.freedesktop.org/libreoffice/dictionaries/plain/ru_RU/ru_RU.aff
cd /etc/elasticsearch/hunspell/en_US
wget https://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_US.dic
wget https://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_US.aff
systemctl restart elasticsearch.service
```

#### Create DB

- Switch to postgres user:

  ```
  su postgres
  ```

- Run postgres command line util:

  ```
  psql -U postgres
  ```

- Create the database:

  ```
  create database unidata;
  \quit
  ```

### Prepare Unidata configs & libs

- Create unidata conf folder `mkdir /usr/share/tomcat/conf/unidata`

- Copy your backend.properties to Unidata Conf folder

- Copy your logback configuration Unidata Conf folder

- Add unidata properties to Tomcat Java options in `/usr/share/tomcat/conf/tomcat.conf` file:

  ```
  JAVA_OPTS="-Xms1024M -Xmx4096M  -Dunidata.conf=/usr/share/tomcat/conf/unidata/ -Dlogback.configurationFile=/usr/share/tomcat/conf/unidata/logback.xml -server"
  ```

- Download Postgres JDBC driver to Tomcat lib folder:

  ```
  cd /usr/share/tomcat/lib
  wget https://jdbc.postgresql.org/download/postgresql-42.2.12.jar
  ```

- Restart tomcat systemctl restart tomcat

### Deploy Unidata

- Download Unidata dist (for example unidata-ce-r6.0-be9d4bd.tar.gz) to TEMP folder ()

- Unpack the `tar.gz` file

- Deploy war file from <DIST_FOLDER>/Tomcat/webapps folder to your Tomcat (you can copy it to /usr/share/Tomcat/webapps folder and Tomcat will automatically deploy it)

- Restart tomcat if it’s needed:

  ```
  systemctl restart tomcat
  ```

- Check that there are no errors in `/usr/share/tomcat/logs/unidata-backend.log`, but you see lines like that:

  ```
  2020-04-17 14:35:21,769 [localhost-startStop-1] [-] [-]  INFO  o.u.mdm.system.service.impl. ModuleServiceImpl.loadModule:289 - Module org.unidata.mdm. soap.core was started
  
  2020-04-17 14:35:27,969 [localhost-startStop-1]    [-] [-]  INFO  o.u.mdm.system.service.impl. ModuleServiceImpl. loadModules:138 - Modules were loaded
  ```

- Check that new schemas created in unidata database (the database created on previous steps)

- Check that all modules listed in the table `org_unidata_mdm_system.modules_info` have **LOADED** status

### Unidata UI application

Note

For develop you own application based on unidata-platform-ui, see please [unidata-ui-template](https://gitlab.com/unidata-community-group/unidata-ui-template) repo.

Docs bellow is about how to develop unidata-platform-ui

**Before run**

It is necessary to create local config in ``config/local.yml`` with:

```
APP_TYPE:
- 'dataSteward' # data operator interface
- 'dataAdmin' # data admin
- 'systemAdmin' # admin part (users, roles, etc)

serverUrl:
'http://localhost:8081/unidata-backend/api/' # path to backend api
```

**Start dev or build**

App is required node v 12.14

- Install dependency:

  ```
  npm ci
  ```

- Run app in dev mode:

  ```
  npm run dev
  ```

- Build application:

  ```
  npm run build
  ```

- Build docker image:

  ```
  docker build -t my_unidata_ui:0.0.0 .
  ```

- Or create .war if necessary:

  ```
  npm run create_war
  ```