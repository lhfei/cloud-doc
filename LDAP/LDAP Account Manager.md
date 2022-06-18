# [LAM - LDAP Account Manager](https://community.nethserver.org/t/lam-ldap-account-manager/5971)

LAM (LDAP Account Manager) is an LDAP management user interface, similar to phpLDAPadmin. I configured it to manage my local Samba4 AD accounts provider.

**Note**: I installed also Roundcube, some PHP dependencies could be pulled by it.

-1- Download the Fedora/CentOS RPM from [https://www.ldap-account-manager.org/lamcms/releases](https://www.ldap-account-manager.org/lamcms/releases)

-2- Install the RPM

```
yum localinstall ldap-account-manager-6.7-0.fedora.1.noarch.rpm
```

z-3- Go to `https://<serverip>/lam`, click on LAM configuration





Pasted image985×465 22.3 KB



-4- Click “Edit server profiles”, the default password is `lam`





Pasted image1139×346 17.9 KB



-5- In a shell type the following command to get the current NethServer setup:

```
[root@vm5 ~]# account-provider-test dump
{
   "startTls" : "",
   "bindUser" : "VM5$",
   "userDN" : "dc=dpnet,dc=nethesis,dc=it",
   "port" : 636,
   "isAD" : "1",
   "host" : "dpnet.nethesis.it",
   "groupDN" : "dc=dpnet,dc=nethesis,dc=it",
   "isLdap" : "",
   "ldapURI" : "ldaps://dpnet.nethesis.it",
   "baseDN" : "dc=dpnet,dc=nethesis,dc=it",
   "bindPassword" : "secret",
   "bindDN" : "DPNET\\VM5$"
}
```

-6.a- Copy the values above in the server profile form

![img](https://community.nethserver.org/uploads/db8506/original/2X/7/7c0b0a2b2e75cdce479f9fd1af64dc371352b7f0.png)

-6.b- Scroll down, fill security settings and save

![img](https://community.nethserver.org/uploads/db8506/original/2X/2/2dee1ec943f702dc096a3038b7da7aff0ebc0ce6.png)

-7.a- Go to “Account types” tab, and fill the form like the following screenshot. Then save





Pasted image988×529 36.7 KB



-7.b- Edit the “Modules” tab, by selecting windows modules, then save





Pasted image815×1119 101 KB



-8.a- After saving, the login form is displayed.





Pasted image936×559 36.1 KB



-8.b- Log in as “admin/adminpass”. This is the result





Pasted image1891×576 62.5 KB



------

Additional information is on TFM:

[https://www.ldap-account-manager.org/static/doc/ ](https://www.ldap-account-manager.org/static/doc/)