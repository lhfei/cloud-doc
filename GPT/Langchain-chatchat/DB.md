

> dataos-13

```sql
CREATE DATABASE gpt_idata
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'idatauser'@'localhost' IDENTIFIED BY 'IDatauser_1473';
CREATE USER 'idatauser'@'%' IDENTIFIED BY 'IDatauser_1473';

# for MySQL 8 and later
GRANT ALL ON gpt_idata.* TO "idatauser"@"localhost" WITH GRANT OPTION;
GRANT ALL ON gpt_idata.* TO "idatauser"@"%"  WITH GRANT OPTION;

FLUSH PRIVILEGES;
```

