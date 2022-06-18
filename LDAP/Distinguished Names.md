# Distinguished Names

The LDAP API references an LDAP object by its distinguished name (**DN**). A **DN** is a sequence of relative distinguished names (RDN) connected by commas.

An **RDN** is an attribute with an associated value in the form **attribute**=*value*; normally expressed in a UTF-8 string format. The following table lists typical RDN attribute types.

| String     | Attribute type           |
| ---------- | ------------------------ |
| **DC**     | Domain Component         |
| **CN**     | Common Name              |
| **OU**     | Organizational Unit Name |
| **O**      | Organization Name        |
| **STREET** | StreetAddress            |
| **L**      | Locality Name            |
| **ST**     | State Or Province Name   |
| **C**      | CountryName              |
| **UID**    | Userid                   |

DNs are comprised of zero or more comma-separated components called relative distinguished names, or RDNs. For example, the **DN** "**uid=john.doe,ou=People,dc=example,dc=com**" has four RDNs:

- uid=john.doe
- ou=People
- dc=example
- dc=com 



The following are examples of distinguished names.

```
CN=Jeff Smith,OU=Sales,DC=Fabrikam,DC=COM

```

```
CN=Karen Berge,CN=admin,DC=corp,DC=Fabrikam,DC=COM

```

The following table lists reserved characters that cannot be used in an attribute value without being escaped.

**Note**  See the guidance below the table about using the escape character with these reserved characters.

 

| Reserved character | Description                              | Hex value |
| ------------------ | ---------------------------------------- | --------- |
| ****               | space or **#** character at the beginning of a string |           |
| ****               | space character at the end of a string   |           |
| **,**              | comma                                    | 0x2C      |
| **+**              | plus sign                                | 0x2B      |
| **"**              | double quote                             | 0x22      |
| **\**              | backslash                                | 0x5C      |
| **<**              | left angle bracket                       | 0x3C      |
| **>**              | right angle bracket                      | 0x3E      |
| **;**              | semicolon                                | 0x3B      |
| **LF**             | line feed                                | 0x0A      |
| **CR**             | carriage return                          | 0x0D      |
| **=**              | equals sign                              | 0x3D      |
| **/**              | forwards slash                           | 0x2F      |

 

If a reserved character is part of an attribute value, it must be escaped by prefixing it with a backslash (**\**) in the attribute string. If an attribute value contains other reserved characters, such as the equals sign (**=**) or non-printable characters, it must be encoded in hexadecimal by replacing the character with a backslash followed by two hex digits.

The following are examples of some distinguished names that include escaped characters. The first example is an organizational unit name with an embedded comma; the second example is a value containing a carriage return.

```
CN=Litware,OU=Docs\, Adatum,DC=Fabrikam,DC=COM

```

```
CN=Before\0DAfter,OU=Test,DC=North America,DC=Fabrikam,DC=COM

```

## LDAP ADsPath

For more information about using distinguished names via the ADSI LDAP provider, see [LDAP ADsPath](https://msdn.microsoft.com/en-us/library/aa746384(v=vs.85).aspx).