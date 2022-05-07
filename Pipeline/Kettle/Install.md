



### DB



```sql
CREATE DATABASE kettle_manager
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'kettle_admin'@'localhost' IDENTIFIED BY 'Kettleuser_1473';

GRANT ALL ON kettle_manager.* TO 'kettle_admin'@'%' IDENTIFIED BY 'Kettleuser_1473';

FLUSH PRIVILEGES;
```

