# Kong



### Install

- [Ubuntu](Ubuntu.md)





Switching user

```shell
psql -U {user_name}
```

Switching database

```
template1-# \c kong
psql (10.1, server 9.6.6)
You are now connected to database "kong" as user "postgres".
```

Listing Databases

```
template1-# \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 kong      | kong     | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
```

Listing Tables

```shell
kong-# \dt
                   List of relations
 Schema |             Name              | Type  | Owner 
--------+-------------------------------+-------+-------
 public | acls                          | table | kong
 public | apis                          | table | kong
 public | basicauth_credentials         | table | kong
 public | cluster_events                | table | kong
 public | consumers                     | table | kong
 public | hmacauth_credentials          | table | kong
 public | jwt_secrets                   | table | kong
 public | keyauth_credentials           | table | kong
 public | oauth2_authorization_codes    | table | kong
 public | oauth2_credentials            | table | kong
 public | oauth2_tokens                 | table | kong
 public | plugins                       | table | kong
 public | ratelimiting_metrics          | table | kong
 public | response_ratelimiting_metrics | table | kong
 public | schema_migrations             | table | kong
 public | ssl_certificates              | table | kong
 public | ssl_servers_names             | table | kong
 public | targets                       | table | kong
 public | ttls                          | table | kong
 public | upstreams                     | table | kong
(20 rows)
```

