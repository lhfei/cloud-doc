

```shell
sudo apt install php8.0-cli php8.0-common php8.0-imap php8.0-redis php8.0-snmp php8.0-xml
```





### DB

```sql
ALTER DATABASE mdm_master CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE tablename CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```





```shell
CREATE DATABASE mdm_master
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'mdmadmin'@"localhost" IDENTIFIED BY 'Mdmuser_1473';
create user 'mdmadmin'@"%" IDENTIFIED BY 'Mdmuser_1473';

grant all on mdm_master.* to "mdmadmin"@"localhost" with grant option;
grant all on mdm_master.* to "mdmadmin"@"%" with grant option;

FLUSH PRIVILEGES;
```

