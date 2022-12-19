> mdm-thinker-00

- [x] data_cloud_base

  ```sql
  CREATE DATABASE data_cloud_base
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
  
  CREATE USER 'ds_admin'@'localhost' IDENTIFIED BY 'DSuser_1473';
  
  -- MySql 5.7
  --GRANT ALL ON data_cloud_base.* TO 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';
  
  -- MySQL 8
  CREATE USER 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';
  GRANT ALL ON data_cloud_base.* TO "ds_admin"@"localhost" WITH GRANT OPTION;
  GRANT ALL ON data_cloud_base.* TO "ds_admin"@"%"  WITH GRANT OPTION;
  
  FLUSH PRIVILEGES;
  ```

- [x] data_cloud

  ```sql
  CREATE DATABASE data_cloud
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
  
  -- CREATE USER 'ds_admin'@'localhost' IDENTIFIED BY 'DSuser_1473';
  
  -- MySql 5.7
  -- GRANT ALL ON data_cloud.* TO 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';
  
  -- MySQL 8
  CREATE USER 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';
  GRANT ALL ON data_cloud.* TO "ds_admin"@"localhost" WITH GRANT OPTION;
  GRANT ALL ON data_cloud.* TO "ds_admin"@"%" WITH GRANT OPTION;
  
  FLUSH PRIVILEGES;
  ```

  

- [x] data_cloud_quartz

  ```sql
  CREATE DATABASE data_cloud_quartz
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
  
  -- CREATE USER 'ds_admin'@'localhost' IDENTIFIED BY 'DSuser_1473';
  
  -- MySql 5.7
  -- GRANT ALL ON data_cloud_quartz.* TO 'ds_admin'@'%' IDENTIFIED BY 'DSuser_1473';
  
  -- MySQL 8
  GRANT ALL ON data_cloud_quartz.* TO "ds_admin"@"localhost" WITH GRANT OPTION;
  GRANT ALL ON data_cloud_quartz.* TO "ds_admin"@"%" WITH GRANT OPTION;
  
  FLUSH PRIVILEGES;
  ```

  

- [ ] 