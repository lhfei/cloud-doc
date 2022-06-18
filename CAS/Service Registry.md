# [Redis Service Registry](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html)

This service registry stores tickets in one or more [Redis](http://redis.io/) instances. The [spring data redis](http://projects.spring.io/spring-data-redis/) library used by this component presents Redis as a key/value store that accepts `String` keys and CAS service definition objects as values. The key is started with `CAS_SERVICE:`.

The Redis service registry supports Redis Sentinel, which provides high availability for Redis. In practical terms this means that using Sentinel you can create a Redis deployment that resists without human intervention to certain kind of failures. Redis Sentinel also provides other collateral tasks such as monitoring, notifications and acts as a configuration provider for clients.

Support is enabled by including the following dependency in the overlay:

- [Maven](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html#mavenorgapereocascasserversupportredisserviceregistry)
- [Gradle](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html#gradleorgapereocascasserversupportredisserviceregistry)
- [BOM](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html#bomorgapereocascasserversupportredisserviceregistry)
- [Resources ](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html#)

```
1 Copyimplementation "org.apereo.cas:cas-server-support-redis-service-registry:${project.'cas.version'}" 
```

The following settings and properties are available from the CAS configuration catalog:

- [Required](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html#requiredPropertiescasserviceregistryredis)
- [Optional](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html#optionalPropertiescasserviceregistryredis)
- 
- 
- 
- 
- 
- 
- 
- 
- [Notes](https://apereo.github.io/cas/6.4.x/services/Redis-Service-Management.html#notescasserviceregistryredis)

 The configuration settings listed below are tagged as *Required* in the CAS configuration metadata. This flag indicates that the presence of the setting may be needed to activate or affect the behavior of the CAS feature and generally should be reviewed, possibly owned and adjusted. If the setting is assigned a default value, you do not need to strictly put the setting in your copy of the configuration, but should review it nonetheless to make sure it matches your deployment expectations.





Show 5102550 entries

Search:

|                                                              |
| ------------------------------------------------------------ |
| `cas.service-registry.redis.sentinel.master=`Name of Redis server. `org.apereo.cas.configuration.model.support.redis.RedisSentinelProperties.` |
| `cas.service-registry.redis.port=6379`Redis server port. `org.apereo.cas.configuration.model.support.redis.RedisServiceRegistryProperties.` |
| `cas.service-registry.redis.pool.enabled=false`Enable the pooling configuration. `org.apereo.cas.configuration.model.support.redis.RedisPoolProperties.` |
| `cas.service-registry.redis.password=`Login password of the redis server. `org.apereo.cas.configuration.model.support.redis.RedisServiceRegistryProperties.` |
| `cas.service-registry.redis.host=localhost`Redis server host. `org.apereo.cas.configuration.model.support.redis.RedisServiceRegistryProperties.` |
| `cas.service-registry.redis.enabled=true`Whether the module is enabled or not, defaults to true. `org.apereo.cas.configuration.model.support.redis.RedisServiceRegistryProperties.` |
| `cas.service-registry.redis.database=0`Database index used by the connection factory. `org.apereo.cas.configuration.model.support.redis.RedisServiceRegistryProperties.` |
| `cas.service-registry.redis.cluster.password=`The cluster connection's password. `org.apereo.cas.configuration.model.support.redis.RedisClusterProperties.` |
| `cas.service-registry.redis.cluster.nodes[0].type=`Indicate the type/role of this node. Accepted values are: `MASTER, SLAVE`. `org.apereo.cas.configuration.model.support.redis.RedisClusterNodeProperties.` |
| `cas.service-registry.redis.cluster.nodes[0].replica-of=`Set the id of the master node. `org.apereo.cas.configuration.model.support.redis.RedisClusterNodeProperties.` |
| `cas.service-registry.redis.cluster.nodes[0].port=`Server's port number. `org.apereo.cas.configuration.model.support.redis.RedisClusterNodeProperties.` |
| `cas.service-registry.redis.cluster.nodes[0].host=`Server's host address. `org.apereo.cas.configuration.model.support.redis.RedisClusterNodeProperties.` |

Showing 1 to 12 of 12 entries

Previous1Next

## Auto Initialization

Upon startup and configuration permitting, the registry is able to auto initialize itself from default JSON service definitions available to CAS. See [this guide](https://apereo.github.io/cas/6.4.x/services/AutoInitialization-Service-Management.html) for more info.

|      |
| ---- |
|      |
|      |
|      |
|      |
|      |