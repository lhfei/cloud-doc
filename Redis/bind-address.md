## Start Redis

```
src/redis-server redis.conf
```

## Stop | Shutdown Redis

```
redis-cli shutdown

pkill redis-server

killall -9 redis-server
```

DENIED Redis is running in protected mode because protected mode is enabled, no bind address was specified, no authentication password is requested to clients. In this mode connections are only accepted from the loopback interface. If you want to connect from external computers to Redis you may adopt one of the following solutions: 1) Just disable protected mode sending the command 'CONFIG SET protected-mode no' from the loopback interface by connecting to Redis from the same host the server is running, however MAKE SURE Redis is not publicly accessible from internet if you do so. Use CONFIG REWRITE to make this change permanent. 2) Alternatively you can just disable the protected mode by editing the Redis configuration file, and setting the protected mode option to 'no', and then restarting the server. 3) If you started the server manually just for testing, restart it with the '--protected-mode no' option. 4) Setup a bind address or an authentication password. NOTE: You only need to do one of the above things in order for the server to start accepting connections from the outside.; nested exception is redis.clients.jedis.exceptions.JedisDataException: DENIED Redis is running in protected mode because protected mode is enabled, no bind address was specified, no authentication password is requested to clients. In this mode connections are only accepted from the loopback interface. If you want to connect from external computers to Redis you may adopt one of the following solutions: 1) Just disable protected mode sending the command 'CONFIG SET protected-mode no' from the loopback interface by connecting to Redis from the same host the server is running, however MAKE SURE Redis is not publicly accessible from internet if you do so. Use CONFIG REWRITE to make this change permanent. 2) Alternatively you can just disable the protected mode by editing the Redis configuration file, and setting the protected mode option to 'no', and then restarting the server. 3) If you started the server manually just for testing, restart it with the '--protected-mode no' option. 4) Setup a bind address or an authentication password. NOTE: You only need to do one of the above things in order for the server to start accepting connections from the outside.


```
[root@node02 redis-4.0.7]# redis-server --protected-mode no
4497:C 29 Jan 16:42:04.132 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
4497:C 29 Jan 16:42:04.132 # Redis version=4.0.7, bits=64, commit=00000000, modified=0, pid=4497, just started
4497:C 29 Jan 16:42:04.132 # Configuration loaded
4497:M 29 Jan 16:42:04.133 * Increased maximum number of open files to 10032 (it was originally set to 1024).
4497:M 29 Jan 16:42:04.133 # Creating Server TCP listening socket *:6379: bind: Address already in use
```