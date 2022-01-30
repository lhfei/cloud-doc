### DB

```sql
CREATE DATABASE dag_master
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'dagadmin'@"localhost" IDENTIFIED BY 'Daguser_1473';
create user 'dagadmin'@"%"         IDENTIFIED BY 'Daguser_1473';

grant all on dag_master.* to "dagadmin"@"localhost" with grant option;
grant all on dag_master.* to "dagadmin"@"%" with grant option;

FLUSH PRIVILEGES;
```



```sql
ALTER USER 'dagadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'Daguser_1473';

FLUSH PRIVILEGES;


select host,user,plugin from mysql.user;

+-----------+------------------+-----------------------+
| host      | user             | plugin                |
+-----------+------------------+-----------------------+
| %         | dagadmin         | mysql_native_password |
| localhost | dagadmin         | caching_sha2_password |
| localhost | .........        | caching_sha2_password |
+-----------+------------------+-----------------------+
```



