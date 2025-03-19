

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





```shell
db.dfcf_sjzx_gdggcg.updateMany(
  { agdm: '600000' }, // 匹配条件：agdm等于'600000'
  [{ $set: { cjrq: { $toDate: "$cjrq" } } }] // 更新操作：将cjrq字段转换为日期时间类型
)


db.dfcf_sjzx_gdggcg.updateMany(
  { agdm: '600000' },
  [{ $set: { cjrq:  "$gxrq"} }]
)
```



update field `'cjrq'`: from `str` to `datetime` 

```shell
db.dfcf_sjzx_gdggcg.updateMany(
    {},
    [{ $set: { cjrq: { $toDate: "$cjrq" } } }]
)
```

