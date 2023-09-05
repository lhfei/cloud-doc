

#### Pull

```shell
docker pull nginx
```



#### Save

```shell
docker save -o nginx.tar nginx
```





#### Start

```shell
docker run -it --name nginx-server \
    -p 10000:10000 \
    -p 80:80 \
    -p 443:443 \
    -v /etc/nginx:/etc/nginx \
    -d nginx
```

| Image Name | IP       | Host port | Docker Port |
| ---------- | -------- | --------- | ----------- |
| Portal     | 10.0.0.1 | 10001     | 10000       |
| Nginx      | 10.0.0.1 | 80        | 80          |
| API-1      | 10.0.0.2 | 6201      | 6200        |
| API-2      | 10.0.0.3 | 6101      | 6100        |
| MySQL      | 10.0.0.4 | 3307      | 3306        |


