![Nginx](images/3C_mulesoft_logo_updated.svg "")

```
Mule is a lightweight integration platform that allows you to connect anything anywhere. Rather than creating point-to-point integrations between systems, services, APIs and devices, you can use Mule to intelligently manage message-routing, data mapping, orchestration, reliability, security and scalability between nodes. Plug other systems and applications into Mule and let it handle all the communication betweens systems, enabling you track and monitor everything that happens.

At the simplest level, Mule applications accept and process messages through several Lego-block-like message processors plugged together in what we call a flow. Understanding the basic flow architecture is key to understanding Mule. Essentially every Mule flow contains a series of building blocks that accept, then transform and process messages.
```

> #Tutorials 

@see [Tutorials & How Tos](https://developer.mulesoft.com/tutorials-and-howtos "Tutorials & How Tos")

>#MuleSoft Documentation
@see [Documentation](https://docs.mulesoft.com/ "MuleSoft Documentation")

```
```

>#Samples

>> Hello World

```xml
<?xml version="1.0" encoding="UTF-8"?>
<mule  xmlns="http://www.mulesoft.org/schema/mule/core" xmlns:core="http://www.mulesoft.org/schema/mule/core" xmlns:doc="http://www.mulesoft.org/schema/mule/documentation" xmlns:http="http://www.mulesoft.org/schema/mule/http" xmlns:spring="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.mulesoft.org/schema/mule/http http://www.mulesoft.org/schema/mule/http/current/mule-http.xsd
http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-current.xsd
http://www.mulesoft.org/schema/mule/core http://www.mulesoft.org/schema/mule/core/current/mule.xsd">
    <http:listener-config doc:name="HTTP Listener Configuration" host="0.0.0.0" name="HTTP_Listener_Configuration" port="8081"/>
    <flow name="HelloWorldFlow1">
        <http:listener config-ref="HTTP_Listener_Configuration" doc:description="This endpoint receives an HTTP message." doc:name="Receive HTTP request" path="helloWorld"/>
        <set-payload doc:description="This processor sets the payload of the message to the string 'Hello World'." doc:name="Set Payload to a constant string" value="Hello World"/>
    </flow>
</mule>
```
>>Send