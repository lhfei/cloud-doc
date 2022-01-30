# CONFIGURATION FILE

If **Jitsu Configurator** is deployed in a standlone mode, it should be configured via single YAML file (read more about deployment options [here](https://jitsu.com/docs/deployment/)).

Jitsu Configurator config file consists of the following sections:

- `server` — General configuration parameters such as port, application logs configuration, CORS, etc.
- `jitsu` — Jitsu Server address configuration. Configurator UI proxies some requests from UI to Jitsu Server via Configurator e.g. getting Live events and Statistics data or Destinations Test requests.
- `auth` — UI Authorization storage configuration. Storage for storing UI authorization flow data.
- `storage` — Main Storage. Configurator UI stores all users configuration such as configured destinations, api keys, sources into the storage.
- `notifications` — notifier configuration. Configurator starts, system errors, and panics information will be sent to it. Currently, only Slack notifications are supported.

**Example**:

```yaml
server:
  name: instance1.domain.com
  port: 7000
  allowed_domains:
  #CORS configuration
  #{{APP_TLD} is a macros for Application Top Level Domain
    - '{{APP_TLD}}'
    - 'localhost'
  auth: 'demo___please_provide_value_in_production___'

jitsu:
  base_url: 'http://your_jitsu_server_url'
  #token from Jitsu Server server.admin_token section of yaml configuration
  admin_token: 'demo___please_provide_value_in_production___'

notifications:
  slack:
    url: https://slack_web_hook_url

storage:
  redis:
    host: redis_host
    port: 6379
    password: secret_password

auth:
  redis:
    host: redis_host
    port: 6379
    password: secret_password
    #JWT secrets
    access_secret: 'demo___please_provide_value_in_production___'
    refresh_secret: 'demo___please_provide_value_in_production___'
```