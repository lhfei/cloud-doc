Sinopia
=======


**Npm** private repository server.


```sh
Sinopia doesn't need superuser privileges. Don't run it under root.
1.4.0
[root@BDS-TEST-004 cloud]# sinopia
Sinopia doesn't need superuser privileges. Don't run it under root.
 warn  --- config file  - /root/.config/sinopia/config.yaml
 warn  --- http address - http://localhost:4873/

```

#### config full.yaml

```json
# path to a directory with all packages
storage: ./storage

# a list of users
#
# This could be deprecated soon, use auth plugins instead (see htpasswd below).
users:
  admin:
    # crypto.createHash('sha1').update(pass).digest('hex')
    password: a94a8fe5ccb19ba61c4c0873d391e987982fbbd3

web:
  # web interface is disabled by default in 0.x, will be enabled soon in 1.x
  # when all its issues will be fixed
  #
  # set this to `true` if you want to experiment with web ui now;
  # this has a lot of issues, e.g. no auth yet, so use at your own risk
  #enable: true

  title: Sinopia
  # logo: logo.png
  # template: custom.hbs

auth:
  htpasswd:
    file: ./htpasswd
    # Maximum amount of users allowed to register, defaults to "+inf".
    # You can set this to -1 to disable registration.
    #max_users: 1000

# a list of other known repositories we can talk to
uplinks:
  npmjs:
    url: https://registry.npmjs.org/

    # amount of time to wait for repository to respond
    # before giving up and use the local cached copy
    #timeout: 30s

    # maximum time in which data is considered up to date
    #
    # default is 2 minutes, so server won't request the same data from
    # uplink if a similar request was made less than 2 minutes ago
    #maxage: 2m

    # if two subsequent requests fail, no further requests will be sent to
    # this uplink for five minutes
    #max_fails: 2
    #fail_timeout: 5m

    # timeouts are defined in the same way as nginx, see:
    # http://wiki.nginx.org/ConfigNotation

packages:
  # uncomment this for packages with "local-" prefix to be available
  # for admin only, it's a recommended way of handling private packages
  #'local-*':
  #  access: admin
  #  publish: admin
  #  # you can override storage directory for a group of packages this way:
  #  storage: 'local_storage'

  '*':
    # allow all users to read packages (including non-authenticated users)
    #
    # you can specify usernames/groupnames (depending on your auth plugin)
    # and three keywords: "$all", "$anonymous", "$authenticated"
    access: $all

    # allow 'admin' to publish packages
    publish: admin

    # if package is not available locally, proxy requests to 'npmjs' registry
    proxy: npmjs

#####################################################################
# Advanced settings
#####################################################################

# if you use nginx with custom path, use this to override links
#url_prefix: https://dev.company.local/sinopia/

# You can specify listen address (or simply a port).
# If you add multiple values, sinopia will listen on all of them.
#
# Examples:
#
#listen:
# - localhost:4873            # default value
# - http://localhost:4873     # same thing
# - 0.0.0.0:4873              # listen on all addresses (INADDR_ANY)
# - https://example.org:4873  # if you want to use https
# - [::1]:4873                # ipv6
# - unix:/tmp/sinopia.sock    # unix socket

# Configure HTTPS, it is required if you use "https" protocol above.
#https:
#  key: path/to/server.key
#  cert: path/to/server.crt

# type: file | stdout | stderr
# level: trace | debug | info | http (default) | warn | error | fatal
#
# parameters for file: name is filename
#  {type: 'file', path: 'sinopia.log', level: 'debug'},
#
# parameters for stdout and stderr: format: json | pretty
#  {type: 'stdout', format: 'pretty', level: 'debug'},
logs:
  - {type: stdout, format: pretty, level: http}
  #- {type: file, path: sinopia.log, level: info}

# you can specify proxy used with all requests in wget-like manner here
# (or set up ENV variables with the same name)
#http_proxy: http://something.local/
#https_proxy: https://something.local/
#no_proxy: localhost,127.0.0.1

# maximum size of uploaded json document
# increase it if you have "request entity too large" errors
#max_body_size: 1mb

# Workaround for countless npm bugs. Must have for npm <1.14.x, but expect
# it to be turned off in future versions. If `true`, latest tag is ignored,
# and the highest semver is placed instead.
#ignore_latest_tag: false
```