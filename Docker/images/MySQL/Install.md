### Prepared

```shell
docker run -d -p 3306:3306 --privileged=true \
    -v /etc/my.cnf:/etc/my.cnf \
    -v /export/app_data/mysql:/var/lib/mysql \
    -v /export/app_logs/mysql/logs:/export/app_logs/mysql/logs \
    -e MYSQL_ROOT_PASSWORD=Lhfeilaile@01 \
    --name mysql-5.7.41 mysql-server:5.7.41 mysqld --user=root
```



```shell
docker container ls -a
```

```ini
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                                                  NAMES
5fd22b179e00   mysql:5.7.41   "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   mysql
```



### Export

```shell
docker export {CONTAINER_ID} > mysql-v5.7.41.tar
```

```ini
du -ah mysql-v5.7.41.tar 
639M    mysql-v5.7.41.tar
```



### Import

```shell
cat mysql-v5.7.41.tar | docker import - mysql-server:5.7.41
```

`docker images`

```ini
REPOSITORY     TAG       IMAGE ID       CREATED          SIZE
mysql-server   5.7.41    71b5e0718739   14 minutes ago   653MB
```

