



#### DB

```sql
CREATE DATABASE olap_kylin
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'kylinadmin'@'localhost' IDENTIFIED BY 'Kylinuser_1473';

GRANT ALL ON olap_kylin.* TO 'kylinadmin'@'%' IDENTIFIED BY 'Kylinuser_1473';

FLUSH PRIVILEGES;
```

