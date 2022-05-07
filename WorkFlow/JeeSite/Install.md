

# Install Guide

#### 1 Create DB

```sql
CREATE DATABASE eip_base
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'eip_user'@'localhost' IDENTIFIED BY 'Eipuser_1473';

GRANT ALL ON eip_base.* TO 'eip_user'@'%' IDENTIFIED BY 'Eipuser_1473';

FLUSH PRIVILEGES;
```

