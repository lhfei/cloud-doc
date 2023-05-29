```
LDAPDELETE(1)                                                    LDAPDELETE(1)

NAME
       ldapdelete - LDAP delete entry tool

SYNOPSIS
       ldapdelete  [-V[V]]  [-d debuglevel]  [-n]  [-v]  [-c]  [-f file]  [-r]
       [-z sizelimit]    [-M[M]]    [-x]    [-D binddn]    [-W]    [-w passwd]
       [-y passwdfile]  [-H ldapuri]  [-h ldaphost]  [-p ldapport]  [-P {2|3}]
       [-e [!]ext[=extparam]]    [-E [!]ext[=extparam]]    [-o opt[=optparam]]
       [-O security-properties]   [-I]   [-Q]   [-N]  [-U authcid]  [-R realm]
       [-X authzid] [-Y mech] [-Z[Z]] [DN [...]]

DESCRIPTION
       ldapdelete is a shell-accessible interface  to  the  ldap_delete_ext(3)
       library call.

       ldapdelete opens a connection to an LDAP server, binds, and deletes one
       or more entries.  If one or more DN  arguments  are  provided,  entries
       with those Distinguished Names are deleted.  Each DN should be provided
       using the LDAPv3 string representation as defined in RFC 4514.   If  no
       DN  arguments  are  provided, a list of DNs is read from standard input
       (or from file if the -f flag is used).

OPTIONS
       -V[V]  Print  version  info.   If  -VV  is  given,  only  the   version
              information is printed.

       -d debuglevel
              Set  the LDAP debugging level to debuglevel.  ldapdelete must be
              compiled with LDAP_DEBUG defined for this  option  to  have  any
              effect.

       -n     Show  what  would  be  done,  but don't actually delete entries.
              Useful for debugging in conjunction with -v.

       -v     Use verbose mode, with  many  diagnostics  written  to  standard
              output.

       -c     Continuous   operation   mode.    Errors   are   reported,   but
              ldapdelete will  continue  with  deletions.   The default is  to
              exit after reporting an error.

       -f file
              Read a series of DNs from file, one per line, performing an LDAP
              delete for each.

       -r     Do a recursive delete.  If the DN specified isn't  a  leaf,  its
              children,  and all their children are deleted down the tree.  No
              verification is done, so if you add this switch, ldapdelete will
              happily delete large portions of your tree.  Use with care.

       -z sizelimit
              Use  sizelimit  when  searching  for  children  DN to delete, to
              circumvent  any  server-side  size  limit.    Only   useful   in
              conjunction with -r.

       -M[M]  Enable manage DSA IT control.  -MM makes control critical.

       -x     Use simple authentication instead of SASL.

       -D binddn
              Use the Distinguished Name binddn to bind to the LDAP directory.
              For SASL binds, the server is expected to ignore this value.

       -W     Prompt for simple  authentication.   This  is  used  instead  of
              specifying the password on the command line.

       -w passwd
              Use passwd as the password for simple authentication.

       -y passwdfile
              Use  complete  contents of passwdfile as the password for simple
              authentication.

       -H ldapuri
              Specify  URI(s)  referring  to  the  ldap  server(s);  only  the
              protocol/host/port  fields are allowed; a list of URI, separated
              by whitespace or commas is expected.

       -h ldaphost
              Specify an alternate host on which the ldap server  is  running.
              Deprecated in favor of -H.

       -p ldapport
              Specify   an  alternate  TCP  port  where  the  ldap  server  is
              listening.  Deprecated in favor of -H.

       -P {2|3}
              Specify the LDAP protocol version to use.

       -e [!]ext[=extparam]

       -E [!]ext[=extparam]

              Specify general extensions with -e and  delete  extensions  with
              -E.  '!' indicates criticality.

              General extensions:
                [!]assert=<filter>    (an RFC 4515 Filter)
                !authzid=<authzid>    ("dn:<dn>" or "u:<user>")
                [!]bauthzid           (RFC 3829 authzid control)
                [!]chaining[=<resolve>[/<cont>]]
                [!]manageDSAit
                [!]noop
                ppolicy
                [!]postread[=<attrs>] (a comma-separated attribute list)
                [!]preread[=<attrs>]  (a comma-separated attribute list)
                [!]relax
                sessiontracking
                abandon,cancel,ignore (SIGINT sends abandon/cancel,
                or ignores response; if critical, doesn't wait for SIGINT.
                not really controls)

              Delete extensions:
                (none)

       -o opt[=optparam]

              Specify general options.

              General options:
                nettimeout=<timeout>  (in seconds, or "none" or "max")
                ldif-wrap=<width>     (in columns, or "no" for no wrapping)

       -O security-properties
              Specify SASL security properties.

       -I     Enable  SASL  Interactive  mode.   Always prompt.  Default is to
              prompt only as needed.

       -Q     Enable SASL Quiet mode.  Never prompt.

       -N     Do not use reverse DNS to canonicalize SASL host name.

       -U authcid
              Specify the authentication ID for SASL bind.  The  form  of  the
              identity depends on the actual SASL mechanism used.

       -R realm
              Specify  the  realm of authentication ID for SASL bind. The form
              of the realm depends on the actual SASL mechanism used.

       -X authzid
              Specify the requested authorization ID for SASL  bind.   authzid
              must be one of the following formats: dn:_distinguished name_ or
              u:_username_

       -Y mech
              Specify the SASL mechanism to be  used  for  authentication.  If
              it's  not  specified, the program will choose the best mechanism
              the server knows.

       -Z[Z]  Issue StartTLS (Transport Layer Security) extended operation. If
              you  use  -ZZ,  the  command  will  require  the operation to be
              successful.

EXAMPLE
       The following command:

           ldapdelete "cn=Delete Me,dc=example,dc=com"

       will    attempt    to    delete    the    entry    named     "cn=Delete
       Me,dc=example,dc=com".   Of  course  it  would probably be necessary to
       supply authentication credentials.

DIAGNOSTICS
       Exit status is 0 if no errors occur.  Errors result in a non-zero  exit
       status and a diagnostic message being written to standard error.

SEE ALSO
       ldap.conf(5),  ldapadd(1), ldapmodify(1), ldapmodrdn(1), ldapsearch(1),
       ldap(3), ldap_delete_ext(3)

AUTHOR
       The OpenLDAP Project <http://www.openldap.org/>

ACKNOWLEDGEMENTS
       OpenLDAP Software is developed and maintained by The  OpenLDAP  Project
       <http://www.openldap.org/>.   OpenLDAP  Software  is  derived  from the
       University of Michigan LDAP 3.3 Release.

OpenLDAP 2.4.45                   2017/06/01                     LDAPDELETE(1)
```



Example

```shell
#! /bin/sh
# openldap_delete_Peoples.sh
# Destructive script
# Never do deletion at LDAP Master Server
# Do deletion only at LDAP Slave Server
[ "`uname -n`" = "lhfei" ] && exit

# Un-Comment for RedHat
BINDIR=/usr/bin
# Un-Comment for others
#BINDIR=/usr/local/bin
grep "^dn:" People.ldif | sed 's/^dn: //' >openldap_delete_Peoples.ldif
if [ -f mgr.pwd ]
then
   $BINDIR/ldapdelete -c -x -D "cn=Manager,dc=example,dc=com" -w `cat
mgr.pwd` -f openldap_delete_Peoples.ldif
else
   echo "mgr.pwd not found"
   echo "Please enter LDAP password for cn=Manager,dc=example,dc=com..."
   $BINDIR/ldapdelete -c -x -D "cn=Manager,dc=example,dc=com" -W -f
openldap_delete_Peoples.ldif
fi
```



Example:



```
ldapdelete -x -D "cn=Manager,dc=fly,dc=com" -w Polaris@Root#01 "uid=lhfei,ou=People,dc=fly,dc=com"
```

