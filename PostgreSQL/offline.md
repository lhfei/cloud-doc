



### Required

```shell
yum install libicu libicu-devel
```



> install with order by:

```shell
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-libs-10.5-1PGDG.rhel7.x86_64.rpm 
warning: postgresql10-libs-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-libs-10.5-1PGDG.rhel################################# [100%]
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-10.5-1PGDG.rhel7.x86_64.rpm 
\warning: postgresql10-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-10.5-1PGDG.rhel7    ################################# [100%]
You have new mail in /var/spool/mail/root
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-server-10.5-1PGDG.rhel7.x86_64.rpm 
warning: postgresql10-server-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-server-10.5-1PGDG.rh################################# [100%]
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-contrib-10.5-1PGDG.rhel7.x86_64.rpm 
warning: postgresql10-contrib-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
Updating / installing...
   1:postgresql10-contrib-10.5-1PGDG.r################################# [100%]
[root@a01-r03-i164-159-515w64k postgresql]# rpm -ivh postgresql10-10.5-1PGDG.rhel7.x86_64.rpm
warning: postgresql10-10.5-1PGDG.rhel7.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 442df0f8: NOKEY
Preparing...                          ################################# [100%]
        package postgresql10-10.5-1PGDG.rhel7.x86_64 is already installed
```



### PostGis

```

```

