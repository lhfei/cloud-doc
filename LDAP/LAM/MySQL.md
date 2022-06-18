



```sql
CREATE DATABASE lam_master
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'lam_admin'@'localhost' IDENTIFIED BY 'Lamuser_1473';

GRANT ALL ON lam_master.* TO 'lam_admin'@'%' IDENTIFIED BY 'Lamuser_1473';

FLUSH PRIVILEGES;
```

