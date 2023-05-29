{SSHA}nxf10cJ9GeQHQjPA7po6HVbsA7cf2MEj



add olcDatabase\=\{2\}hdb.ldif

```
ldapadd -Y EXTERNAL -H ldapi:/// -f olcDatabase\=\{2\}hdb.ldif
```

*very important*



chdomain.ldif

```ini
dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth"
  read by dn.base="cn=Manager,dc=fly,dc=com" read by * none

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=fly,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=Manager,dc=fly,dc=com

dn: olcDatabase={2}hdb,cn=config
changetype: modify
add: olcRootPW
olcRootPW: {SSHA}nsD3k4KiY/oRGeJ3D7MI8APCDQ1sfv5X

dn: olcDatabase={2}hdb,cn=config
changetype: modify
add: olcAccess
olcAccess: {0}to attrs=userPassword,shadowLastChange by
  dn="cn=Manager,dc=fly,dc=com" write by anonymous auth by self write by * none
olcAccess: {1}to dn.base="" by * read
olcAccess: {2}to * by dn="cn=Manager,dc=fly,dc=com" write by * read
```



```
./configure --enable-wrappers
```



```
./configure --enable-wrappers \
CPPFLAGS="-I/usr/local/include" \
LDFLAGS="-L/usr/local/lib -Wl,-rpath,/usr/local/lib"
```



```
make depend
```



Get DN

```
ldapsearch -H ldap:// -x -s base -b "" -LLL "namingContexts"
```



Check DB type

```
ldapsearch -H ldapi:/// -Y EXTERNAL -b "cn=config" -LLL -Q "olcDatabase=*" dn
```



slaptest

```
slaptest -d 7
```

