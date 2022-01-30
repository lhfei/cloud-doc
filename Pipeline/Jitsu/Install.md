

### MySQL

```sql
CREATE DATABASE dcs_master
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'dcsadmin'@"localhost" IDENTIFIED BY 'Dcsuser_1473';
create user 'dcsadmin'@"%"         IDENTIFIED BY 'Dcsuser_1473';

grant all on dcs_master.* to "dcsadmin"@"localhost" with grant option;
grant all on dcs_master.* to "dcsadmin"@"%" with grant option;

FLUSH PRIVILEGES;
```



```ini
mysql> select host,user,plugin from user;
+-----------+------------------+-----------------------+
| host      | user             | plugin                |
+-----------+------------------+-----------------------+
| %         | dcsadmin         | caching_sha2_password |
| localhost | dcsadmin         | caching_sha2_password |
+-----------+------------------+-----------------------+
8 rows in set (0.00 sec)
```



```sql
ALTER USER 'dcsadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'Dcsuser_1473';
```

