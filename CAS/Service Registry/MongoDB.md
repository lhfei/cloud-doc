

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
    
    implementation "org.apereo.cas:cas-server-support-mongo-service-registry:${project.'cas.version'}"
}
```

Then to build it.



The following settings and properties are available from the CAS configuration catalog:

`/etc/cas/config/cas.properties`

```pr
cas.service-registry.mongo.client-uri=
cas.service-registry.mongo.collection=
cas.service-registry.mongo.database-name=
cas.service-registry.mongo.host=localhost
cas.service-registry.mongo.password=
cas.service-registry.mongo.port=27017
cas.service-registry.mongo.user-id=
```

