### MongoDB

> dataos-23

#### Connect 

```shell
mongosh --port 27117
```





#### Create DB

```shell
use se_opinion
```



```shell
db.createUser({user: "segpt_admin",pwd: "SEGPTuser_1473",roles: [ { role: "dbOwner", db: "se_opinion" } ]})
```

