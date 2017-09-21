CAS
===


### Generate Keystore

```sh
$ ./keytool -genkey -alias thekeystore -keyalg RSA -keypass changeit -storepass changeit -keystore thekeystore.jks


What is your first and last name?
  [Unknown]:  cas.example.org
What is the name of your organizational unit?
  [Unknown]:  Example
What is the name of your organization?
  [Unknown]:  Org
What is the name of your City or Locality?
  [Unknown]:  BJ
What is the name of your State or Province?
  [Unknown]:  BJ
What is the two-letter country code for this unit?
  [Unknown]:  US
Is CN=cas.example.org, OU=Example, O=Org, L=BJ, ST=BJ, C=US correct?
  [no]:  yes
```

### Export keystore

```sh
$ keytool -export -alias thekeystore -keystore thekeystore.jks -storepass changeit -file thekeystore.cer
```

### Copy the `thekeystore.jks` file into ```/etc/cas/```

```sh
cp thekeystore.jks /etc/cas/thekeystore
```

### Verify the Kyestore(Optional)

```
$ keytool -list -v -keystore thekeystore.jks -storepass changeit
```

### Import

```
keytool -import -v -trustcacerts \
-alias keyAlias                  \
 -file cas.cer                \
-keystore thekeystore.jks            \
 -keypass changeit
```

```
keytool.exe -import -v -trustcacerts -alias thekeystore -keystore ..\jre\lib\security\cacerts -file thekeystore.cer  -keypass changeit
```

### Enable SSL in TOmcat

```xml
<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol" maxThreads="150" SSLEnabled="true">
  <SSLHostConfig>
    <Certificate certificateKeystoreFile="/export/App/jdk1.8.0_60/bin/thekeystore.jks" 
        type="RSA" keystorePass="changeit" />
  </SSLHostConfig>
</Connector>
```

>#### Default User

```casuser``` / ```Mellon```
