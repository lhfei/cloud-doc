```
LDAPMODIFY(1)                                                    LDAPMODIFY(1)

NAME
       ldapmodify, ldapadd - LDAP modify entry and LDAP add entry tools

SYNOPSIS
       ldapmodify  [-a]  [-b]  [-c]  [-C]  [-r]  [-n]  [-v]  [-k] [-K] [-M[M]]
       [-d debuglevel] [-D binddn] [-W] [-w passwd] [-H ldapuri] [-h ldaphost]
       [-p ldapport] [-P 2|3] [-O security-properties] [-I] [-Q] [-U username]
       [-x] [-X authzid] [-Y mech] [-Z[Z]] [-f file]

       ldapadd [-b] [-c] [-C] [-r] [-n] [-v] [-k] [-K] [-M[M]] [-d debuglevel]
       [-D binddn]   [-W]  [-w passwd]  [-h ldaphost]  [-p ldapport]  [-P 2|3]
       [-E[E]] [-I[I]] [-U username] [-X authzid] [-Y mech] [-Z[Z]] [-f file]

DESCRIPTION
       ldapmodify is a shell-accessible interface to  the  ldap_modify(3)  and
       ldap_add(3)  library  calls.   ldapadd is implemented as a hard link to
       the ldapmodify tool.  When invoked as ldapadd the -a  (add  new  entry)
       flag is turned on automatically.

       ldapmodify opens a connection to an LDAP server, binds, and modifies or
       adds entries.  The entry information is read  from  standard  input  or
       from file through the use of the -f option.

OPTIONS
       -a     Add  new  entries.   The  default  for  ldapmodify  is to modify
              existing entries.  If invoked as ldapadd, this  flag  is  always
              set.

       -b     Assume  that  any values that start with a `/' are binary values
              and that the actual value is in a file whose path  is  specified
              in the place where values normally appear.

       -C     Automatically chase referrals.

       -c     Continuous  operation mode.  Errors are reported, but ldapmodify
              will continue with modifications.  The default is to exit  after
              reporting an error.

       -r     Replace existing values by default.

       -n     Show  what  would  be  done,  but don't actually modify entries.
              Useful for debugging in conjunction with -v.

       -v     Use verbose mode, with  many  diagnostics  written  to  standard
              output.

       -k     Use  Kerberos  authentication  instead of simple authentication.
              It is assumed that you already  have  a  valid  ticket  granting
              ticket.   You must compile with Kerberos support for this option
              to have any effect.

       -K     Same as -k, but only does step 1 of the Kerberos bind.  This  is
              useful   when   connecting   to   a   slapd   and  there  is  no
              x500dsa.hostname  principal  registered   with   your   Kerberos
              servers.

       -F     Force  application  of all changes regardless of the contents of
              input lines that begin with replica: (by default, replica: lines
              are  compared  against  the  LDAP server host and port in use to
              decide if a replog record should actually be applied).

       -M[M]  Enable manage DSA IT control.  -MM makes control critical.

       -d debuglevel
              Set the LDAP debugging level to debuglevel.  ldapmodify must  be
              compiled  with  LDAP_DEBUG  defined  for this option to have any
              effect.

       -f file
              Read the entry modification information  from  file  instead  of
              from standard input.

       -x     Use simple authentication instead of SASL.

       -D binddn
              Use the Distinguished Name binddn to bind to the LDAP directory.

       -W     Prompt  for  simple  authentication.   This  is  used instead of
              specifying the password on the command line.

       -w passwd
              Use passwd as the password for simple authentication.

       -H ldapuri
              Specify URI(s) referring to the ldap server(s).

       -h ldaphost
              Specify an alternate host on which the ldap server  is  running.
              Deprecated in favor of -H.

       -p ldapport
              Specify   an  alternate  TCP  port  where  the  ldap  server  is
              listening.  Deprecated in favor of -H.

       -P 2|3 Specify the LDAP protocol version to use.

       -O security-properties
              Specify SASL security properties.

       -I     Enable SASL Interactive mode.  Always  prompt.   Default  is  to
              prompt only as needed.

       -Q     Enable SASL Quiet mode.  Never prompt.

       -U username
              Specify  the  username for SASL bind. The syntax of the username
              depends on the actual SASL mechanism used.

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

INPUT FORMAT
       The contents of file (or standard input if no -f flag is given  on  the
       command  line) should conform to the format defined in slapd.replog(5),
       with the exceptions noted below.

       If the first line of a record consists of a decimal number (entry  id),
       it is ignored.

       Lines  that  begin  with "replica:" are matched against the LDAP server
       host and port in use to decide if a particular replog record should  be
       applied.  Any other lines that precede the "dn:" line are ignored.  The
       -F flag can be used to force ldapmodify to  apply  all  of  the  replog
       changes, regardless of the presence or absence of any "replica:" lines.

       If  no  "changetype:"  line  is present, the default is "add" if the -a
       flag is set (or if the program was invoked as ldapmodify) and  "modify"
       otherwise.

       If changetype is "modify" and no "add:", "replace:", or "delete:" lines
       appear, the default is "replace" if  the  -r  flag  is  set  and  "add"
       otherwise.

       Note  that  the  above  exceptions  to the slapd.replog(5) format allow
       ldif(5) entries to be used as input to ldapmodify or ldapadd.

ALTERNATIVE INPUT FORMAT
       An alternative input format is supported for compatibility  with  older
       versions  of  ldapmodify.   This format consists of one or more entries
       separated by blank lines, where each entry looks like:

           Distinguished Name (DN)
           attr=value
           [attr=value ...]

       where attr is the name of the attribute and value is the value.

       By default, values are added.  If the -r command line  flag  is  given,
       the  default is to replace existing values with the new one.  Note that
       it is permissible for a given attribute to appear more than  once  (for
       example,  to add more than one value for an attribute).  Also note that
       you can use a trailing `\' to continue values across lines and preserve
       newlines  in the value itself (this is useful for modifying QUIPU iattr
       attributes among others).

       attr should be preceded by a - to remove a value.  The  `='  and  value
       should be omitted to remove an entire attribute.

       attr should be preceded by a + to add a value in the presence of the -r
       flag.

EXAMPLES
       Assuming that the file /tmp/entrymods exists and has the contents:

           dn: cn=Modify Me, dc=example, dc=com
           changetype: modify
           replace: mail
           mail: modme@OpenLDAP.org
           -
           add: title
           title: Grand Poobah
           -
           add: jpegPhoto
           jpegPhoto:< file://tmp/modme.jpeg
           -
           delete: description
           -

       the command:

           ldapmodify -b -r -f /tmp/entrymods

       will replace the contents of the "Modify  Me"  entry's  mail  attribute
       with  the value "modme@example.com", add a title of "Grand Poobah", and
       the  contents  of  the  file  "/tmp/modme.jpeg"  as  a  jpegPhoto,  and
       completely remove the description attribute.  The same modifications as
       above can be performed using the older ldapmodify input format:

           cn=Modify Me, dc=example, dc=com
           mail=modme@example.com
           +title=Grand Poobah
           +jpegPhoto=/tmp/modme.jpeg
           -description

       and the command:

           ldapmodify -b -r -f /tmp/entrymods

       Assuming that the file /tmp/newentry exists and has the contents:

           dn: cn=Barbara Jensen, dc=example, dc=com
           objectClass: person
           cn: Barbara Jensen
           cn: Babs Jensen
           sn: Jensen
           title: the world's most famous mythical manager
           mail: bjensen@example.com
           uid: bjensen

       the command:

           ldapadd -f /tmp/entrymods

       will add a new entry for Babs Jensen, using the values  from  the  file
       /tmp/newentry.

       Assuming that the file /tmp/newentry exists and has the contents:

           dn: cn=Barbara Jensen, dc=example, dc=com
           changetype: delete

       the command:

           ldapmodify -f /tmp/entrymods

       will remove Babs Jensen's entry.

DIAGNOSTICS
       Exit  status  is  zero if no errors occur.  Errors result in a non-zero
       exit status and a diagnostic message being written to standard error.

SEE ALSO
       ldapadd(1), ldapdelete(1), ldapmodrdn(1), ldapsearch(1),  ldap.conf(5),
       ldap(3),  ldap_add(3),  ldap_delete(3), ldap_modify(3), ldap_modrdn(3),
       slapd.replog(5)

BUGS
       There is no interactive mode, but there probably should be.

AUTHOR
       The OpenLDAP Project <http://www.openldap.org/>

ACKNOWLEDGEMENTS
       OpenLDAP  is  developed  and  maintained  by   The   OpenLDAP   Project
       (http://www.openldap.org/).   OpenLDAP  is  derived  from University of
       Michigan LDAP 3.3 Release.

OpenLDAP 2.0.0-Release          20 August 2000                   LDAPMODIFY(1)
```


Example

```
ldapadd -x -w Polaris@Root#01 -D cn=Manager,dc=jd,dc=com -f lhfei.ldif
```

