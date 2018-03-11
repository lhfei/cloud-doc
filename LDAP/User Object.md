## Properties for the User Object



This page explains the common LDAP attributes which are used in VBS scripts and PowerShell.  Programs like VBScript (WSH), CSVDE and LDIFDE rely on these LDAP attributes to create or modify objects in Active Directory.  For example, when you bulk import users you will include the LDAP attributes: dn and sAMAccountName.

\* LDAP is the Lightweight Directory Access Protocol.

### Topics for LDAP Attributes

- [Hall of fame LDAP attribute - DN  distinguished name](http://www.computerperformance.co.uk/Logon/LDAP_attributes_active_directory.htm#Hall_of_fame_LDAP_attribute_-_DN__distinguished_name_)
- [LDAP Attributes from Active Directory Users and Computers](http://www.computerperformance.co.uk/Logon/LDAP_attributes_active_directory.htm#LDAP_Attributes_from_Active_Directory_Users_and_Computers)
- [LDAP Examples - Comprehensive List](http://www.computerperformance.co.uk/Logon/LDAP_attributes_active_directory.htm#LDAP_Attribute_)

 ♦

### [Hall of Fame LDAP Attribute - DN  Distinguished Name]()

As the word 'distinguished' suggests, this is THE LDAP attribute that uniquely defines an object.  Each DN must have a different name and location from all other objects in Active Directory.  The other side of the coin is that DN provides a way of selecting any object in Active Directory.  Once you have selected the object, then you can change its attributes.

Time spent in getting to know the DN attribute will repay many fold.  Observe the different components CN=common name, OU = organizational unit.  DC often comes with two entries, DC=CP, DC=COM.  Note that DC=CP.COM would be wrong.  Incidentally in this situation, DC means domain content rather than domain controller.

Another point with the syntax is to check the speech marks; when used with VBScript commands, DN is often enclosed in "speech marks".  Even the speech marks have to be of the right type, "double quotes are correct", 'single quotes may be ignored', with unpredictable results.  Finally, pay particular attention to commas in distinguished names.

### [LDAP Attributes from Active Directory Users and Computers]()

The diagram below is taken from Active Directory Users and Computers. It shows the commonest LDAP attributes for vbs scripts.

[![LDAP Attributes for CSVDE](http://www.computerperformance.co.uk/images/code/ldap_properties.jpg)](http://www.computerperformance.co.uk/w2k3/utilities/adsi_edit.htm)

When you write your scripts, check how the LDAP attributes map to the Active Directory boxes.

**Research Tip:**
One of my favourite techniques is to add values in the active directory property boxes, then export using CSVDE.  Next, open the .csv file in Excel, search for the value, and read the LDAP field name from row 1.

| [LDAP Attribute]()                       | Example                                  |
| ---------------------------------------- | ---------------------------------------- |
| C                                        | Country: e.g GB for Great Britain.       |
| CN - Common Name                         | CN=Guy Thomas.  Actually, this LDAP attribute can be made up from givenName joined to SN. |
| CN                                       | Maps to 'Name' in the LDAP provider. Remember CN is a mandatory property.  See also sAMAccountName. |
| description                              | What you see in Active Directory Users and Computers.  Not to be confused with displayName on the Users property sheet. |
| displayName                              | displayName = Guy Thomas.  If you script this property, be sure you understand which field you are configuring.  DisplayName can be confused with CN or description. |
| [![ LDAP Properties - Active Directory Users and Computers](http://www.computerperformance.co.uk/images/code/Ldap_General_sm.jpg)](http://www.computerperformance.co.uk/Logon/active_directory_attributes.htm)Display name -v- Description**Important LDAP Notes**Display name and Description are differentOffice's LDAP attribute is:physicalDeliveryOfficeNameE-mail is plain: mail |                                          |
| DN - also distinguishedName              | DN is simply the most important LDAP attribute.CN=Jay Jamieson, OU= Newport,DC=cp,DC=com |
| givenName                                | Firstname also called Christian name     |
| homeDrive                                | Home Folder : connect.  Tricky to configure |
| initials                                 | Useful in some cultures.                 |
| name                                     | name = Guy Thomas.  Exactly the same as CN. |
| objectCategory                           | Defines the Active Directory Schema category. For example, objectCategory = Person |
| objectClass                              | objectClass = User.  Also used for Computer, organizationalUnit, even container.  Important top level container. |
| physicalDeliveryOfficeName               | Office! on the user's General property sheet |
| postOfficeBox                            | P.O. box.                                |
| profilePath                              | Roaming profile path: connect.  Trick to set up |
| sAMAccountName                           | This is a mandatory property, sAMAccountName = guyt.  The old NT 4.0 logon name, must be unique in the domain. |
| sAMAccountName                           | If you are using an LDAP provider 'Name' automatically maps to sAMAcountName and CN. The default value is same as CN, but can be given a different value. |
| SN                                       | SN = Thomas. This would be referred to as last name or surname. |
| title                                    | Job title.  For example Manager.         |
| userAccountControl                       | Used to disable an account.  A value of 514 disables the account, while 512 makes the account ready for logon. |
| userPrincipalName                        | userPrincipalName = guyt@CP.com  Often abbreviated to UPN, and looks like an email address.  Very useful for logging on especially in a large Forest.  Note UPN must be unique in the forest. |
| wWWHomePage                              | User's home page.                        |
| Guy Recommends:  A Free Trial of the Network Performance Monitor (NPM)[![Review of Orion NPM v11.5](http://www.computerperformance.co.uk/images/win8/orion_npmsc2.jpg)](http://www.solarwinds.com/register/registrationb.aspx?program=607&c=70150000000Dlbw&CMP=BIZ-RVW-COMPPERF-NPMv11_LAUNCH-NPM-DL-work_email) v11.5SolarWinds' [Orion performance monitor](http://www.solarwinds.com/register/registrationb.aspx?program=607&c=70150000000Dlbw&CMP=BIZ-RVW-COMPPERF-NPMv11_LAUNCH-NPM-DL-work_email) will help you discover what's happening on your network.  This utility will also guide you through troubleshooting; the dashboard will indicate whether the root cause is a broken link, faulty equipment or resource overload.What I like best is the way NPM suggests solutions to network problems.  Its also has the ability to monitor the health of individual VMware virtual machines.  If you are interested in troubleshooting, and creating network maps, then I recommend that you try NPM now.[Download a free trial of Solarwinds' Network Performance Monitor](http://www.solarwinds.com/register/registrationb.aspx?program=607&c=70150000000Dlbw&CMP=BIZ-RVW-COMPPERF-NPMv11_LAUNCH-NPM-DL-work_email) |                                          |
| Examples of Exchange Specific LDAP attributes |                                          |
| homeMDB                                  | Here is where you set the MailStore      |
| legacyExchangeDN                         | Legacy distinguished name for creating Contacts. In the following example,Guy Thomas is a Contact in the first administrative group of GUYDOMAIN: /o=GUYDOMAIN/ou=first administrative group/cn=Recipients/cn=Guy Thomas |
| mail                                     | An easy, but important attribute.  A simple SMTP address is all that is required billyn@ourdom.com |
| mAPIRecipient - FALSE                    | Indicates that a contact is not a domain user. |
| mailNickname                             | Normally this is the same value as the sAMAccountName, but could be different if you wished.  Needed for mail enabled contacts. |
| mDBUseDefaults                           | Another straightforward field, just the value to:True |
| msExchHomeServerName                     | Exchange needs to know which server to deliver the mail.  Example: /o=YourOrg/ou=First Administrative Group/cn=Configuration/cn=Servers/cn=MailSrv |
| proxyAddresses                           | As the name 'proxy' suggests, it is possible for one recipient to have more than one email address.  Note the plural spelling of proxyAddresses. |
| targetAddress                            | SMTP:@ e-mail address.  Note that SMTP is case sensitive.  All capitals means the default address. |
| showInAddressBook                        | Displays the contact in the Global Address List. |
| Guy Recommends:  SolarWinds' Free Bulk Import Tool[![Free Download Solarwinds Bulk Import Tool](http://www.computerperformance.co.uk/images/solarwinds/ad_admins2.jpg)](http://www.solarwinds.com/register/registrationb.aspx?program=1800&c=70150000000PH8s&CMP=BIZ-TAD-COMPPERF-APPMAN-MSFT_SCRIPT-DL)Import users from a spreadsheet.  Just provide a list of the users with their fields in the top row, and save as .csv file.  Then launch this FREE utility and match your fields with AD's attributes, click and import the users.Optionally, you can provide the name of the OU where the new accounts will be born. [Download your FREE bulk import tool.](http://www.solarwinds.com/register/registrationb.aspx?program=1800&c=70150000000PH8s&CMP=BIZ-TAD-COMPPERF-APPMAN-MSFT_SCRIPT-DL)If you need more comprehensive software, [download a free trial of SAM (Server & Application Monitor)](http://www.solarwinds.com/register/registrationb.aspx?program=20111&c=70150000000PBbo&CMP=BIZ-TAD-COMPPERF-GuyRec-ASB-DL-2015) |                                          |
| Other Useful LDAP Attributes / Propeties |                                          |
| c                                        | Country or Region                        |
| company                                  | Company or organization name             |
| department                               | Useful category to fill in and use for filtering |
| homephone                                | Home Phone number, (Lots more phone LDAPs) |
| l  (Lower case L)                        | L = Location.  City ( Maybe Office       |
| location                                 | Important, particularly for printers and computers. |
| manager                                  | Boss, manager                            |
| mobile                                   | Mobile Phone number                      |
| ObjectClass                              | Usually, User, or Computer               |
| OU                                       | Organizational unit.  See also DN        |
| pwdLastSet                               | Force users to change their passwords at next logon |
| postalCode                               | Zip or post code                         |
| st                                       | State, Province or County                |
| streetAddress                            | First line of address                    |
| telephoneNumber                          | Office Phone                             |
| userAccountControl                       | Enable (512) / disable account (514)     |
| »                                        |                                          |
| Examples of Obscure LDAP Attributes      |                                          |
| dNSHostname                              |                                          |
| rID                                      |                                          |
| url                                      |                                          |
| uSNCreated, uSNChanged                   |                                          |
| ![LDAP and CSVDE Tip](http://www.computerperformance.co.uk/images/50tip2.gif)  To discover more LDAP attributes, go to the command prompt, type:CSVDE -f Exportfile.csv.  Then open Exportfile.csv with Excel.exe.   Alternatively, use ADSI Edit and right-click the container objects. |                                          |
| [Find more LDAP attributes with ADSI Edit](http://www.computerperformance.co.uk/w2k3/utilities/adsi_edit.htm)[PwdLastSet](http://www.computerperformance.co.uk/vbscript/vbscript_pwdlastset.htm)  [Free SolarWinds CSV Import Tool](http://www.computerperformance.co.uk/HealthCheck/csv_import_active_directory.htm) |                                          |