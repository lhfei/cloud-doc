## 3. Configuration

### 3.1. Creating a ProcessEngine

The Activiti process engine is configured through an XML file called `activiti.cfg.xml`. Note that this is **not** applicable if you’re using [the Spring style of building a process engine](https://www.activiti.org/userguide/6.latest/index.html#springintegration).

The easiest way to obtain a `ProcessEngine`, is to use the `org.activiti.engine.ProcessEngines` class:

```
ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine()
```

This will look for an `activiti.cfg.xml` file on the classpath and construct an engine based on the configuration in that file. The following snippet shows an example configuration. The following sections will give a detailed overview of the configuration properties.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans   http://www.springframework.org/schema/beans/spring-beans.xsd">

  <bean id="processEngineConfiguration" class="org.activiti.engine.impl.cfg.StandaloneProcessEngineConfiguration">

    <property name="jdbcUrl" value="jdbc:mysql://10.182.88.74:3306/activiti_app" />
    <property name="jdbcDriver" value="com.mysql.jdbc.Driver" />
    <property name="jdbcUsername" value="activiti_admin" />
    <property name="jdbcPassword" value="Admin_1473" />
    
    <!-- Database configurations -->
    <property name="databaseSchemaUpdate" value="drop-create" />

	<!-- Test logger -->
	<!-- <property name="configurators">
		<list>
			<bean class="org.activiti.engine.test.impl.logger.ProcessExecutionLoggerConfigurator" />
		</list>
	</property> -->

    <!-- job executor configurations -->
    <property name="asyncExecutor" ref="asyncExecutor" />
    <property name="asyncExecutorActivate" value="false" />
    
    <property name="asyncFailedJobWaitTime" value="1" />

    <!-- mail server configurations -->
    <property name="mailServerPort" value="5025" />
    
    <property name="mailServers">
      <map>
        <entry key="myEmailTenant">
          <bean class="org.activiti.engine.cfg.MailServerInfo">
            <property name="mailServerHost" value="localhost" />
            <property name="mailServerPort" value="5025" />
            <property name="mailServerUseSSL" value="false" />
            <property name="mailServerUseTLS" value="false" />
            <property name="mailServerDefaultFrom" value="activiti@myTenant.com" />
            <property name="mailServerUsername" value="activiti@myTenant.com" />
            <property name="mailServerPassword" value="password" />
          </bean>
        </entry>
      </map>
    </property>
    
    <property name="history" value="full" />
    
    <property name="enableProcessDefinitionInfoCache" value="true" />
  </bean>
  
  <bean id="asyncExecutor" class="org.activiti.engine.impl.asyncexecutor.DefaultAsyncJobExecutor">
    <property name="defaultAsyncJobAcquireWaitTimeInMillis" value="1000" />
    <property name="defaultTimerJobAcquireWaitTimeInMillis" value="1000" />
  </bean>

</beans>
```

Note that the configuration XML is in fact a Spring configuration. **This does not mean that Activiti can only be used in a Spring environment!** We are simply leveraging the parsing and dependency injection capabilities of Spring internally for building up the engine.