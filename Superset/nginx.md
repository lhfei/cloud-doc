superset.conf

```
location ~ ^/(superset|databaseview|csvtodatabaseview|tablemodelview|druid*|slicemodelview|dashboardmodelview|static) {
    proxy_pass http://127.0.0.1:9088;
    index /;
    proxy_set_header Host $host;
}
```



