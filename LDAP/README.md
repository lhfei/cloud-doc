



## Install LDAP:

Install the following LDAP RPM packages to get started. Run below command on LDAP server (**server.itzgeek.local**).

```shell
yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel
```



Start the LDAP service and enable it for the auto start of service on system boot.

```
systemctl start slapd.service
systemctl enable slapd.service
```

Verify the LDAP.

```
netstat -antup | grep -i 389

tcp        0      0 0.0.0.0:389             0.0.0.0:*               LISTEN      1520/slapd          
tcp6       0      0 :::389                  :::*                    LISTEN      1520/slapd
```

## Setup LDAP root password:

Run below command to create an LDAP root password; we will use this root password throughout this article. So make a note of this and keep it aside.

```
[root@BDS-TEST-004 ~]# slappasswd
New password: Polaris@Root#01
Re-enter new password: Polaris@Root#01
{SSHA}pazkJ++Zt5EfmQjWL1mG64YhssbRJAyH
```

## Configure OpenLDAP server:

OpenLDAP servers configuration files are found in **/etc/openldap/slapd.d/**. To start with the configuration of LDAP, we would need to update the variables “**olcSuffix**” and “**olcRootDN**“.

**olcSuffix** –  Database Suffix, it is the domain name for which the LDAP server provides the information. In simple words, it should be changed to your domain
name.

**olcRootDN** – Root Distinguished Name (DN) entry for the user who has the unrestricted access to perform all administration activities on LDAP, like a root user.

**olcRootPW** – Password for the above RootDN.

Above entries are to be updated in **/etc/openldap/slapd.d/cn=config/olcDatabase={2}hdb.ldif file**. Manually edit of LDAP configuration is not recommended as you will lose changes whenever you run ldapmodify command.

Please create a **.ldif** file and add the below entries.

```
# vi db.ldif

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=jd,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=ldapadm,dc=jd,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootPW
olcRootPW: {SSHA}l4GePzePsHRQke4jnNmHIJb3R5FDMW8V
```

Once you are done with the ldif file, send the configuration to the LDAP server.

```
ldapmodify -Y EXTERNAL  -H ldapi:/// -f db.ldif
```

Make a changes to **/etc/openldap/slapd.d/cn=config/olcDatabase={1}monitor.ldif (Do not edit manually) **file to restrict the monitor access only to ldap root (**ldapadm**) user not to others.

```
# vi monitor.ldif

dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external, cn=auth" read by dn.base="cn=ldapadm,dc=jd,dc=com" read by * none
```

Once you have updated the file, send the configuration to the LDAP server.

```
ldapmodify -Y EXTERNAL  -H ldapi:/// -f monitor.ldif
```

## Create LDAP certificate:

Let’s create a self-signed certificate for our LDAP server, below command generates both certificate and private key in **/etc/openldap/certs/** directory.

```
openssl req -new -x509 -nodes -out /etc/openldap/certs/jdldapcert.pem -keyout /etc/openldap/certs/jdldapkey.pem -days 365

Generating a 2048 bit RSA private key
...................................................+++
.............................................+++
writing new private key to '/etc/openldap/certs/jdldapkey.pem'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:CN
State or Province Name (full name) [Some-State]:Beijing
Locality Name (eg, city) []:Beijing
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Jingdong
Organizational Unit Name (eg, section) []:jd
Common Name (e.g. server FQDN or YOUR name) []:BDS-TEST-002
Email Address []:lihefei@jd.com
[root@BDS-TEST-002 cn=config]# 
```

Set the owner and group permissions to ldap.

```
chown -R ldap:ldap /etc/openldap/certs/*.pem
```

Verify the created LDAP certificate under **/etc/openldap/certs/**.

```
ll /etc/openldap/certs/*.pem
```

```
-rw-r--r--. 1 ldap ldap 1440 Oct 10 02:31 /etc/openldap/certs/itzgeekldapcert.pem
-rw-r--r--. 1 ldap ldap 1704 Oct 10 02:31 /etc/openldap/certs/itzgeekldapkey.pem
```

Create **certs.ldif** file to configure LDAP to use secure communication using a self-signed certificate.

```
dn: cn=config
changetype: modify
replace: olcTLSCertificateFile
olcTLSCertificateFile: /etc/openldap/certs/jdldapcert.pem

dn: cn=config
changetype: modify
replace: olcTLSCertificateKeyFile
olcTLSCertificateKeyFile: /etc/openldap/certs/jdldapkey.pem
```

Import the configurations to LDAP server.

```
ldapmodify -Y EXTERNAL  -H ldapi:/// -f certs.ldif
```

Verify the configuration:

```
slaptest -u

```

You should get the following message confirms the verification is complete.

```
config file testing succeeded
```

## Set up LDAP database:

Copy the sample database configuration file to **/var/lib/ldap** and update the file permissions.

```
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap:ldap /var/lib/ldap/*
```

Add the **cosine and nis** LDAP schemas.

```
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif 
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif
```

Generate ``/etc/openldap/schema/``**base.ldif** file for your domain.

```
dn: dc=jd,dc=com
dc: jd
objectClass: top
objectClass: domain

dn: cn=ldapadm ,dc=jd,dc=com
objectClass: organizationalRole
cn: ldapadm
description: LDAP Manager

dn: ou=People,dc=jd,dc=com
objectClass: organizationalUnit
ou: People

dn: ou=Group,dc=jd,dc=com
objectClass: organizationalUnit
ou: Group
```

Build the directory structure.

```
ldapadd -x -W -D "cn=ldapadm,dc=jd,dc=com" -f base.ldif
```

ldapadd command will prompt you for the password of ldapadm (LDAP root user).

**Output:**

```
Enter LDAP Password: Polaris@Root#01
adding new entry "dc=jd,dc=com"

adding new entry "cn=Manager,dc=jd,dc=com"

adding new entry "ou=People,dc=jd,dc=com"

adding new entry "ou=Group,dc=jd,dc=com"
```




LDAP Search Manual

```ini
where:
  filter        RFC 4515 compliant LDAP search filter
  attributes    whitespace-separated list of attribute descriptions
    which may include:
      1.1   no attributes
      *     all user attributes
      +     all operational attributes
Search options:
  -a deref   one of never (default), always, search, or find
  -A         retrieve attribute names only (no values)
  -b basedn  base dn for search
  -c         continuous operation mode (do not stop on errors)
  -E [!]<ext>[=<extparam>] search extensions (! indicates criticality)
             [!]domainScope              (domain scope)
             !dontUseCopy                (Don't Use Copy)
             [!]mv=<filter>              (RFC 3876 matched values filter)
             [!]pr=<size>[/prompt|noprompt] (RFC 2696 paged results/prompt)
             [!]sss=[-]<attr[:OID]>[/[-]<attr[:OID]>...]
                                         (RFC 2891 server side sorting)
             [!]subentries[=true|false]  (RFC 3672 subentries)
             [!]sync=ro[/<cookie>]       (RFC 4533 LDAP Sync refreshOnly)
                     rp[/<cookie>][/<slimit>] (refreshAndPersist)
             [!]vlv=<before>/<after>(/<offset>/<count>|:<value>)
                                         (ldapv3-vlv-09 virtual list views)
             [!]deref=derefAttr:attr[,...][;derefAttr:attr[,...][;...]]
             [!]<oid>[=:<b64value>] (generic control; no response handling)
  -f file    read operations from `file'
  -F prefix  URL prefix for files (default: file:///tmp/)
  -l limit   time limit (in seconds, or "none" or "max") for search
  -L         print responses in LDIFv1 format
  -LL        print responses in LDIF format without comments
  -LLL       print responses in LDIF format without comments
             and version
  -M         enable Manage DSA IT control (-MM to make critical)
  -P version protocol version (default: 3)
  -s scope   one of base, one, sub or children (search scope)
  -S attr    sort the results by attribute `attr'
  -t         write binary values to files in temporary directory
  -tt        write all values to files in temporary directory
  -T path    write files to directory specified by path (default: /tmp)
  -u         include User Friendly entry names in the output
  -z limit   size limit (in entries, or "none" or "max") for search
Common options:
  -d level   set LDAP debugging level to `level'
  -D binddn  bind DN
  -e [!]<ext>[=<extparam>] general extensions (! indicates criticality)
             [!]assert=<filter>     (RFC 4528; a RFC 4515 Filter string)
             [!]authzid=<authzid>   (RFC 4370; "dn:<dn>" or "u:<user>")
             [!]chaining[=<resolveBehavior>[/<continuationBehavior>]]
                     one of "chainingPreferred", "chainingRequired",
                     "referralsPreferred", "referralsRequired"
             [!]manageDSAit         (RFC 3296)
             [!]noop
             ppolicy
             [!]postread[=<attrs>]  (RFC 4527; comma-separated attr list)
             [!]preread[=<attrs>]   (RFC 4527; comma-separated attr list)
             [!]relax
             [!]sessiontracking
             abandon, cancel, ignore (SIGINT sends abandon/cancel,
             or ignores response; if critical, doesn't wait for SIGINT.
             not really controls)
  -h host    LDAP server
  -H URI     LDAP Uniform Resource Identifier(s)
  -I         use SASL Interactive mode
  -n         show what would be done but don't actually do it
  -N         do not use reverse DNS to canonicalize SASL host name
  -O props   SASL security properties
  -o <opt>[=<optparam>] general options
             nettimeout=<timeout> (in seconds, or "none" or "max")
             ldif-wrap=<width> (in columns, or "no" for no wrapping)
  -p port    port on LDAP server
  -Q         use SASL Quiet mode
  -R realm   SASL realm
  -U authcid SASL authentication identity
  -v         run in verbose mode (diagnostics to standard output)
  -V         print version info (-VV only)
  -w passwd  bind password (for simple authentication)
  -W         prompt for bind password
  -x         Simple authentication
  -X authzid SASL authorization identity ("dn:<dn>" or "u:<user>")
  -y file    Read password from file
  -Y mech    SASL mechanism
  -Z         Start TLS request (-ZZ to require successful response)
```





```
ldapsearch -x -H ldap://localhost:389 -b 'cn=Monitor'
```

