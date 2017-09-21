FAQs
====

> no jansi64-x.xx in java.library.path, no jansi-x.xx in java.library.path

- Download the **jansi-{version}** jar file, and decompress it. 
- Then copy the **jansi.dll** from ```native``` folder to ```c:\Windows\System32```


> PKIX path building failed

```
Caused by: java.lang.RuntimeException: javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.
security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```

**PKIX** path building errors are the most common SSL errors. The problem here is that the CAS client does not trust the certificate presented by the CAS server; most often this occurs because of using a self-signed certificate on the CAS server. To resolve this error, import the CAS server certificate into the system truststore of the CAS client. If the certificate is issued by your own PKI, it is better to import the root certificate of your PKI into the CAS client truststore.

By default the Java system truststore is at ```$JAVA_HOME/jre/lib/security/cacerts```. The certificate to be imported **MUST** be a **DER-encoded** file. If the contents of the certificate file are binary, it’s likely DER-encoded; if the file begins with the text *---BEGIN CERTIFICATE---*, it is PEM-encoded and needs to be converted to DER encoding.

```
keytool -import -keystore $JAVA_HOME/jre/lib/security/cacerts -file $JAVA_HOME/bin/thekeystore.der -alias thekeystore
```