

```
su - postgres 
```



```
createdb pio
```



```
psql -c "create user pio with password 'polaris'"
```



```
CREATE DATABASE polaris_ml_pio
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;


CREATE USER 'polaris_pio'@'localhost' IDENTIFIED BY 'polaris_pio_1473';

GRANT ALL ON polaris_pio.* TO 'polaris_ml_pio'@'172.19.164.154' identified by 'polaris_pio_1473';

GRANT ALL ON polaris_pio.* TO 'polaris_ml_pio'@'%' identified by 'polaris_pio_1473';
```

