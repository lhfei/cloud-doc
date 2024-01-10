



>rpmdb: BDB0113 Thread/process 11032/140316145407808 failed: BDB1507 Thread died in Berkeley DB library

```ini
(base) [root@dlink-daas-11 ~]# yum update -y
error: rpmdb: BDB0113 Thread/process 11032/140316145407808 failed: BDB1507 Thread died in Berkeley DB library
error: db5 error(-30973) from dbenv->failchk: BDB0087 DB_RUNRECOVERY: Fatal error, run database recovery
error: cannot open Packages index using db5 -  (-30973)
error: cannot open Packages database in /var/lib/rpm
```

Please follow these steps to backup and rebuild the rpmdb database:

```shell
mkdir /var/lib/rpm/backup
cp -a /var/lib/rpm/__db* /var/lib/rpm/backup/
rm -f /var/lib/rpm/__db.[0-9][0-9]*
rpm --quiet -qa
rpm --rebuilddb
yum clean all
```

