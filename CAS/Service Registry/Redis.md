

Append ldap-suppoert to `{cas_server}/build.gradle` as below:

```groovy
dependencies {
    /**
     * CAS dependencies and modules may be listed here.
     *
     * There is no need to specify the version number for each dependency
     * since versions are all resolved and controlled by the dependency management
     * plugin via the CAS bom.
     **/
    
    implementation "org.apereo.cas:cas-server-support-redis-service-registry:${project.'cas.version'}"
}
```

Then to build it.



The following settings and properties are available from the CAS configuration catalog:

`/etc/cas/config/cas.properties`

```pr
cas.service-registry.redis.sentinel.master=dcs-45
cas.service-registry.redis.port=6379
cas.service-registry.redis.pool.enabled=false
cas.service-registry.redis.password=DcsRedis@01
cas.service-registry.redis.host=116.196.83.45
cas.service-registry.redis.enabled=true
cas.service-registry.redis.database=0

cas.service-registry.redis.cluster.password=DcsRedis@01
cas.service-registry.redis.cluster.nodes[0].type=MASTER
cas.service-registry.redis.cluster.nodes[0].replica-of=
cas.service-registry.redis.cluster.nodes[0].port=6379
cas.service-registry.redis.cluster.nodes[0].host=116.196.83.45
```

