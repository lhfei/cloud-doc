### Generate a ssl key



```shell
# Go to JAVA_HOME
cd $JAVA_HOME
./bin/keytool.exe -genkey -alias lhfei -keyalg RSA -keystore lhfei.jks
```



```ini
Enter keystore password:  Lhfeilaile01
Re-enter new password: Lhfeilaile01
What is your first and last name?
  [Unknown]:  Hefei Li
What is the name of your organizational unit?
  [Unknown]:  JD
What is the name of your organization?
  [Unknown]:  cloud
What is the name of your City or Locality?
  [Unknown]:  Beijing
What is the name of your State or Province?
  [Unknown]:  Beijing
What is the two-letter country code for this unit?
  [Unknown]:  86
Is CN=Hefei Li, OU=JD, O=cloud, L=Beijing, ST=Beijing, C=86 correct?
  [no]:  yes


Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore lhfei.jks -destkeystore lhfei.jks -deststoretype pkcs12".

```



### Tomcat

`${TOMCAT_HOME}/conf/server.xml`

```xml
<Connector SSLEnabled="true" maxThreads="150" port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol">
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol"/>
        <SSLHostConfig>
            <Certificate certificateKeystoreFile="D:/ProgramFiles/Java/jdk1.8.0_271/sshkey/lhfei.jks" certificateKeystorePassword="Lhfeilaile01" type="RSA"/>
        </SSLHostConfig>
</Connector>
```

