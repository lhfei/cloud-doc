### Host



Install Home

```shell
cd /export/cloud/dcs-master/dcs-server

tree

.
├── config
│   └── eventnative.yaml
├── eventnative
├── logs
└── web
    ├── inline.js
    ├── lib.js
    ├── track.js
    └── welcome.html
```





> eventnative.yaml

```yaml
server:
  name: instance1.domain.com
  port: 8081
  public_url: http://10.0.0.16
  log:
    path: /export/cloud/dcs-master/dcs-server/logs/
  metrics.prometheus.enabled: true

geo.maxmind_path: /export/cloud/dcs-master/dcs-server/config

log:
  path: /export/cloud/dcs-master/dcs-server/logs/events
  rotation_min: 5

sql_debug_log:
  ddl:
  queries:

api_keys:
  - id: my_website_key
    client_secret: '193b6281-f211-47a9-b384-102cf4cd2d55'
    server_secret: 'a6880b16-73d0-476e-840a-804b74f7684d'

destinations:
  redshift:
  bigquery:

sources:
  facebook:
  google_analytics:

users_recognition:
  enabled: true

coordination:
  type: redis

notifications:
  slack:
    url: https://slack_web_hook_url

meta:
  storage:
    redis:
      host: 10.0.0.16
      port: 6379
      password: DcsRedis@01
```



```shell
./eventnative -cfg /path/to/eventnative.yaml
```

