#### 1. 查看所有数据库(在mongodb新版本里并没有admin数据库，但是并不妨碍第2步操作。)

```
show dbs
```

![img](https://img2018.cnblogs.com/blog/1336193/201908/1336193-20190829114802627-1173376086.png)

#### 2. 进入admin数据库

```
use admin
```

![img](https://img2018.cnblogs.com/blog/1336193/201908/1336193-20190829114812976-369380832.png)

#### 3. 创建管理员账户

```
db.createUser({ user: "admin", pwd: "password", roles: [{ role: "userAdminAnyDatabase", db: "admin" }] })
```

![img](https://img2018.cnblogs.com/blog/1336193/201908/1336193-20190829114821735-1603368404.png)

mongodb中的用户是基于身份role的，该管理员账户的 role是 userAdminAnyDatabase。admin用户用于管理账号，不能进行关闭数据库等操作。

#### 4. 创建root

```
db.createUser({user: "root",pwd: "password", roles: [ { role: "root", db: "admin" } ]})
```

![img](https://img2018.cnblogs.com/blog/1336193/201908/1336193-20190829114834295-178204325.png)

创建完admin管理员，创建一个超级管理员root。角色：root。root角色用于关闭数据库。

```
db.shutdownServer()
```

#### 5. 创建用户自己的数据库的管理角色

```
use yourdatabase
db.createUser({user: "user",pwd: "password",roles: [ { role: "dbOwner", db: "yourdatabase" } ]})
```

![img](https://img2018.cnblogs.com/blog/1336193/201908/1336193-20190829114843715-373549026.png)

role: "dbOwner"代表数据库所有者角色，拥有最高该数据库最高权限。比如新建索引等当账号管理员和超级管理员，可以为自己的数据库创建用户了。（坑）这时候一定，一定要切换到所在数据库上去创建用户，不然创建的用户还是属于admin。

如果是读写角色的话，权限设置为`role: "readWrite"`

#### 6. 查看用户

```
show users
```

#### 7. 删除用户

删除用户必须由账号管理员来删，所以，切换到admin角色

```
use admin
db.auth("admin","password")
```

删除单个用户

```
db.system.users.remove({user:"XXXXXX"})
```

删除所有用户

```
db.system.users.remove({})
```

可以使用：mongodb://youruser:yourpassword2@localhost/yourdatabase 来连接到你的mongo