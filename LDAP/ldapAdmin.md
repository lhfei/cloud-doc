

# Install and Configure phpLDAPAdmin on CentOS 7 / Ubuntu 16.04

**phpLDAPAdmin** (aka PLA) is a web application for administering LDAP servers. It provides an easy way to manage LDAP servers over a web browser.  It is written in PHP language and is licensed under the GNU GPL.

Since it is a web application, this LDAP browser works on many platforms such as Ubuntu, Debian, Redhat derivatives, Fedora, openSUSE, FreeBSD, OpenBSD, and Solaris.

phpLDAPAdmin is the perfect tool for LDAP professionals and entry-level administrators.

Before installing phpLDAPAdmin,

**READ: Step by Step OpenLDAP Server Configuration on CentOS 7 / RHEL 7**

## Pre-requisites:

**On CentOS / RHEL:**

phpLDAPAdmin is not available in the main repository, so you need to **enable EPEL repository** for Redhat based derivatives.

```
### For RHEL 7 ###

# rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

### For CentOS 7 ###

# yum -y install epel-release
```

## Install phpLDAPAdmin:

Now you can install phpLDAPAdmin using “**yum**” on CentOS and “**apt-get**” on Ubuntu respectively.

```
### CentOS 7 / RHEL 7 ###

# yum install -y phpldapadmin

### Ubuntu 16.04 ###

$ sudo apt-get update
$ sudo apt-get install -y phpldapadmin
```

## Configure Apache virtual host on CentOS 7 / RHEL 7:

By default, phpLDAPAdmin places the web config file in **/etc/httpd/conf.d** directory; it has rules and access permission. phpLDAPAdmin can be accessed only from the **localhost (127.0.0.1)**, to change that; we have to edit the phpldapadmin.conf file.

In CentOS 7, web access is managed by **mod_authz_core.c** module; so regular allow or deny rules won’t work even if you modify.

```
# vi /etc/httpd/conf.d/phpldapadmin.conf
```

Update the configuration file shown like below. **Hash out the** **Red** and **Add the** **Green** **one**.

```
Alias /phpldapadmin /usr/share/phpldapadmin/htdocs
Alias /ldapadmin /usr/share/phpldapadmin/htdocs

usr/share/phpldapadmin/htdocs>
  <IfModule mod_authz_core.c>
    # Apache 2.4
    # Require local
    Require all granted
  IfModule>
  <IfModule !mod_authz_core.c>
    # Apache 2.2
    Order Deny,Allow
    Deny from all
    Allow from 127.0.0.1
    Allow from ::1
  </IfModule>
</Directory>

```

Start the apache service in CentOS 7 / RHEL 7.

```
# systemctl restart httpd.service
```

Configure the FirewallD to allow external machines to access the dashboard (CentOS / RHEL).

```
# firewall-cmd --permanent --zone=public --add-service=http
# firewall-cmd --reload
```

## Configure phpLDAPAdmin:

Now, setup phpLDAPadmin by modifying some of its configuration values.

```
### CentOS 7 / RHEL 7 ###

# vi /etc/phpldapadmin/config.php

### Ubuntu 16.04 ###

$ sudo nano /etc/phpldapadmin/config.php
```

A handy name that will appear in the left tree viewer and throughout phpLDAPadmin to identify this LDAP server to users.

```
$servers->setValue('server','name','ITzGeek Local LDAP Server');
```

If you are planning to manage the LDAP server other than **localhost** then you can modify the below parameter. **(Optional)**

```
$servers->setValue('server','host','127.0.0.1');
```

To connect to the LDAP server which listens on the non-standard port. **(Optional)**

```
$servers->setValue('server','port',389);
```

Array of base domain names of your LDAP server. ( **Must be set in Ubuntu 16.04**)

```
$servers->setValue('server','base',array('dc=itzgeek,dc=local'));
```

**On CentOS 7 / RHEL 7:**

**Uncomment the line 397 and comment out the 398**, like below.

```
$servers->setValue('login','attr','dn');
// $servers->setValue('login','attr','uid');
```

If you have **SELinux enabled on CentOS 7 / RHEL 7** then run this command.

```
# setsebool -P httpd_can_connect_ldap on
```

## Access phpLDAPAdmin:

Open up the web browser and navigate it to the following URL.

http://your-ip-add-ress/phpldapadmin

phpLDAPAdmin landing page will look like below.



































[@see](https://www.itzgeek.com/how-tos/linux/centos-how-tos/install-configure-phpldapadmin-centos-7-ubuntu-16-04.html)