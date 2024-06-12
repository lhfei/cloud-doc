

#### Connect

```shell
mongosh --port 27017
```

or

```shell
mongosh "mongodb://localhost:27017"
```



```ini
Current Mongosh Log ID: 65a762d218f5c449f0c49b76
Connecting to:          mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.1.1
Using MongoDB:          7.0.5
Using Mongosh:          2.1.1

For mongosh info see: https://docs.mongodb.com/mongodb-shell/
```



#### Show DB

```shell
test> show dbs
admin   40.00 KiB
config  12.00 KiB
local   40.00 KiB
```



#### Switch to `admin` DB

```shell
use admin
```

```ini
switched to db admin
```





```shell
db.createUser({ user: "admin", pwd: "Lhfei@GT4#Root$01", roles: [{ role: "userAdminAnyDatabase", db: "admin" }] })
```

```ini
{ ok: 1 }
```



```shell
admin> db.system.users.find()
```

```ini
admin> db.system.users.find()
[
  {
    _id: 'admin.admin',
    userId: UUID('e21ad624-3227-4ebd-94f0-c1aefb55089d'),
    user: 'admin',
    db: 'admin',
    credentials: {
      'SCRAM-SHA-1': {
        iterationCount: 10000,
        salt: 'L8+8qWh0PwvRAEpdoEKhIA==',
        storedKey: 'Fb01xvE0f9LutqDufwOzYt1jWPA=',
        serverKey: 'Dz/zvN5CcqxZBd0bZLOPWwqZ7kk='
      },
      'SCRAM-SHA-256': {
        iterationCount: 15000,
        salt: 'TVvBoSjkZjgzJoALseUtv6trFcTLU7JbR9q87w==',
        storedKey: 'tiPVDdJSMOByDyHSj22N1XRfT+tMm4Zmfmw2xjBV0IE=',
        serverKey: 'ysoThi8/wtZMLtpfEnt+rrGBAXXfBpxkB/aZvb0b7UY='
      }
    },
    roles: [ { role: 'userAdminAnyDatabase', db: 'admin' } ]
  }
]
```



```shell
db.createUser({user: "root",pwd: "Lhfei@GT4#Root$01", roles: [ { role: "root", db: "admin" } ]})
```





### [Create User](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/)

#### Create a role with appropriate privileges.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#create-a-role-with-appropriate-privileges)

In the `admin` database, [`create`](https://www.mongodb.com/docs/manual/reference/method/db.createRole/#mongodb-method-db.createRole) a new role with [`changeOwnPassword`](https://www.mongodb.com/docs/manual/reference/privilege-actions/#mongodb-authaction-changeOwnPassword) and [`changeOwnCustomData`.](https://www.mongodb.com/docs/manual/reference/privilege-actions/#mongodb-authaction-changeOwnCustomData)

```
use admin
db.createRole(
   { role: "changeOwnPasswordCustomDataRole",
     privileges: [
        { 
          resource: { db: "", collection: ""},
          actions: [ "changeOwnPassword", "changeOwnCustomData" ]
        }
     ],
     roles: []
   }
)
```



3

#### Add a user with this role.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#add-a-user-with-this-role)

In the `test` database, [`create`](https://www.mongodb.com/docs/manual/reference/method/db.createUser/#mongodb-method-db.createUser) a new user with the created `"changeOwnPasswordCustomDataRole"` role. For example, the following operation creates a user with both the built-in role [`readWrite`](https://www.mongodb.com/docs/manual/reference/built-in-roles/#mongodb-authrole-readWrite) and the user-created `"changeOwnPasswordCustomDataRole"`.



#### TIP

Starting in version 4.2 of the `mongo` shell, you can use the [`passwordPrompt()`](https://www.mongodb.com/docs/manual/reference/method/passwordPrompt/#mongodb-method-passwordPrompt) method in conjunction with various user authentication/management methods/commands to prompt for the password instead of specifying the password directly in the method/command call. However, you can still specify the password directly as you would with earlier versions of the `mongo` shell.

```
use test
db.createUser(
   {
     user:"user123",
     pwd: passwordPrompt(),  // or cleartext password
     roles:[ "readWrite", { role:"changeOwnPasswordCustomDataRole", db:"admin" } ] 
   }
)
```



To grant an existing user the new role, use [`db.grantRolesToUser()`.](https://www.mongodb.com/docs/manual/reference/method/db.grantRolesToUser/#mongodb-method-db.grantRolesToUser)

#### Procedure[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#procedure)

1

#### Connect with the appropriate privileges.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#connect-with-the-appropriate-privileges)

Connect to the [`mongod`](https://www.mongodb.com/docs/manual/reference/program/mongod/#mongodb-binary-bin.mongod) or [`mongos`](https://www.mongodb.com/docs/manual/reference/program/mongos/#mongodb-binary-bin.mongos) as a user with appropriate privileges.

For example, the following operation connects to MongoDB as `user123` created in the [Prerequisites](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#std-label-change-own-password-prereq) section.

```
mongosh --port 27017 -u user123 --authenticationDatabase 'test' -p
```



If you do not specify the password to the [`-p`](https://www.mongodb.com/docs/mongodb-shell/reference/options/#std-option-mongosh.--password) command-line option, [`mongosh`](https://www.mongodb.com/docs/mongodb-shell/#mongodb-binary-bin.mongosh) prompts for the password.

To check that you have the privileges specified in the [Prerequisites](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#std-label-change-own-password-prereq) section as well as to see user information, use the [`usersInfo`](https://www.mongodb.com/docs/manual/reference/command/usersInfo/#mongodb-dbcommand-dbcmd.usersInfo) command with the `showPrivileges` option.

2

#### Change your password and custom data.[![img](https://www.mongodb.com/docs/manual/assets/link.svg)](https://www.mongodb.com/docs/manual/tutorial/change-own-password-and-custom-data/#change-your-password-and-custom-data-1)

Use the [`db.updateUser()`](https://www.mongodb.com/docs/manual/reference/method/db.updateUser/#mongodb-method-db.updateUser) method to update the password and custom data.

For example, the following operation changes the user's password to `KNlZmiaNUp0B` and custom data to `{ title: "Senior Manager" }`:



#### TIP

Starting in version 4.2 of the `mongo` shell, you can use the [`passwordPrompt()`](https://www.mongodb.com/docs/manual/reference/method/passwordPrompt/#mongodb-method-passwordPrompt) method in conjunction with various user authentication/management methods/commands to prompt for the password instead of specifying the password directly in the method/command call. However, you can still specify the password directly as you would with earlier versions of the `mongo` shell.

```
use test
db.updateUser(
   "user123",
   {
      pwd: passwordPrompt(),  // or cleartext password
      customData: { title: "Senior Manager" }
   }
)
```



Enter the password when prompted.
