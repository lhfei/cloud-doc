

```
[root@a01-r03-i164-154-515w92j ~]# ambari-server setup-kerberos
Using python  /usr/bin/python
Setting up Kerberos authentication
Enable Kerberos authentication [true|false] (false): true
SPNEGO principal (HTTP/_HOST): 
SPNEGO keytab file (/etc/security/keytabs/spnego.service.keytab): 
User type search order [LDAP|LOCAL|JTW] (LDAP): LOCAL
Auth-to-local rules (DEFAULT): 
Properties to be updated / written into ambari properties:
{'authentication.kerberos.auth_to_local.rules': 'DEFAULT',
 'authentication.kerberos.enabled': 'true',
 'authentication.kerberos.spnego.keytab.file': '/etc/security/keytabs/spnego.service.keytab',
 'authentication.kerberos.spnego.principal': 'HTTP/_HOST',
 'authentication.kerberos.user.types': 'LOCAL'}
Save settings [y/n] (y)? y
Kerberos authentication settings successfully saved. Please restart the server in order for the new settings to take effect.
Ambari Server 'setup-kerberos' completed successfully.
```







```
dd if=/dev/urandom of=/etc/security/http_secret bs=1024 count=1
chown hdfs:hadoop /etc/security/http_secret
chmod 440 /etc/security/http_secret
```



Add or modify the following configuration properties to Advanced core-site .
Property New Value
hadoop.http.authentication.simple.anonymous.allowed false
hadoop.http.authentication.signature.secret.file /etc/security/http_secret
hadoop.http.authentication.type kerberos
hadoop.http.authentication.kerberos.keytab /etc/security/keytabs/spnego.service.keytab
hadoop.http.authentication.kerberos.principal HTTP/_HOST@EXAMPLE.COM
hadoop.http.filter.initializers org.apache.hadoop.security.AuthenticationFilterInitializer
hadoop.http.authentication.cookie.domain hortonworks.local 