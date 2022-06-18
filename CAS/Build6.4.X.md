

```shell
git clone https://github.com/apereo/cas-overlay-template.git

# check latest release version
git checkout -b 6.4 origin/6.4

# build 
./gradlew clean build --stacktrace -info

# check dist file
du -ah build/libs/
121M    build/libs/cas.war
121M    build/libs/
```





### Generate Keystore

#### Creaet keystore

```sh
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

the `cas.jks` file will be created in the current location.

```shell
ls -a
.  ..  bin  cas.jks  conf  include  jmods  legal  lib  man  README.html  release
```



#### Export 

```sh
$ ./bin/keytool -export -alias cas -storepass DataLink -file cas.cer -keystore cas.jks

# output as below
Certificate stored in file <cas.cer>

# check it
ls -a

# output as below
.  ..  bin  cas.cer  cas.jks  conf  include  jmods  legal  lib  man  README.html  release
```

Copy the `cas.jks` file into ```/etc/cas/```

```shell
cp cas.jks /etc/cas/
```

#### Verify the Kyestore

```
$ ./bin/keytool -list -v -keystore cas.jks -storepass DataLink
```

Output as below:

```ini
Keystore type: PKCS12
Keystore provider: SUN

Your keystore contains 1 entry

Alias name: cas
Creation date: Jan 28, 2022
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: CN=Hefei Li, OU=DLink, O=DLink, L=Beijing, ST=Beijing, C=CN
Issuer: CN=Hefei Li, OU=DLink, O=DLink, L=Beijing, ST=Beijing, C=CN
Serial number: 429aa290
Valid from: Fri Jan 28 12:15:25 CST 2022 until: Thu Apr 28 12:15:25 CST 2022
Certificate fingerprints:
         SHA1: BB:93:63:8F:42:D6:9A:CD:FC:15:3F:3A:00:97:70:08:48:29:77:BA
         SHA256: 08:5C:C5:01:A5:0E:67:C2:3E:2A:DB:5F:BE:B8:09:7A:BB:EC:01:FC:74:95:23:47:5D:15:CC:4D:2B:27:CB:A4
Signature algorithm name: SHA256withRSA
Subject Public Key Algorithm: 2048-bit RSA key
Version: 3

Extensions: 

#1: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: F5 55 4C 92 D6 ED 5B EA   C1 65 0D 0A 71 85 50 25  .UL...[..e..q.P%
0010: 2D B2 89 5C                                        -..\
]
]



*******************************************
*******************************************

```



#### Import

```
./bin/keytool -importkeystore -v -trustcacerts \
-alias keyAlias                  \
-file cas.cer                \
-keystore ./lib/security/cacerts \
 -keypass DataLink
```

```shell
./bin/keytool -importkeystore -v -trustcacerts \
    -srckeystore cas.jks \
    -srcalias cas \
    -srckeypass DataLink \
    -deststorepass DataLink \
    -noprompt                 
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

```ini
./bin/keytool -importkeystore --help

Imports one or all entries from another keystore

Options:

 -srckeystore <keystore>   source keystore name
 -destkeystore <keystore>  destination keystore name
 -srcstoretype <type>      source keystore type
 -deststoretype <type>     destination keystore type
 -srcstorepass <arg>       source keystore password
 -deststorepass <arg>      destination keystore password
 -srcprotected             source keystore password protected
 -destprotected            destination keystore password protected
 -srcprovidername <name>   source keystore provider name
 -destprovidername <name>  destination keystore provider name
 -srcalias <alias>         source alias
 -destalias <alias>        destination alias
 -srckeypass <arg>         source key password
 -destkeypass <arg>        destination key password
 -noprompt                 do not prompt
 -addprovider <name>       add security provider by name (e.g. SunPKCS11)
   [-providerarg <arg>]      configure argument for -addprovider
 -providerclass <class>    add security provider by fully-qualified class name
   [-providerarg <arg>]      configure argument for -providerclass
 -providerpath <list>      provider classpath
 -v                        verbose output

```





### Nginx 

### 1- Generate certificate

to run a Nginx https server, we need certificate.
you can buy a certificate or use let’s encrypt project to get free verified certificates or generate it with openssl library.
Here we have not a valid domain, so we use openssl library to generate an unverified certificate.
first we create a directory to hold certificate:

```shell
mkdir -p /etc/nginx/cert/ 
```

then issue the following command to generate certificate:

```shell
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert/private.key -out /etc/nginx/cert/certificate.crt
```

the output would be:

```ini
Country Name (2 letter code) [AU]:CN
State or Province Name (full name) [Some-State]:Beijing
Locality Name (eg, city) []:Beijing
Organization Name (eg, company) [Internet Widgits Pty Ltd]:DLink
Organizational Unit Name (eg, section) []:DLink
Common Name (e.g. server FQDN or YOUR name) []:dlink.cn
Email Address []:lihefei@jd.com
```

then we change owner:

```shell
chown -R nginx:nginx /etc/nginx/cert/ 
```

### 2- Configure Nginx

To set up an HTTPS server, we must include the ssl parameter to the listen directive in the server block in nginx.conf file , then specify the locations of the server certificate and private key files:

```ini
server {
  listen 443 ssl;
  server_name www.example.com;
  ssl_certificate /etc/nginx/cert/certificate.crt;
  ssl_certificate_key /etc/nginx/cert/private.key;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers HIGH:!aNULL:!MD5;
}
```

Note: we can combine private key and certificate into one file, but it is so important to restrict access to this file.
also it’s a good idea to save private key and ssl certificate in separate files.
due to some flaws in SSLv3 protocol as described in [CVE-2011-3389](https://nvd.nist.gov/vuln/detail/CVE-2011-3389), it’s highly recommended to avoid SSLv3.





- [JDK 11 Keytool](https://docs.oracle.com/en/java/javase/11/tools/keytool.html)

