

```sql
db.createUser({ user: "admin", pwd: "Lhfeilaile@01", roles: [{ role: "userAdminAnyDatabase", db: "admin" }] })
```



```sql
db.createUser({user: "root",pwd: "Lhfeilaile@01", roles: [ { role: "root", db: "admin" } ]})
```









```shell
# if db note exist, will be create
use yapi_master


db.createUser({user: "yapiadmin",pwd: "YApiuser_1473",roles: [ { role: "dbOwner", db: "yapi_master" } ]})


use yapi_master
```

