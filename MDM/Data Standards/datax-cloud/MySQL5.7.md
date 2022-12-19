> | dlink-app-01 | dlink-app-01 |
> | ------------ | ------------ |
> |              | data_cloud   |

- [x] data_cloud

```sql
CREATE DATABASE data_cloud
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

CREATE USER 'ds_admin'@'localhost' IDENTIFIED BY 'DSuser_1473';

-- MySql 5.7
GRANT ALL ON data_cloud.* TO 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';

-- MySQL 8
-- CREATE USER 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';
-- GRANT ALL ON data_cloud.* TO "ds_admin"@"localhost" WITH GRANT OPTION;
-- GRANT ALL ON data_cloud.* TO "ds_admin"@"%" WITH GRANT OPTION;

FLUSH PRIVILEGES;
```



```sql
CREATE DATABASE data_standards
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;
  
CREATE USER 'ds_admin'@'localhost' IDENTIFIED BY 'DSuser_1473';

GRANT ALL ON data_standards.* TO 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';

FLUSH PRIVILEGES;
```





```mermaid
```

