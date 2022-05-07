

### DB

```ini
data-thinker-0	10.0.0.19
```



```sql
CREATE DATABASE cas_master
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'cas_admin'@'localhost' IDENTIFIED BY 'Casuser_1473';

GRANT ALL ON cas_master.* TO 'cas_admin'@'%' IDENTIFIED BY 'Casuser_1473';

FLUSH PRIVILEGES;
```

