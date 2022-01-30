

# yAPI







```sql
CREATE DATABASE yapi_master
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'yapiadmin'@"localhost" IDENTIFIED BY 'YApiuser_1473';
create user 'yapiadmin'@"%"         IDENTIFIED BY 'YApiuser_1473';

grant all on yapi_master.* to "yapiadmin"@"localhost" with grant option;
grant all on yapi_master.* to "yapiadmin"@"%" with grant option;

FLUSH PRIVILEGES;


ALTER USER 'yapiadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'YApiuser_1473';

FLUSH PRIVILEGES;


select host,user,plugin from mysql.user;

+-----------+------------------+-----------------------+
| host      | user             | plugin                |
+-----------+------------------+-----------------------+
| %         | jenkinsadmin     | mysql_native_password |
| localhost | jenkinsadmin     | caching_sha2_password |
| localhost | .........        | caching_sha2_password |
+-----------+------------------+-----------------------+
```

