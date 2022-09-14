



```sql
CREATE DATABASE metrics_link
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'mlink_user'@'localhost' IDENTIFIED BY 'MLinkuser_1473';

GRANT ALL ON metrics_link.* TO 'mlink_user'@'%' IDENTIFIED BY 'MLinkuser_1473';

FLUSH PRIVILEGES;
```

