# Best Steps to Install and Configure OpenLDAP Server on RHEL/CentOS 7



> Table of Contents	

```ini
What is LDAP
What is LDIF
What is an Attribute
Install and Configure OpenLDAP Server on Linux
Step 1: Prerequisites
Step 2: Update Your System
Step 3: Install OpenLDAP Server
Step 4: Install OpenLDAP Client
Step 5: Start and Enable OpenLDAP Services
Step 6: Setup OpenLDAP root user password
Step 7: Configure OpenLDAP Server
Step 8: Configure OpenLDAP Sample Database
Step 9: Add Domain Configuration
Step 10: Add Entries to OpenLDAP Database
Step 11: Create a LDAP User
Step 12: Create LDAP Group Definitions
Step 13: Create LDAP User Definitions
Step 14: Test OpenLDAP Server Authentication
```



#### **Step 1: Prerequisites**

a)You need to have running `RHEL/CentOS 7` based Systems.

b)You should have `yum` tool installed in your System. Please Check [**Top 22 YUM Command Examples in RedHat/CentOS 7** ](https://www.cyberithub.com/yum-command-examples/)to know more about yum utility.



#### **Step 2: Update Your System**

Before going through the steps to setup OpenLDAP Server, it is always recommended to [update your Server](https://www.cyberithub.com/how-to-use-proxy-server-to-update-packages-from-yum-repository-in-linux/). This can be done by using `yum update -y` command as shown below. This will [download and install](https://www.cyberithub.com/visual-studio-2013-download/) all the latest available updates from Repo.

```shell
[root@localhost ~]# yum update -y
```

 

#### **Step 3: Install OpenLDAP Server**

After successfully updating the Server you can now [install the LDAP Packages](https://www.cyberithub.com/install-all-dependent-packages-on-centos-7/) using yum install openldap openldap-servers -y command as shown below. This command will download and [install the Open LDAP Server packages from Enabled Repository](https://www.cyberithub.com/how-to-install-and-enable-epel-repository-on-rhel-centos-7-8/).

```shell
[root@localhost ~]# yum install openldap openldap-servers -y
```

 

#### **Step 4: Install OpenLDAP Client**

Then you have to install the OpenLDAP Client Packages in your Client [System using yum install openldap-clients -y command](https://www.cyberithub.com/zfs-file-system-commands/) as shown below.

```shell
[root@localhost ~]# yum install openldap-clients -y
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
..........................................
Installed:
openldap-clients.x86_64 0:2.4.44-21.el7_6

Complete!
```

 

#### **Step 5: Start and Enable OpenLDAP Services**

Start slapd service by using `systemctl start slapd` command as shown below.

```shell
[root@localhost ~]# systemctl start slapd
```

Then enable the slapd service by using `systemctl enabled slapd` command.

```shell
[root@localhost ~]# systemctl enable slapd
Created symlink from /etc/systemd/system/multi-user.target.wants/slapd.service to /usr/lib/systemd/system/slapd.service.
```

[Check the status by using systemctl status slapd command](https://www.cyberithub.com/linux-ip-command-examples/).

```shell
[root@localhost ~]# systemctl status slapd
..............................
Hint: Some lines were ellipsized, use -l to show in full.
```

 ```shell
 slaptest
 config file testing succeeded
 ```



#### **Step 6: Setup OpenLDAP root user password**

Next [step is to setup the OpenLDAP root password](https://www.cyberithub.com/simple-steps-to-reset-mariadb-root-password-on-rhel-centos-7-8/) using slappasswd command as shown below.

```shell
slappasswd -s DataLink@LDAP -n > /etc/openldap/passwd
```



```shell
[root@localhost ~]# slappasswd
New password:[DataLink@LDAP]
Re-enter new password:[DataLink@LDAP]
{SSHA}8me5NZZz1LfgLIfUTezj/01TKiBMZUux
```

 

#### **Step 7: Configure OpenLDAP Server**

You can add the data to [directory service using below ldif file](https://www.cyberithub.com/delete-files-directories-owned-specific-user-group-in-linux/).

```shell
[root@localhost ~]# vi ldaprootpasswd.ldif
dn: olcDatabase={0}config,cn=config
changetype: modify
add: olcRootPW
olcRootPW: {SSHA}7PeF4Tw/hPMM/2KnLyLiMW94v75WNfSG
```

**oldcDatabase={0} :** database instance which can be found in /etc/openldap/slapd.d/cn=config.

**changetype :** type of operations needs to perform - add/modify/delete

**add :** perform add operation

**olcRootPW :** Specify the Administrative user hashed password.

Add the above entry by using `ldapadd -Y EXTERNAL -H ldapi:/// -f ldaprootpasswd.ldif` command as shown below.

```shell
[root@localhost ~]# ldapadd -Y EXTERNAL -H ldapi:/// -f ldaprootpasswd.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={0}config,cn=config"
```

**-Y :** Specify the SASL mechanism to be used for authentication. If it's not specified, the program will choose the best mechanism the server knows. More can be checked on ldapadd **[Man](https://linux.die.net/man/1/ldapadd)** Page.

**-H :** Specify URI(s) referring to the ldap server(s) only the protocol/host/port fields are allowed.

**-f :** Read the entry modification information from file instead of from standard input.

 

#### **Step 8: Configure OpenLDAP Sample Database**

Copy the DB_CONFIG Example.

```shell
[root@localhost ~]# cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
```

Change the permission.

```shell
[root@localhost ~]# chown -R ldap:ldap /var/lib/ldap/DB_CONFIG
```

Restart the slapd service by using `systemctl restart slapd` command.

```shell
[root@localhost ~]# systemctl restart slapd
```

Now add the configuration using below ldapadd command.

```shell
[root@localhost ~]# ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
adding new entry "cn=cosine,cn=schema,cn=config"
[root@localhost ~]# ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
adding new entry "cn=nis,cn=schema,cn=config"
[root@localhost ~]# ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
adding new entry "cn=inetorgperson,cn=schema,cn=config"
```

 

#### **Step 9: Add Domain Configuration**

To add the domain configuration, you need to use below ldif file.

```shell
[root@localhost ~]# vi ldapdomain.ldif
dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth" read by dn.base="cn=dlink,dc=datalink,dc=cn" read by * none

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=datalink,dc=cn

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=dlink,dc=datalink,dc=cn

dn: olcDatabase={2}hdb,cn=config
changetype: modify
add: olcRootPW
#replace: olcRootPW
olcRootPW: {SSHA}TU1DnkqNb1G/CQSxRnoNo+BmkadkRTGx

dn: olcDatabase={2}hdb,cn=config
changetype: modify
add: olcAccess
olcAccess: {0}to attrs=userPassword,shadowLastChange by dn="cn=dlink,dc=datalink,dc=cn" write by anonymous auth by self write by * none
olcAccess: {1}to dn.base="" by * read
olcAccess: {2}to * by dn="cn=dlink,dc=datalink,dc=cn" write by * read
```

Now modify the entry by using below ldapmodify command.

```shell
[root@localhost ~]# ldapmodify -Y EXTERNAL -H ldapi:/// -f ldapdomain.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={1}monitor,cn=config"

modifying entry "olcDatabase={2}hdb,cn=config"

modifying entry "olcDatabase={2}hdb,cn=config"

modifying entry "olcDatabase={2}hdb,cn=config"

modifying entry "olcDatabase={2}hdb,cn=config"
```

 

#### **Step 10: Add Entries to OpenLDAP Database**

You can add few more entries to the directory service using below ldif file.

```shell
[root@localhost ~]# vi baseldapdomain.ldif
dn: dc=datalink,dc=cn
objectClass: top
objectClass: dcObject
objectclass: organization
o: datalink cn
dc: datalink

dn: cn=dlink,dc=datalink,dc=cn
objectClass: organizationalRole
cn: Manager
description: Service Account

dn: ou=Account,dc=datalink,dc=cn
objectClass: organizationalUnit
ou: Account

dn: ou=BusinessIntelligence,dc=datalink,dc=cn
objectClass: organizationalUnit
ou: BusinessIntelligence

dn: ou=DataArchitecture,dc=datalink,dc=cn
objectClass: organizationalUnit
ou: DataArchitecture

dn: ou=People,dc=datalink,dc=cn
ou: People
objectClass: top
objectClass: organizationalUnit

dn: ou=group,dc=datalink,dc=cn
ou: Group
objectClass: top
objectClass: organizationalUnit
```

Now add the above entry by using `ldapadd -x -D cn=dlink,dc=datalink,dc=cn -W -f baseldapdomain.ldif` command as shown below.

```shell
[root@localhost ~]# ldapadd -x -D cn=dlink,dc=datalink,dc=cn -W -f baseldapdomain.ldif
Enter LDAP Password:
adding new entry "dc=datalink,dc=cn"

adding new entry "cn=dlink,dc=datalink,dc=cn"

adding new entry "ou=Account,dc=datalink,dc=cn"

adding new entry "ou=BusinessIntelligence,dc=datalink,dc=cn"

adding new entry "ou=DataArchitecture,dc=datalink,dc=cn"

adding new entry "ou=People,dc=datalink,dc=cn"

adding new entry "ou=group,dc=datalink,dc=cn"

```



> Additional

```ini
dn: ou=People,dc=datalink,dc=cn
ou: People
objectClass: top
objectClass: organizationalUnit

dn: ou=group,dc=datalink,dc=cn
ou: Group
objectClass: top
objectClass: organizationalUnit
```

```shell
ldapadd -x -D cn=dlink,dc=datalink,dc=cn -W -f baseldapdomain2.ldif -h 127.0.0.1 -p 389  
```





#### **Step 11: Create a LDAP User**

In the next step, you need to create a user and set the password for that user. Here we are creating a user `cyberithub` by using `useradd cyberithub` command and then setting its password by using `passwd cyberithub` command as shown below.

```shell
[root@localhost ~]# useradd lhfei
[root@localhost ~]# passwd lhfei
Changing password for user cyberithub.
New password: [Lhfei]
Retype new password: [Lhfei]
passwd: all authentication tokens updated successfully.
```

 

#### **Step 12: Create LDAP Group Definitions**

You can use below ldif file to create Group Definitions.

```shell
[root@localhost ~]# vi ldapgroup.ldif
dn: cn=dlink,ou=DataArchitecture,dc=datalink,dc=cn
objectClass: top
objectClass: posixGroup
gidNumber: 1005
```

Then add the above group definition using `ldapadd -x -W -D "cn=dlink,dc=datalink,dc=cn" -f ldapgroup.ldif` command as shown below.

```shell
[root@localhost ~]# ldapadd -x -W -D "cn=dlink,dc=datalink,dc=cn" -f ldapgroup.ldif -h 127.0.0.1 -p 389
Enter LDAP Password: 
adding new entry "cn=dlink,ou=DataArchitecture,dc=datalink,dc=cn"
```

 

#### **Step 13: Create LDAP User Definitions**

You can use below ldif file to create User definitions.

```shell
[root@localhost ~]# vi ldapuser.ldif
dn: uid=lhfei,ou=DataArchitecture,dc=datalink,dc=cn
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
cn: lhfei
uid: lhfei
uidNumber: 1005
gidNumber: 1005
homeDirectory: /home/lhfei
userPassword: {SSHA}xzPLPRK1wB2usQBIyirOzwASZaMtbYt4
loginShell: /bin/bash
gecos: lhfei
shadowLastChange: 0
shadowMax: 0
shadowWarning: 0
```

Now Add the entry by using `ldapadd -x -D cn=dlink,dc=datalink,dc=cn -W -f ldapuser.ldif` command as shown below.

```shell
[root@localhost ~]# ldapadd -x -D cn=dlink,dc=datalink,dc=cn -W -f ldapuser.ldif -h 127.0.0.1 -p 389
Enter LDAP Password:
adding new entry "uid=lhfei,ou=DataArchitecture,dc=datalink,dc=cn"
```

 

#### **Step 14: Test OpenLDAP Server Authentication**

Now it is the time to test the OpenLDAP Server authentication by using `authconfig` command as shown below.

```shell
[root@localhost ~]# authconfig --enableldap --enableldapauth --ldapserver=ldap.datalink.cn --ldapbasedn="dc=datalink,dc=cn" --enablemkhomedir --update
```

You may have an error. Such as below:

```ini
authconfig: Authentication module /usr/lib64/security/pam_ldap.so is missing. Authentication process might not work correctly.
getsebool:  SELinux is disabled
```

You can update `SELINUX`  model in `/etc/selinux/config ` file to reslove it. For example:

```ini
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=permissive
# SELINUXTYPE= can take one of three two values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected. 
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted
```

