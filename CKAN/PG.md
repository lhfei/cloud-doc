



```shell
sudo -u postgres psql -l
```



```shell
sudo -u postgres createuser -S -D -R -P ckan_default

Enter password for new role: [CKANRoot01]
Enter it again: ...
```





```ini
sudo -u postgres createdb -O ckan_default ckan_default -E utf-8
```





> /export/var/lib/pgsql/15/data/postgresql.conf 

```ini
listen_addresses = 'localhost,dataos-00'
```



> /export/var/lib/pgsql/15/data/pg_hba.conf 

```ini
host    all             all              all                 md5
```



```shell

systemctl start postgresql-15
```

