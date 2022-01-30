

### Build

```shell
```





### DB

```sql
CREATE DATABASE jflow_master
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'jflowdmin'@"localhost" IDENTIFIED BY 'JFlowuser_1473';
create user 'jflowdmin'@"%"         IDENTIFIED BY 'JFlowuser_1473';

grant all on jflowdmin.* to "dagadmin"@"localhost" with grant option;
grant all on jflowdmin.* to "dagadmin"@"%" with grant option;

FLUSH PRIVILEGES;
```



```sql

```



