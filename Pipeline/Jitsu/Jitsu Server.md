# CONFIGURATION FILE

If **Jitsu Server** is deployed in a standlone mode, it should be configured via single YAML file (read more about deployment options [here](https://jitsu.com/docs/deployment/)). We follow [convention over configuration](https://en.wikipedia.org/wiki/Convention_over_configuration) so the majority of parameters are optional. To get a base file, clone it from [GitHub](https://github.com/jitsucom/jitsu/blob/master/server/appconfig/config.template.yaml). **Jitsu Server** can be used either with [Redis](https://redis.io/) or not. Redis version 5 and higher is supported. Storage is required for some features (but if youwould like to work without them, then Redis configuration can be omitted):

- Last events caching (see [Events Cache](https://jitsu.com/docs/other-features/events-cache))
- Sources synchronization (see [Sources Configuration](https://jitsu.com/docs/sources-configuration/))
- [Retroactive Users Recognition](https://jitsu.com/docs/other-features/retroactive-user-recognition)
- [Coordination](https://jitsu.com/docs/other-features/scaling-eventnative).

Our config file consists of the following sections:

- `server` — General configuration parameters such as port, application logs configuration, singer bridge configuration, etc.
- `geo` — Geo resolution data (extracting city/state information from the IP address). We currently only support [MaxMind](https://www.maxmind.com/en/home) as a data provider. see [Geo Data resolution](https://jitsu.com/docs/other-features/geo-data-resolution)
- `log` — Jitsu writes all events locally and sends them to their destinations (in batch mode). This is where you configure your local temporary path and push frequency.
- `sql_debug_log` — All SQL statements such as DDL and DML expressions can be stored in separated log files or in stdout. see [SQL Query Logs](https://jitsu.com/docs/configuration/sql-query-logs)
- `api_keys` — A set of API Keys objects that identify incoming events JSONs and mapping between destinations is done based on them. see [Authorization](https://jitsu.com/docs/configuration/authorization) page
- `destinations` — A set of targets where the final version of events will be stored. see [Destinations Configuration](https://jitsu.com/docs/destinations-configuration)
- `sources` — A set of data sources to synchronize from. see [Sources Configuration](https://jitsu.com/docs/sources-configuration)
- `users_recognition` — Jitsu can update past events with user identifiers on user's identification event! see [Retroactive Users Recognition](https://jitsu.com/docs/other-features/retroactive-user-recognition)
- `coordination` — coordination service configuration. It is used in cluster Jitsu deployments. see [Scaling Jitsu](https://jitsu.com/docs/other-features/scaling-eventnative)
- `notifications` — notifier configuration. Server starts, system errors, and panics information will be sent to it. Currently, only Slack notifications are supported.
- `meta.storage` - meta storage is the main application storage and it is required for some features. At present Jitsu supports only Redis version 5 and higher.

**Example**:

```
server:
  name: instance1.domain.com
  port: 8081
  public_url: https://instances.domain.com
  log:
    path: /home/eventnative/data/logs/
  metrics.prometheus.enabled: true

geo.maxmind_path: /home/eventnative/data/config

log:
  path: /home/eventnative/data/logs/events
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
      host: redis_host
      port: 6379
      password: secret_password
```





You can set ${env.OS_ENV_VAR_NAME} to any configuration parameter in YAML file. Jitsu will get the value from OS ENV (with name OS_ENV_VAR_NAME from the example).



### Server

All fields from the **server** section are optional:

| Field                               | Type    | Description                                                  | Default value                          |
| :---------------------------------- | :------ | :----------------------------------------------------------- | :------------------------------------- |
| **name**                            | string  | Unique instance name. It is used in cluster deployments.     | **unnamed-server**                     |
| **port**                            | int     | TCP port for the server to listen on.                        | `8001`                                 |
| **public_url**                      | string  | Service public URL. It is used on the [welcome HTML page](https://jitsu.com/docs/sending-data/javascript-reference/#quickstart). Required in [Heroku deployment](https://jitsu.com/docs/deployment/deploy-on-heroku). | Will be got from `Host` request header |
| **log.path**                        | string  | Path to application logs. If not set, app logs will be in stdout. | -                                      |
| **log.rotation_min**                | int     | Log files rotation minutes. If **log.path** is configured.   | -                                      |
| **api_keys_reload_sec**             | int     | If an URL is set in **api_keys** section, authorization will be reloaded every **api_keys_reload_sec** seconds. see [Authorization](https://jitsu.com/docs/configuration/authorization#http-url) page. | `1`                                    |
| **destinations_reload_sec**         | int     | If an URL is set in **destinations** section, destinations will be reloaded every **destinations_reload_sec** seconds. see [Destinations](https://jitsu.com/docs/configuration/destinations-configuration). | `1`                                    |
| **sources_reload_sec**              | int     | If an URL is set in **sources** section, sources will be reloaded every **sources_reload_sec** seconds. see [Sources](https://jitsu.com/docs/sources-configuration). | `1`                                    |
| **admin_token**                     | string  | see [Admin Endpoints](https://jitsu.com/docs/other-features/admin-endpoints) page. | -                                      |
| **metrics.prometheus.enabled**      | boolean | see [Application Metrics](https://jitsu.com/docs/other-features/application-metrics) page. | `false`                                |
| **telemetry.disabled.usage**        | boolean | Flag for disabling telemetry. **Jitsu** collects usage metrics about how you use it and how it is working. **We don't collect any customer data**. | `false`                                |
| **disable_version_reminder**        | boolean | Flag for disabling log reminder banner about new **Jitsu** versions availability. | `false`                                |
| **sync_tasks.store_logs.last_runs** | int     | Logs for how many task runs must be kept in meta storage. Controlled on Source's collection level. When number of task runs for Source collection exceed provided value – old records get removed from meta storage. | `-1` unlimited number of logs          |

### Log

**Jitsu Server** supports destinations in streaming and batch modes. In the case of batch mode, all events are stored in JSON log files locally to **path** directory, and every **rotation_min** minutes they are processed and pushed to destinations. All fields from **log** section are optional:

| Field              | Type    | Description                                                  | Default value                        |
| :----------------- | :------ | :----------------------------------------------------------- | :----------------------------------- |
| **path**           | string  | Events log files path.                                       | `/home/eventnative/data/logs/events` |
| **rotation_min**   | int     | Log files rotation minutes.                                  | `5`                                  |
| **show_in_server** | boolean | Flag for debugging. If true - all events JSON data is written in app logs. |                                      |