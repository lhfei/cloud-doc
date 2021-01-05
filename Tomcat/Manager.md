

```
<role rolename="manager-gui"/>
<user username="tomcat" password="s3cret" roles="manager-gui"/>
```

Note that for Tomcat 7 onwards, the roles required to use the manager application were changed from the single `manager` role to the following four roles. You will need to assign the role(s) required for the functionality you wish to access.

- `manager-gui` - allows access to the HTML GUI and the status pages
- `manager-script` - allows access to the text interface and the status pages
- `manager-jmx` - allows access to the JMX proxy and the status pages
- `manager-status` - allows access to the status pages only

The HTML interface is protected against CSRF but the text and JMX interfaces are not. To maintain the CSRF protection:

- Users with the `manager-gui` role should not be granted either the `manager-script` or `manager-jmx` roles.
- If the text or jmx interfaces are accessed through a browser (e.g. for testing since these interfaces are intended for tools not humans) then the browser must be closed afterwards to terminate the session.



In `[tomcat]/conf/Catalina/[hostname]` create a file `manager.xml`

In this newly created `manager.xml` you put the `RemoteAddrValve` in the Context:

```xml
<Context antiResourceLocking="false" privileged="true" docBase="${catalina.home}/webapps/manager">

   <Valve className="org.apache.catalina.valves.RemoteAddrValve" 
    allow="127\.0\.0\.1|11\.22\.33\.44" denyStatus="404" />

</Context>  
```

