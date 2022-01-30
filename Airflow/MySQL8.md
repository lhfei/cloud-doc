



> MySQL 8

```sql
CREATE DATABASE cloud_airflow
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'airflowadmin'@"localhost" IDENTIFIED BY 'Airflowuser_1473';
create user 'airflowadmin'@"%"         IDENTIFIED BY 'Airflowuser_1473';

grant all on cloud_airflow.* to "airflowadmin"@"localhost" with grant option;
grant all on cloud_airflow.* to "airflowadmin"@"%" with grant option;

FLUSH PRIVILEGES;
```



> MySQL 5.7

```sql
CREATE DATABASE cloud_airflow
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_airflow'@'localhost' IDENTIFIED BY 'Airflowuser_1473';
GRANT ALL ON cloud_airflow.* TO 'cloud_airflow'@'10.182.2.88' IDENTIFIED BY 'Airflow_1473';

GRANT ALL ON cloud_airflow.* TO 'cloud_airflow'@'%' IDENTIFIED BY 'Airflowuser_1473';

FLUSH PRIVILEGES;
```

