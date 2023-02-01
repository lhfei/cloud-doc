

#### Create User

```shell
rabbitmqctl add_user admin DSuser_1473
```



#### Set Psermissions

```shell
rabbitmqctl set_user_tags admin administrator
```





#### List User

```shell
rabbitmqctl list_users
```





#### Assign User Permissions on a Virtual Host

```shell
sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
```

