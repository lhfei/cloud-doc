SSL
===

[**Working with Certificates and SSL**](https://docs.oracle.com/cd/E19830-01/819-4712/ablqw/index.html)


## To change the location of certificate files

The keystore and truststore files provided for development are stored in the domain-dir/config directory.

In the Admin Console tree, select the Application Server node.

Select JVM Settings.

Click the JVM Options tab.

On the JVM Options page, add or modify the following values in the Value field to reflect the new location of the certificate files:

```
-Djavax.net.ssl.keyStore=${com.sun.aas.instanceRoot}/path/ks-name
-Djavax.net.ssl.trustStore=${com.sun.aas.instanceRoot}/path/ts-name
```

where ks-name is the keystore file name and ts-name is the trust store file name.

Click Save.

Restart the Application Server if Restart Required displays in the console.

```
```

## Using the keytool Utility

The following examples demonstrate usage related to certificate handling using JSSE tools:

Create a self-signed certificate in a keystore of type JKS using an RSA key algorithm. RSA is public-key encryption technology developed by RSA Data Security, Inc. The acronym stands for Rivest, Shamir, and Adelman, the inventors of the technology.

```sh
keytool  -genkey -noprompt -trustcacerts -keyalg RSA -alias ${cert.alias} 
-dname  ${dn.name} -keypass ${key.pass} -keystore ${keystore.file} 
-storepass ${keystore.pass}
```

Another example of creating a certificate is shown in To generate a certificate using the keytool utility.

Create a self-signed certificate in a keystore of type JKS using the default key algorithm.

```
keytool -genkey -noprompt -trustcacerts -alias ${cert.alias} -dname  
${dn.name} -keypass ${key.pass} -keystore ${keystore.file} -storepass 
${keystore.pass}
```
An example of signing a certificate is shown in To sign a digital certificate using the keytool utility

Display available certificates from a keystore of type JKS.

```
keytool -list -v  -keystore ${keystore.file} -storepass ${keystore.pass}
```

Display certificate information from a keystore of type JKS.

```
keytool  -list -v  -alias ${cert.alias} -keystore ${keystore.file} 
-storepass ${keystore.pass}
```
Import an RFC/text-formatted certificate into a JKS store. Certificates are often stored using the printable encoding format defined by the Internet RFC (Request for Comments) 1421 standard instead of their binary encoding. This certificate format, also known as Base 64 encoding, facilitates exporting certificates to other applications by email or through some other mechanism.

```
keytool -import -noprompt -trustcacerts -alias ${cert.alias} -file 
${cert.file} -keystore ${keystore.file} -storepass ${keystore.pass}
```

Export a certificate from a keystore of type JKS in PKCS7 format. The reply format defined by the Public Key Cryptography Standards #7, Cryptographic Message Syntax Standard, includes the supporting certificate chain in addition to the issued certificate.

```
keytool  -export -noprompt  -alias ${cert.alias} -file ${cert.file} 
-keystore ${keystore.file} -storepass ${keystore.pass}
```

Export a certificate from a keystore of type JKS in RFC/text format.

```
keytool  -export -noprompt -rfc  -alias ${cert.alias} -file 
${cert.file} -keystore ${keystore.file} -storepass ${keystore.pass}
```

Delete a certificate from a keystore of type JKS.

```
keytool  -delete -noprompt -alias ${cert.alias}  -keystore ${keystore.file} 
-storepass ${keystore.pass}
```

Another example of deleting a certificate from a keystore is shown in Deleting a Certificate Using the keytool Utility



## To generate a certificate using the keytool utility

1.Create a keystore file to store the server's private key and self-signed certificate by executing the following command:

```sh
$ keytool -genkey -alias tomcat -keyalg RSA
```

```sh
$ keytool -genkey -alias server-alias -keyalg RSA -keypass changeit -storepass changeit -keystore keystore.jks
```

*The command will ask for the following details:*
```
What is your first and last name?
  [Unknown]:  Hefei Li
What is the name of your organizational unit?
  [Unknown]:  JD
What is the name of your organization?
  [Unknown]:  JD
What is the name of your City or Locality?
  [Unknown]:  BJ
What is the name of your State or Province?
  [Unknown]:  BJ
What is the two-letter country code for this unit?
  [Unknown]:  CN
Is CN=Hefei Li, OU=JD, O=JD, L=BJ, ST=BJ, C=CN correct?
  [no]:  yes
```


2.Enter the following keytool command to export the generated certificate to the file server.cer (or client.cer if you prefer):

```sh
$ keytool -export -alias keyAlias-storepass changeit -file server.cer -keystore keystore.jks
```

3.If a certificate signed by a certificate authority is required, see [To sign a digital certificate using the](https://docs.oracle.com/cd/E19830-01/819-4712/ablrc/index.html) [keytool](https://docs.oracle.com/cd/E19830-01/819-4712/ablrc/index.html) [utility](https://docs.oracle.com/cd/E19830-01/819-4712/ablrc/index.html).

4.To create the truststore file cacerts.jks and add the certificate to the truststore, enter the following keytool command:

```sh
keytool -import -v -trustcacerts \
-alias keyAlias                  \
 -file server.cer                \
-keystore cacerts.jks            \
 -keypass changeit
```

If you have changed the keystore or private key password from their default, then substitute the new password for changeit in the above command.

The tool displays information about the certificate and prompts whether you want to trust the certificate.

5.Type ```yes```, then press Enter.

Then keytool displays something like this:

```
Certificate was added to keystore
[Saving cacerts.jks]
```

6.Restart the Application Server.

```
```

## To sign a digital certificate using the keytool utility

After creating a digital certificate, the owner must sign it to prevent forgery. E-commerce sites, or those for which authentication of identity is important can purchase a certificate from a well-known Certificate Authority (CA). If authentication is not a concern, for example if private secure communications is all that is required, save the time and expense involved in obtaining a CA certificate and use a self-signed certificate.

Follow the instructions on the CA¡¯s Web site for generating certificate key pairs.

Download the generated certificate key pair.

Save the certificate in the directory containing the keystore and truststore files, by default domain-dir/config directory. See To change the location of certificate files.

In your shell, change to the directory containing the certificate.

Use keytool to import the certificate into the local keystore and, if necessary, the local truststore.

```
keytool -import -v -trustcacerts
-alias keyAlias
 -file server.cer
-keystore cacerts.jks
 -keypass changeit
-storepass changeit
```

If the keystore or private key password is not the default password, then substitute the new password for changeit in the above command.

Restart the Application Server.

## Deleting a Certificate Using the keytool Utility

To delete an existing certificate, use the keytool -delete command, for example:

```
keytool -delete
 -alias keyAlias
 -keystore keystore-name
 -storepass password
```

For a complete list of possible options for the -delete command, refer to the keytool documentation at http://java.sun.com/j2se/1.5.0/docs/tooldocs/solaris/keytool.html.