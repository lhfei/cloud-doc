



- [x] error: **cannot open Packages database in /var/lib/rpm**

  This is quite the messy situation. You may fix this by cleaning out rpm database. To fix this problem, try:

  ```sh
  # rm -f /var/lib/rpm/__db*
  # db_verify /var/lib/rpm/Packages
  # rpm --rebuilddb
  # yum clean all
  ```

  Verify that error has gone with the following yum command

  ```sh
  # yum update
  ```



- [x] **Host registration Failed**

```
NetUtil.py:96 - EOF occurred in violation of protocol (_ssl.c:579)
NetUtil.py:97 - SSLError: Failed to connect. Please check openssl library versions.
```

Add this content as below into `security` section:

```
[security]
force_https_protocol=PROTOCOL_TLSv1_2
```





- [x] error getting repository data for hdp-3.1 repository not found

```shell
/usr/bin/yum list available --showduplicates --disablerepo=* --enablerepo=HDP-GPL-3.1.4.0

```



```ini
>select * from repo_definition;

+----+------------+-----------+--------------------+
| id | repo_os_id | repo_name | repo_id            |
+----+------------+-----------+--------------------+
| 25 |          9 | HDP       | HDP-3.1            |
| 26 |          9 | HDP-GPL   | HDP-3.1-GPL        |
| 27 |          9 | HDP-UTILS | HDP-UTILS-1.1.0.22 |
+----+------------+-----------+--------------------+
```



```sql
update repo_definition set repo_id = 'HDP-3.1.4.0' where id = 25;
update repo_definition set repo_id = 'HDP-GPL-3.1.4.0' where id = 26;
update repo_definition set repo_id = 'HDP-UTILS-1.1.0.22' where id = 27;
```



```sql
[cloud_master]> select * from repo_definition;                                          
+----+------------+-----------+--------------------+
| id | repo_os_id | repo_name | repo_id            |
+----+------------+-----------+--------------------+
| 25 |          9 | HDP       | HDP-3.1.4.0        |
| 26 |          9 | HDP-GPL   | HDP-GPL-3.1.4.0    |
| 27 |          9 | HDP-UTILS | HDP-UTILS-1.1.0.22 |
+----+------------+-----------+--------------------+
```



> Can't create/write to file '/var/tmp/ibnTBNI8' (Errcode: 2)

1. check mysql config : my.cnf

   ```sql
    cat /etc/my.cnf | grep tmpdir
   ```

   I can't see anything in my `my.cnf`

2. add `tmpdir=/tmp` to `my.cnf` under `[mysqld]`

3. restart web/app and mysql server

   `/etc/init.d/mysqld restart`