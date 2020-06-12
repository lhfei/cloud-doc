### Download



| Name                            | Description                                                  | Download                                                     |
| :------------------------------ | :----------------------------------------------------------- | :----------------------------------------------------------- |
| **Drools Engine**               | Drools Expert is the rule engine and Drools Fusion does complex event processing (CEP). Distribution zip contains binaries, examples, sources and javadocs. | [Distribution ZIP](https://download.jboss.org/drools/release/7.36.0.Final/drools-distribution-7.36.0.Final.zip) |
| **Drools and jBPM integration** | Drools and jBPM integration with third party project like Spring. Distribution zip contains binaries, examples and sources. | [Distribution ZIP](https://download.jboss.org/drools/release/7.36.0.Final/droolsjbpm-integration-distribution-7.36.0.Final.zip) |
| **Business Central Workbench**  | Business Central Workbench is the web application and repository to govern Drools and jBPM assets. See [documentation](https://www.drools.org/learn/documentation.html) for details about installation. | [WildFly 14 WAR](https://download.jboss.org/drools/release/7.36.0.Final/business-central-7.36.0.Final-wildfly14.war) |
| **Drools and jBPM tools**       | Eclipse plugins and support for Drools, jBPM and Guvnor functionality. Distribution zip contains binaries and sources. | [Distribution ZIP](https://download.jboss.org/drools/release/7.36.0.Final/droolsjbpm-tools-distribution-7.36.0.Final.zip) |
| **KIE Execution Server**        | Standalone execution server that can be used to remotely execute rules using REST, JMS or Java interface. Distribution zip contains WAR files for all supported containers. | [Distribution ZIP](https://download.jboss.org/drools/release/7.36.0.Final/kie-server-distribution-7.36.0.Final.zip) |
| **KIE Server WARS**             | WAR files for all supported containers                       | [ee7, ee8, webc WAR](https://repo1.maven.org/maven2/org/kie/server/kie-server/7.36.0.Final/) |





[All release notes.](https://www.drools.org/download/download.html)



### Add User

> Add user for **EAP** or **Wildfly**

```shell
./bin/add-user.sh

(a): a
username: manager
password: ******
```



> Add user for **Business Central Workbench**

```shell
./bin/add-user.sh -a -u kieadmin -p Lhfei -g admin,kie-server
```







```shell
lhfei@B-J2H3MD6M-1650 wildfly-19.0.0.Final % ./bin/add-user.sh                                                                                                                       

What type of user do you wish to add? 
 a) Management User (mgmt-users.properties) 
 b) Application User (application-users.properties)
(a): b

Enter the details of the new user to add.
Using realm 'ApplicationRealm' as discovered from the existing property files.
Username : kieadmin
Password recommendations are listed below. To modify these restrictions edit the add-user.properties configuration file.
 - The password should be different from the username
 - The password should not be one of the following restricted values {root, admin, administrator}
 - The password should contain at least 8 characters, 1 alphabetic character(s), 1 digit(s), 1 non-alphanumeric symbol(s)
Password : 
WFLYDM0099: Password should have at least 8 characters!
Are you sure you want to use the password entered yes/no? yes
Re-enter Password : 
What groups do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]: admin,kie-server
About to add user 'kieadmin' for realm 'ApplicationRealm'
Is this correct yes/no? yes
Added user 'kieadmin' to file '/Users/lhfei/SourceCode/JBoss/wildfly-19.0.0.Final/standalone/configuration/application-users.properties'
Added user 'kieadmin' to file '/Users/lhfei/SourceCode/JBoss/wildfly-19.0.0.Final/domain/configuration/application-users.properties'
Added user 'kieadmin' with groups admin,kie-server to file '/Users/lhfei/SourceCode/JBoss/wildfly-19.0.0.Final/standalone/configuration/application-roles.properties'
Added user 'kieadmin' with groups admin,kie-server to file '/Users/lhfei/SourceCode/JBoss/wildfly-19.0.0.Final/domain/configuration/application-roles.properties'
Is this new user going to be used for one AS process to connect to another AS process? 
e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
yes/no? yes
To represent the user add the following to the server-identities definition <secret value="TGhmZWk=" />

```





### Start

```shell
./bin/standalone.sh --server-config=standalone-full.xml -Dorg.kie.server.id=wildfly-kieserver -Dorg.kie.server.location=http://localhost:8080/kie-server/services/rest/server -Dorg.kie.server.controller=http://localhost:8080/kie-web/rest/controller
```



cd