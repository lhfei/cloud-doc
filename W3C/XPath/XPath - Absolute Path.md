# XPath - Absolute Path

------



[ Previous Page](https://www.tutorialspoint.com/xpath/xpath_nodes.htm)

[Next Page ](https://www.tutorialspoint.com/xpath/xpath_relative_path.htm)

Location path specifies the location of node in XML document. This path can be absolute or relative. If location path starts with root node or with '/' then it is an absolute path. Following are few of the example locating the elements using absolute path.

**/class/student** − select student nodes within class root node.

```
<xsl:for-each select = "/class/student">
```

**/class/student/firstname** − select firstname of a student node within class root node.

```
<p><xsl:value-of select = "/class/student/firstname"/></p>
```

## Example

In this example, we've created a sample XML document **students.xml** and its stylesheet document **students.xsl** which uses the XPath expressions.

Following is the sample XML used.

### students.xml

```
<?xml version = "1.0"?>
<?xml-stylesheet type = "text/xsl" href = "students.xsl"?>
<class>
   <student rollno = "393">
      <firstname>Dinkar</firstname>
      <lastname>Kad</lastname>
      <nickname>Dinkar</nickname>
      <marks>85</marks>
   </student>
   <student rollno = "493">
      <firstname>Vaneet</firstname>
      <lastname>Gupta</lastname>
      <nickname>Vinni</nickname>
      <marks>95</marks>
   </student>
   <student rollno = "593">
      <firstname>Jasvir</firstname>
      <lastname>Singh</lastname>
      <nickname>Jazz</nickname>
      <marks>90</marks>
   </student>
</class>
```

### students.xsl

```
<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet version = "1.0"
   xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">  
	
   <xsl:template match = "/" >
      <html>
         <body>
            <h3>Details of each Students. </h3>
            <table border = "1">
               <tr bgcolor = "#9acd32">
                  <th>Roll No</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Nick Name</th>
                  <th>Marks</th>		 
               </tr>	
					
               <tr>
                  <td><xsl:value-of select = "/class/student[1]/@rollno"/></td>
                  <td><xsl:value-of select = "/class/student[1]/firstname"/></td>
                  <td><xsl:value-of select = "/class/student[1]/lastname"/></td>
                  <td><xsl:value-of select = "/class/student[1]/nickname"/></td>
                  <td><xsl:value-of select = "/class/student[1]/marks"/></td>		 
               </tr>
					
               <tr>
                  <td>
                     <xsl:value-of select = "/class/student/@rollno"/>
                  </td>
                  <td><xsl:value-of select = "/class/student[2]/firstname"/></td>
                  <td><xsl:value-of select = "/class/student[2]/lastname"/></td>
                  <td><xsl:value-of select = "/class/student[2]/nickname"/></td>
                  <td><xsl:value-of select = "/class/student[2]/marks"/></td>		 
               </tr>
					
               <tr>
                  <td>
                     <xsl:value-of select = "/class/student[3]/@rollno"/>
                  </td>
                  <td><xsl:value-of select = "/class/student[3]/firstname"/></td>
                  <td><xsl:value-of select = "/class/student[3]/lastname"/></td>
                  <td><xsl:value-of select = "/class/student[3]/nickname"/></td>
                  <td><xsl:value-of select = "/class/student[3]/marks"/></td>		 
               </tr>
      
            </table> 
   
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
```

### Verify the output

![XPath Absolute Path Output](https://www.tutorialspoint.com/xpath/images/xpath_students.jpg)