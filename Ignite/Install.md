



> default-config.xml

```xml
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="        http://www.springframework.org/schema/beans        http://www.springframework.org/schema/beans/spring-beans.xsd">
  <!--
        Alter configuration below as needed.
    -->
  <bean id="grid.cfg" class="org.apache.ignite.configuration.IgniteConfiguration">
    <property name="discoverySpi">
      <bean class="org.apache.ignite.spi.discovery.zk.ZookeeperDiscoverySpi">
        <property name="zkConnectionString" value="host-10-182-16-155:2181,host-10-182-58-88:2181,host-10-182-58-90:2181,host-10-182-59-13:2181"/>
        <property name="sessionTimeout" value="30000"/>
        <property name="zkRootPath" value="/apacheIgnite"/>
        <property name="joinTimeout" value="10000"/>
      </bean>
    </property>
  </bean>
</beans>
```







```

```

