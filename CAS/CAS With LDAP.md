```shell
cd $JAVA_HOME

$ ./bin/keytool -genkey -alias cas -keyalg RSA -keypass DataLink -storepass DataLink -keystore cas.jks

What is your first and last name?
  [Unknown]:  Hefei Li
What is the name of your organizational unit?
  [Unknown]:  DLink
What is the name of your organization?
  [Unknown]:  DLink
What is the name of your City or Locality?
  [Unknown]:  Beijing
What is the name of your State or Province?
  [Unknown]:  Beijing
What is the two-letter country code for this unit?
  [Unknown]:  CN
Is CN=Hefei Li, OU=DLink, O=DLink, L=Beijing, ST=Beijing, C=CN correct?
  [no]:  yes
```



```shell
./bin/keytool -export -alias cas -storepass DataLink -file cas.cer -keystore cas.jks

# output as below
Certificate stored in file <cas.cer>
```



```shell
./bin/keytool -importkeystore -v -trustcacerts \
    -srckeystore cas.jks \
    -srcalias cas \
    -srckeypass DataLink \
    -deststorepass DataLink \
    -noprompt 

Importing keystore cas.jks to /root/.keystore...
Enter destination keystore password:  
Re-enter new password: 
Enter source keystore password:  
[Storing /root/.keystore]
```





```shell
cp cas.jks /etc/cas/thekeystore 
```





```shell
java -jar cas.war -Djavax.net.ssl.trustStore=/etc/cas/thekeystore -Djavax.net.ssl.trustStoreType=PKCS12 -Djavax.net.ssl.trustStorePassword=DataLink
```



## CAS Integrated LDAP

### 1 CAS Install

#### 1.1 Create Keystore

```shell
keytool -genkey -keyalg RSA -alias thekeystore -keystore thekeystore -storepass DataLink -validity 360 -keysize 2048
```



```ini
What is your first and last name?
  [Unknown]:  Data Link
What is the name of your organizational unit?
  [Unknown]:  datalink
What is the name of your organization?
  [Unknown]:  dlink
What is the name of your City or Locality?
  [Unknown]:  Beijing
What is the name of your State or Province?
  [Unknown]:  Beijing
What is the two-letter country code for this unit?
  [Unknown]:  cn
Is CN=Data Link, OU=datalink, O=dlink, L=Beijing, ST=Beijing, C=cn correct?
  [no]:  yes
```



List Store

```shell
./bin/keytool -list -v -keystore thekeystore -storepass DataLink
```



#### 1.2 Exports certificate

```shell
$ ./bin/keytool -export -alias thekeystore -storepass DataLink -file thekeystore.cer -keystore thekeystore

# output as below
Certificate stored in file <thekeystore.cer>
```



```shell
./bin/keytool -exportcert -keystore thekeystore -storepass DataLink -alias thekeystore -file thekeystore.cer -rfc
```





Copy the `thekeystore.cer` file into `/etc/cas/`

```shell
cp cas.jks /etc/cas/
```



#### 1.3 Import certificate 

```shell
keytool -importcert -noprompt -storepass DataLink -keystore the -alias thekeystore -file thekeystore.cer -storetype PKCS12
```



```shell
keytool -importkeystore -srckeystore thekeystore -destkeystore $JAVA_HOME/lib/security/cacerts
```

```ini
keytool -importkeystore -srckeystore thekeystore -destkeystore $JAVA_HOME/lib/security/cacerts
Importing keystore thekeystore to /export/cloud/jdk-11.0.12/lib/security/cacerts...
Enter destination keystore password:  [changeit]
Enter source keystore password:  [DataLink]
Entry for alias thekeystore successfully imported.
Import command completed:  1 entries successfully imported, 0 entries failed or cancelled

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore /export/cloud/jdk-11.0.12/lib/security/cacerts -destkeystore /export/cloud/jdk-11.0.12/lib/security/cacerts -deststoretype pkcs12".
```



### 2 Build Source

LDAP integration is enabled by including the following dependency in the overlay:

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
    
    implementation "org.apereo.cas:cas-server-support-ldap:${project.'cas.version'}"
}
```

Then to build it.

```shell
./gradlew clean build --stacktrace --info
```



### 3 Configuration

1. {cas_server}/src/main/resources/application.yml

```yaml
# Application properties that need to be
# embedded within the web application can be included here
server:
  ssl:
    key-store-password: DataLink
    key-store: file:/etc/cas/thekeystore
    key-password: DataLink
  servlet:
    context-path: /dl-sso
  port: '8143'
```



1. {cas_server}/etc/cas/config/cas.properties

```properties
cas.server.name=https://host-11-80-19-184:8143
cas.server.prefix=${cas.server.name}/cas

logging.config=file:/etc/cas/config/log4j2.xml

# cas.authn.accept.enabled=false
cas.authn.accept.users=admin::MLink@01
```

**Please note that the value of \*cas.standalone.configurationDirectory\* is an absolute path**. We can now go to *https://localhost:8143/dl-sso* and log in with username *admin* and password *MLink@01*.



### 4 Start Server

```shell
./gradlew run --stacktrace --info
  -Dorg.gradle.java.home=$JAVA_HOME
  -Pargs="-Dcas.standalone.configurationDirectory=/etc/cas/config"
```



### 5 LDAP

```properties
cas.server.name=https://host-11-80-19-184:8143
cas.server.prefix=${cas.server.name}/dl-sso

logging.config=file:/etc/cas/config/log4j2.xml

# cas.authn.accept.enabled=false
#cas.authn.accept.users=admin::MLink@01

logging.level.org.apereo.cas=DEBUG

# don't allow login of built-in users
cas.authn.accept.users=

cas.tgc.crypto.encryption.key=
cas.tgc.crypto.signing.key=
cas.webflow.crypto.signing.key=
cas.webflow.crypto.encryption.key=

# Define attributes to be retrieved from LDAP as part of the same authentication transaction
# The left-hand size notes the source while the right-hand size indicate an optional renaming/remapping
# of the attribute definition. The same attribute name is allowed to be mapped multiple times to
# different attribute names.
cas.authn.ldap[0].principal-attribute-list=sn,cn:commonName,givenName,eduPersonTargettedId:SOME_IDENTIFIER

cas.authn.ldap[0].collect-dn-attribute=false
cas.authn.ldap[0].principal-dn-attribute-name=principalLdapDn
cas.authn.ldap[0].allow-multiple-principal-attribute-values=true
cas.authn.ldap[0].allow-missing-principal-attribute-value=true
cas.authn.ldap[0].credential-criteria=


ldap-url=ldap://10.0.41.74:389
ldap-dnformat=uid=%s,ou=People,dc=sugon,dc=com
ldap-base-dn=dc=sugon,dc=com
ldap-bind-dn=cn=ldapadm,dc=sugon,dc=com
ldap-bind-credential=root;123

cas.authn.ldap[0].password-policy.groovy.location=
cas.authn.ldap[0].principal-transformation.groovy.location=
cas.authn.ldap[0].base-dn=${ldap-base-dn}
cas.authn.ldap[0].bind-dn=${ldap-bind-dn}
cas.authn.ldap[0].bind-credential=${ldap-bind-credential}
cas.authn.ldap[0].dn-format=${ldap-dnformat}
cas.authn.ldap[0].ldap-url=${ldap-url}
cas.authn.ldap[0].search-filter=(uid={user})
cas.authn.ldap[0].type=DIRECT
cas.authn.ldap[0].password-encoder.encoding-algorithm=SHA
cas.authn.ldap[0].password-encoder.type=NONE
```



