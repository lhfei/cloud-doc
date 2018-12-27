## Presentation of LDAP

****LDAP** stands for **L**ightweight **D**irectory **A**ccess **P**rotocol. It’s an open protocol for accessing and maintaining distributed directory information services over an IP network (source [wikipedia](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)).

Here it is used to facilitate user account administration. Instead of storing user accounts locally on each server, the **LDAP** directory stores them globally and makes them available to a group of servers.

This tutorial doesn’t explain how to set up the **Automounter **and the** NFS **services. It has been tested for **RHEL 7.0**, **RHEL 7.1** and **RHEL 7.2 **(non-patched versions).

During this tutorial, try to follow the instructions very precisely because **LDAP** syntax is sometimes cumbersome (case sensitive, space, etc) and prone to errors (dn/dc/cn).

Let’s assume that we use the **jd.com** domain and the **openldap.jd.com** hostname (this hostname should be resolved either by the **/etc/hosts** file or by **DNS**).



## Installation Procedure

### Install the following packages:

```
yum install -y openldap openldap-clients openldap-servers migrationtools
```



### Generate a **LDAP** password from a secret key (here **redhat**):

```
slappasswd -s Lhfei@Root01 -n > /etc/openldap/passwd
```



### Generate a X509 certificate valid for **365** days:

```sh
openssl req -new -x509 -nodes -out /etc/openldap/certs/polariscert.pem \
-keyout /etc/openldap/certs/polariskey.pem -days 365

Generating a 2048 bit RSA private key
...................................................+++
.............................................+++
writing new private key to '/etc/openldap/certs/priv.pem'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:cn
State or Province Name (full name) []:Beijing
Locality Name (eg, city) [Default City]:Beijing
Organization Name (eg, company) [Default Company Ltd]:Jingdong
Organizational Unit Name (eg, section) []:jd
Common Name (eg, your name or your server's hostname) []:openldap.jd.com
Email Address []:lihefei@jd.com
```



### Secure the content of the **/etc/openldap/certs** directory:

```sh
cd /etc/openldap/certs
chown ldap:ldap *
chmod 600 polariskey.pem
```



### Prepare the **LDAP** database:

```sh
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
```

Generate database files (don’t worry about error messages!):

```sh
slaptest
config file testing succeeded
```



### Change **LDAP** database ownership:

```sh
chown ldap:ldap /var/lib/ldap/*
```



### Activate the **slapd** service at boot:

```sh
systemctl enable slapd
```



### Start the **slapd** service:

```sh
systemctl start slapd
```



### Check the **LDAP** activity:

```sh
netstat -lt | grep ldap
tcp        0      0 0.0.0.0:ldap            0.0.0.0:*               LISTEN     
tcp6       0      0 [::]:ldap               [::]:*                  LISTEN
```



### To start the configuration of the **LDAP** server, add the **cosine** &** nis LDAP** schemas:

```
# cd /etc/openldap/schema
# ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f cosine.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
adding new entry "cn=cosine,cn=schema,cn=config"
# ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f nis.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
adding new entry "cn=nis,cn=schema,cn=config"
```



Then, create the **/etc/openldap/changes.ldif** file and paste the following lines (replace **passwd**with the previously created password like **{SSHA}C+RUShN7w4flfn0obY0nP0d/y89lv31n **



```ini
dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=jd,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=Manager,dc=jd,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootPW
olcRootPW: {SSHA}nbRNUqIB6LaqMNzFg18jd00GlGRxICYu

dn: cn=config
changetype: modify
replace: olcTLSCertificateFile
olcTLSCertificateFile: /etc/openldap/certs/polariscert.pem

dn: cn=config
changetype: modify
replace: olcTLSCertificateKeyFile
olcTLSCertificateKeyFile: /etc/openldap/certs/polariskey.pem

dn: cn=config
changetype: modify
replace: olcLogLevel
olcLogLevel: -1

dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth" read by dn.base="cn=Manager,dc=jd,dc=com" read by * none
```

Send the new configuration to the **slapd** server:

```
ldapmodify -Y EXTERNAL -H ldapi:/// -f /etc/openldap/changes.ldif

SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={2}hdb,cn=config"

modifying entry "olcDatabase={2}hdb,cn=config"

modifying entry "olcDatabase={2}hdb,cn=config"

modifying entry "cn=config"

modifying entry "cn=config"

modifying entry "cn=config"

modifying entry "olcDatabase={1}monitor,cn=config"
```



Create the **/etc/openldap/base.ldif** file and paste the following lines:

```ini
dn: dc=jd,dc=com
dc: jd
objectClass: top
objectClass: domain

dn: ou=People,dc=jd,dc=com
ou: People
objectClass: top
objectClass: organizationalUnit

dn: ou=Group,dc=jd,dc=com
ou: Group
objectClass: top
objectClass: organizationalUnit
```

Build the structure of the directory service:

```shell
ldapadd -x -w Polaris@Root#01 -D cn=Manager,dc=jd,dc=com -f /etc/openldap/base.ldif

adding new entry "dc=jd,dc=com"

adding new entry "ou=People,dc=jd,dc=com"

adding new entry "ou=Group,dc=jd,dc=com"
```



Create two users for testing:

```
# mkdir /home/guests
# useradd -d /home/guests/ldapuser01 ldapuser01
# passwd ldapuser01
Changing password for user ldapuser01.
New password: ldapuser01
Retype new password: ldapuser01
passwd: all authentication tokens updated successfully.
# useradd -d /home/guests/ldapuser02 ldapuser02
# passwd ldapuser02
Changing password for user ldapuser02.
New password: ldapuser02
Retype new password: ldapuser02
passwd: all authentication tokens updated successfully.
```





## User Account Migration



Go to the directory for the migration of the user accounts:

```
cd /usr/share/migrationtools
```



Edit the **migrate_common.ph** file and replace in the following lines:

```
$DEFAULT_MAIL_DOMAIN = "jd.com";
$DEFAULT_BASE = "dc=jd,dc=com";
```



Create the current users in the directory service:

```
# grep ":10[0-9][0-9]" /etc/passwd > passwd
# ./migrate_passwd.pl passwd users.ldif
# ldapadd -x -w Polaris@Root#01 -D cn=Manager,dc=jd,dc=com -f users.ldif
adding new entry "uid=lhfei,ou=People,dc=jd,dc=com"
adding new entry "uid=ldapuser01,ou=People,dc=jd,dc=com"
adding new entry "uid=ldapuser02,ou=People,dc=jd,dc=com"
# grep ":10[0-9][0-9]" /etc/group > group
# ./migrate_group.pl group groups.ldif
# ldapadd -x -w Polaris@Root#01 -D cn=Manager,dc=jd,dc=com -f groups.ldif
adding new entry "cn=lhfei,ou=Group,dc=jd,dc=com"

adding new entry "cn=ldapuser01,ou=Group,dc=jd,dc=com"

adding new entry "cn=ldapuser02,ou=Group,dc=jd,dc=com"
```

```verilog
adding new entry "uid=adsop,ou=People,dc=jd,dc=com"

adding new entry "uid=ads-serving,ou=People,dc=jd,dc=com"

adding new entry "uid=hive,ou=People,dc=jd,dc=com"

adding new entry "uid=infra-solr,ou=People,dc=jd,dc=com"

adding new entry "uid=superset,ou=People,dc=jd,dc=com"

adding new entry "uid=atlas,ou=People,dc=jd,dc=com"

adding new entry "uid=ams,ou=People,dc=jd,dc=com"

adding new entry "uid=falcon,ou=People,dc=jd,dc=com"

adding new entry "uid=accumulo,ou=People,dc=jd,dc=com"

adding new entry "uid=spark,ou=People,dc=jd,dc=com"

adding new entry "uid=flume,ou=People,dc=jd,dc=com"

adding new entry "uid=hbase,ou=People,dc=jd,dc=com"

adding new entry "uid=hcat,ou=People,dc=jd,dc=com"

adding new entry "uid=storm,ou=People,dc=jd,dc=com"

adding new entry "uid=zookeeper,ou=People,dc=jd,dc=com"

adding new entry "uid=oozie,ou=People,dc=jd,dc=com"

adding new entry "uid=tez,ou=People,dc=jd,dc=com"

adding new entry "uid=zeppelin,ou=People,dc=jd,dc=com"

adding new entry "uid=logsearch,ou=People,dc=jd,dc=com"

adding new entry "uid=livy,ou=People,dc=jd,dc=com"

adding new entry "uid=mahout,ou=People,dc=jd,dc=com"

adding new entry "uid=druid,ou=People,dc=jd,dc=com"

adding new entry "uid=ambari-qa,ou=People,dc=jd,dc=com"

adding new entry "uid=kafka,ou=People,dc=jd,dc=com"

adding new entry "uid=hdfs,ou=People,dc=jd,dc=com"

adding new entry "uid=sqoop,ou=People,dc=jd,dc=com"

adding new entry "uid=yarn,ou=People,dc=jd,dc=com"

adding new entry "uid=mapred,ou=People,dc=jd,dc=com"

adding new entry "uid=knox,ou=People,dc=jd,dc=com"

adding new entry "uid=activity_analyzer,ou=People,dc=jd,dc=com"

adding new entry "uid=slider,ou=People,dc=jd,dc=com"

adding new entry "uid=ranger,ou=People,dc=jd,dc=com"

adding new entry "uid=dongzhe,ou=People,dc=jd,dc=com"

adding new entry "uid=dz_test,ou=People,dc=jd,dc=com"

adding new entry "uid=ldapuser01,ou=People,dc=jd,dc=com"

adding new entry "uid=ldapuser02,ou=People,dc=jd,dc=com"

adding new entry "uid=ldapuser03,ou=People,dc=jd,dc=com"
```

```
adding new entry "cn=adsop,ou=Group,dc=jd,dc=com"

adding new entry "cn=ads-serving,ou=Group,dc=jd,dc=com"

adding new entry "cn=livy,ou=Group,dc=jd,dc=com"

adding new entry "cn=spark,ou=Group,dc=jd,dc=com"

adding new entry "cn=hdfs,ou=Group,dc=jd,dc=com"

adding new entry "cn=zeppelin,ou=Group,dc=jd,dc=com"

adding new entry "cn=hadoop,ou=Group,dc=jd,dc=com"

adding new entry "cn=knox,ou=Group,dc=jd,dc=com"

adding new entry "cn=ranger,ou=Group,dc=jd,dc=com"

adding new entry "cn=dongzhe,ou=Group,dc=jd,dc=com"

adding new entry "cn=dz_test,ou=Group,dc=jd,dc=com"

adding new entry "cn=ldapuser01,ou=Group,dc=jd,dc=com"

adding new entry "cn=ldapuser02,ou=Group,dc=jd,dc=com"

adding new entry "cn=ldapuser03,ou=Group,dc=jd,dc=com"
```



Test the configuration with the user called **ldapuser01**:

```
ldapsearch -x cn=ldapuser01 -b dc=jd,dc=com

# extended LDIF
#
# LDAPv3
# base <dc=jd,dc=com> with scope subtree
# filter: cn=ldapuser01
# requesting: ALL
#

# ldapuser01, People, jd.com
dn: uid=ldapuser01,ou=People,dc=jd,dc=com
uid: ldapuser01
cn: ldapuser01
objectClass: account
objectClass: posixAccount
objectClass: top
objectClass: shadowAccount
userPassword:: e2NyeXB0fSQ2JDJxMG11LzRiJHB1RjgwTWVRTi83NGREMVFLQ2xtYy5WQmt3Nkl
 jLzNCbW5sQ21LZ3VaV3dWT3YyQm15Y3J6LzZXVFUwUzlXUjVKRmF1cUJuLmo0U2pTVy92UC54Sm4w
shadowLastChange: 17541
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/bash
uidNumber: 1001
gidNumber: 1001
homeDirectory: /home/guests/ldapuser01

# ldapuser01, Group, jd.com
dn: cn=ldapuser01,ou=Group,dc=jd,dc=com
objectClass: posixGroup
objectClass: top
cn: ldapuser01
userPassword:: e2NyeXB0fXg=
gidNumber: 1001

# search result
search: 2
result: 0 Success

# numResponses: 3
# numEntries: 2
```



```
ldapsearch -x -LLL -b dc=jd,dc=com '(&(objectclass=posixAccount)(|(uSNChanged>=0)(modifyTimestamp>=19700101080000Z))(uid=*))'
```



## Firewall Configuration

Add a new service to the firewall (**ldap**: port **tcp** **389**):

```shell
firewall-cmd --permanent --add-service=ldap
```

Reload the firewall configuration:

```
firewall-cmd --reload
```



Edit the **/etc/rsyslog.conf** file and add the following line:

```
local4.* /var/log/ldap.log
```



Restart the **rsyslog** service:

```
systemctl restart rsyslog
```

