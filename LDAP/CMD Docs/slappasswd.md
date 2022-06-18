```markdown

```

```markdown
SLAPPASSWD(8C)                                                  SLAPPASSWD(8C)

NAME
       slappasswd - OpenLDAP password utility

SYNOPSIS
       /usr/local/sbin/slappasswd [-v] [-u] [-s secret] [-h hash]

DESCRIPTION
       Slappasswd  is  used to generate an userPassword value suitable for use
       with ldapmodify(1) or slapd.conf(5) rootpw coniguration directive.

OPTIONS
       -v     enable verbose mode.  -u generate  RFC2307  userPassword  values
              (the  default).   Future  versions  of this program may generate
              alternative syntaxes by default.  This option  is  provided  for
              forward compatibility.

       -s secret
              The  secret to hash.  If not provided, the user will be prompted
              for the secret to hash.

       If -h is specified, one of the following RFC2307 schemes may
              be specified: {CRYPT}, {MD5}, {SMD5}, {SSHA},  and  {SHA}.   The
              default is {SSHA}.

LIMITATIONS
       The practice storing hashed passwords in userPassword violates Standard
       Track (RFC2256) schema specifications and may hinder  interoperability.
       A new attribute type to hold hashed passwords is needed.

SECURITY CONSIDERATIONS
       Use  of  hashed  passwords  does  not protect passwords during protocol
       transfer.  TLS or other eavesdropping  protections  should  be  inplace
       before  using  LDAP  simple bind.  The hashed password values should be
       protected as if they were clear text passwords.

SEE ALSO
       ldappasswd(1), ldapmodify(1), slapd(8) slapd.conf(5)

       "OpenLDAP Administrator's Guide" (http://www.OpenLDAP.org/doc/admin/)

ACKNOWLEDGEMENTS
       OpenLDAP  is  developed  and  maintained  by   The   OpenLDAP   Project
       (http://www.openldap.org/).   OpenLDAP  is  derived  from University of
       Michigan LDAP 3.3 Release.

OpenLDAP 2.0.0-Release          20 August 2000                  SLAPPASSWD(8C)
```



Example:

```shell
[root@a01-r03-i164-154-515w92j ~]# /usr/sbin/slappasswd -h {md5} -s Lhfei
{MD5}Lyc/NbGEutNfYFs7J7UV0A==
[root@a01-r03-i164-154-515w92j ~]# 
```

