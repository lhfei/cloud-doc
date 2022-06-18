

## LDAP Search Filters

Search filters select the entries to be returned for a search operation. They are most commonly used with the `ldapsearch` command-line utility. When you use `ldapsearch`, you can place multiple search filters in a file, with each filter on a separate line in the file, or you can specify a search filter directly on the command line.

For example, the following filter specifies a search for the common name Lucie Du Bois:

```
(cn=Lucie Du Bois)
```

This search filter returns all entries that contain the common name Lucie Du Bois. Searches for common name values are not case sensitive.

When the common name attribute has values associated with a language tag, all of the values are returned. Thus, the following two attribute values both match this filter:

```
cn: Lucie Du Bois
cn;lang-fr: Lucie Du Bois
```

### Search Filter Syntax

The basic syntax of a search filter is:

```
(attribute operator value)
```

For example:

```
(buildingname\>=alpha)
```

In this example, `buildingname` is the attribute, `\>=` is the operator, and **alpha** is the value. You can also define filters that use different attributes combined together with Boolean operators.

Search filters are described in detail in the following sections:

- [Using Attributes in Search Filters](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#gdxod)
- [Using Operators in Search Filters](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#gdxoq)
- [Using OIDs in Search Filters](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#gdxov)
- [Using Compound Search Filters](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#gdxpp)
- [Specifying Search Filters Using a File](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#gdxoc)
- [Specifying Non 7-Bit ASCII Characters in Search Filters](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#gdxoy)

### Using Attributes in Search Filters

When searching for an entry, you can specify attributes associated with that type of entry. For example, when you search for people entries, you can use the `cn` attribute to search for people with a specific common name.

Examples of attributes that people entries might include:

- `cn` (the person’s common name)
- `sn` (the person’s surname, or last name, or family name)
- `telephoneNumber` (the person’s telephone number)
- `buildingName` (the name of the building in which the person resides)
- `l` (the locality in which you can find the person)

### Using Operators in Search Filters

The operators that you can use in search filters are listed in [Table 13–5](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#nathn):

| Search Type              | Operator       | Description                                                  |
| ------------------------ | -------------- | ------------------------------------------------------------ |
| Equality                 | =              | Returns entries containing attribute values that exactly match the specified value. For example, `cn=Bob Johnson` |
| Substring                | =string*string | Returns entries containing attributes containing the specified substring. For example, `cn=Bob*cn=*Johnsoncn=*John*cn=B*John`(The asterisk (*) indicates zero (0) or more characters.) |
| Greater than or equal to | \>=            | Returns entries containing attributes that are greater than or equal to the specified value. For example, `buildingname \>= alpha` |
| Less than or equal to    | <=             | Returns entries containing attributes that are less than or equal to the specified value. For example, `buildingname <= alpha` |
| Presence                 | =*             | Returns entries containing one or more values for the specified attribute. For example, `cn=*``telephonenumber=*``manager=*` |
| Approximate              | ~=             | Returns entries containing the specified attribute with a value that is approximately equal to the value specified in the search filter. For example, `cn~=suret``l~=san fransico`could return `cn=sarette``l=san francisco`The Approximate operator is experimental and works only with English language strings. It does not work with non-ASCII based strings, such as Ja or Zn. |

Extended operators exist that extend searches to `dn` attributes (`cn:dn:=John`, for example) and provide support for internationalized searches.

### Using OIDs in Search Filters

LDAPv3 enables you to build match operators and rules for a particular attribute. Matching rules define how to compare attribute values with a particular syntax. In other words, a matching rule defines how potentially matching attributes are compared. For example, a matching rule can define whether or not to take text case into account when comparing attributes.

When the rules are created, they can be referred to in a search filter.

For example, the following search filter compares entries containing the surname “Jensen” by using the matching rule designated by OID `2.5.13.5`:

`(sn:2.5.13.5:=Jensen)`

The following example illustrates the use of the ":dn" notation to indicate that OID `2.5.13.5` should be used when making comparisons, and that the attributes of an entry\qs distinguished name should be considered part of the entry when evaluating the match:

`(sn:dn:2.5.13.5:=Jensen)`

### Using Compound Search Filters

Multiple search filter components can be combined using Boolean operators expressed in prefix notation as follows:

```
(Boolean-operator(filter)(filter)(filter)...)
```

where Boolean-operator is any one of the Boolean operators listed in [Table 13–6](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#alhic).

Boolean operators can be combined and nested together to form complex expressions, such as:

```
(Boolean-operator(filter)(Boolean-operator(filter)(filter)))
```

The Boolean operators available for use with search filters include the following:

| Operator | Symbol | Description                                                  |
| -------- | ------ | ------------------------------------------------------------ |
| AND      | &      | All specified filters must be true for the statement to be true.For example, `(&(filter)(filter)(filter)...)` |
| OR       | \|     | At least one specified filter must be true for the statement to be true.For example, `(|(filter)(filter)(filter)...)` |
| NOT      | !      | The specified statement must not be true for the statement to be true. Only one filter is affected by the NOT operator. For example, `(!(filter))` |

Boolean expressions are evaluated in the following order:

- Innermost to outermost parenthetical expressions first
- All expressions from left to right

### Specifying Search Filters Using a File

You can enter search filters into a file instead of entering them on the command line. When you do this, specify each search filter on a separate line in the file. The `ldapsearch` command runs each search in the order in which it appears in the file.

For example, if the file contains:

```
(sn=Daniels)
(givenname=Charlene)
```

then `ldapsearch` first finds all the entries with the surname Daniels, and then all the entries with the given name Charlene. If an entry is found that matches both search criteria, the entry is returned twice.

For example, suppose you specified the previous search filters in a file named `searchdb`, and you set your search base using `LDAP_BASEDN`. The following returns all the entries that match either search filter:

```
ldapsearch -h myServer -p 5201 -D cn=admin,cn=Administrators,cn=config -w -
 -f searchdb
```

You can limit the set of attributes returned here by specifying the attribute names that you want at the end of the search line. For example, the following `ldapsearch` command performs both searches, but returns only the DN and the `givenname` and `sn` attributes of each entry:

```
ldapsearch -h myServer -p 5201 -D cn=admin,cn=Administrators,cn=config -w -
 -f searchdb sn givenname
```

### Specifying Non 7-Bit ASCII Characters in Search Filters

Non 7-bit ASCII characters in search filters must be replaced with a representation of the character, where each byte of the UTF-8 encoding is preceded by a backslash. In UTF-8, characters are represented by a hexadecimal code for each byte.

For example, the character `é` has UTF-8 representation `c3a9`. Thus, in a search filter, you represent `é` as `\\c3\\a9`. So, to search for cn=Véronique Martin:

ldapsearch -h myServer -b "dc=example,dc=com" "(cn=V\\c3\\a9ronique Martin)"

The special characters listed in [Table 13–7](https://docs.oracle.com/cd/E19528-01/819-0997/6n3cs0btl/index.html#vifac) must also be represented in this fashion when used in search filters.

| Special character | Value With Special Character | Example Filter           |
| ----------------- | ---------------------------- | ------------------------ |
| *                 | `Five*Star`                  | `(cn=Five\\2aStar)`      |
| \\                | `c:\\File`                   | `(cn=\\5cFile)`          |
| ()                | `John (2nd)`                 | `(cn=John \\282nd\\29)`  |
| null              | `0004`                       | `(bin=\\00\\00\\00\\04)` |

#### Escaped Characters in Distinguished Names within Search Filters

When using a DN in any part of Directory Server, you must escape commas and certain other special characters with a backslash (\\). If you are using a DN in a search filter, the backslash used for escaping special characters in DNs must be represented by `\\5c`. For example:

DN: `cn=Julie Fulmer,ou=Marketing\\,Bolivia,dc=example,dc=com`

DN in a search filter: `ldapsearch -h myServer -b "dc=example,dc=com" "(manager=cn=Julie Fulmer,ou=Marketing\\5c,Bolivia,dc=example,dc=com)"`

- 
- 
- 





## Reference:

- [x] https://docs.oracle.com/cd/E19528-01/819-0997/gdxpo/index.html


- [x] https://www.centos.org/docs/5/html/CDS/ag/8.0/Finding_Directory_Entries-LDAP_Search_Filters.html


- [x] https://www.ldap.com/ldap-filters