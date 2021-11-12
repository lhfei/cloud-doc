



```sql
CREATE USER kong; CREATE DATABASE kong OWNER kong; ALTER USER kong WITH password 'Kong_user_1473';
```



> .env

```ini
PORT=1337
NODE_ENV=production
KONGA_HOOK_TIMEOUT=120000
DB_ADAPTER=mysql
DB_URI=mysql://10.170.131.75:3306/konga
DB_USER=konga
DB_PASSWORD=Kongauser_1473
KONGA_LOG_LEVEL=warn
TOKEN_SECRET=some_secret_token
```





```shell
# for PostgreSQL
node ./bin/konga.js  prepare --adapter postgres --uri postgresql://localhost:5432/konga
```



```shell
# for MySQL
node ./bin/konga.js  prepare --adapter mysql --uri mysql://10.170.131.75:3306/konga

------------------------------------------------------------------------------------------------------------------
Preparing database...
(node:135404) [DEP0095] DeprecationWarning: timers.enroll() is deprecated. Please use setTimeout instead.
(node:135404) [DEP0126] DeprecationWarning: timers.active() is deprecated. Please use timeout.refresh() instead.
(node:135404) [DEP0096] DeprecationWarning: timers.unenroll() is deprecated. Please use clearTimeout instead.
```



