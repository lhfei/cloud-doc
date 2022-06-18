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
    
    implementation "org.apereo.cas:cas-server-support-jpa-service-registry:${project.'cas.version'}"
}
```

Then to build it.



The following settings and properties are available from the CAS configuration catalog:

`/etc/cas/config/cas.properties`

```pr
cas.service-registry.jpa.driver-class=com.mysql.cj.jdbc.Driver
cas.service-registry.jpa.url=jdbc:mysql://10.170.234.141:3306/datalink_sso?useSSL=false
cas.service-registry.jpa.user=root
cas.service-registry.jpa.password=Lhfeilaile@01
cas.service-registry.jpa.ddl-auto=update
cas.jdbc.show-sql=true
cas.service-registry.jpa.dialect=org.hibernate.dialect.MySQL5Dialect
```

