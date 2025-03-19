

### DB

```sql
CREATE DATABASE dataos_answer
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'anseradmin'@"localhost" IDENTIFIED BY 'DataOSAnsweruser_1473';
create user 'anseradmin'@"%"         IDENTIFIED BY 'DataOSAnsweruser_1473';

grant all on dataos_answer.* to "anseradmin"@"localhost" with grant option;
grant all on dataos_answer.* to "anseradmin"@"%" with grant option;

FLUSH PRIVILEGES;
```

