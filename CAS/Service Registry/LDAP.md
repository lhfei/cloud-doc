

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
    
    implementation "org.apereo.cas:cas-server-support-ldap-service-registry:${project.'cas.version'}"
}
```

Then to build it.



The following settings and properties are available from the CAS configuration catalog:

`/etc/cas/config/cas.properties`

```pr
cas.service-registry.ldap.base-dn=
cas.service-registry.ldap.bind-credential=
cas.service-registry.ldap.bind-dn=
cas.service-registry.ldap.ldap-url=
cas.service-registry.ldap.search-filter=
```
