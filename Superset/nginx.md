superset.conf

```
location ~ ^/(superset|databaseview|csvtodatabaseview|chart|dashboard|sqllab|savedqueryview|csstemplateasyncmodelview|sliceasync|tablemodelview|druid*|slicemodelview|dashboardmodelview|static|login) {
  proxy_pass http://127.0.0.1:7008;
  index /;
  proxy_set_header Host $host;
}

location ~ ^/(users|roles|csstemplatemodelview|annotationlayermodelview) {
  proxy_pass http://127.0.0.1:7008;
  index /;
  proxy_set_header Host $host;
}
```



