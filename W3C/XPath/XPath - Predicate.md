# XPath - Predicate

------



[ Previous Page](https://www.tutorialspoint.com/xpath/xpath_wildcard.htm)

[Next Page ](https://www.tutorialspoint.com/xpath/xpath_quick_guide.htm)

Predicate refers to the XPath expression written in square brackets. It refers to restrict the selected nodes in a node set for some condition. For example,

| S.No. |                   Predicate & Description                    |
| ----- | :----------------------------------------------------------: |
| 1     | **/class/student[1]**Select first student element which is child of the class element. |
| 2     | **/class/student[last()]**Select last student element which is child of the class element. |
| 3     | **/class/student[@rolllno = 493]**Select student element with rollno 493. |
| 4     | **/class/student[marks>85]**Select student element with marks > 85. |

## Example

This example creates a table of <student> element with their details, by iterating over each student. It calculates the position of the student node and then prints the student(s) details along with serial no.

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

   <xsl:template match = "/">
      <html>
         <body>
            <h2>Students</h2>
            <table border = "1">
               <tr bgcolor = "#9acd32">	 
                  <th>Roll No</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Nick Name</th>
                  <th>Marks</th>	  
               </tr>
					
               <xsl:for-each select = "/class/student[1]">
                  <tr>	 
                     <td><xsl:value-of select = "@rollno"/></td>
                     <td><xsl:value-of select = "firstname"/></td>
                     <td><xsl:value-of select = "lastname"/></td>
                     <td><xsl:value-of select = "nickname"/></td>
                     <td><xsl:value-of select = "marks"/></td>	 
                  </tr>	
               </xsl:for-each>
					
               <xsl:for-each select = "/class/student[last()]">
                  <tr>	 
                     <td><xsl:value-of select = "@rollno"/></td>
                     <td><xsl:value-of select = "firstname"/></td>
                     <td><xsl:value-of select = "lastname"/></td>
                     <td><xsl:value-of select = "nickname"/></td>
                     <td><xsl:value-of select = "marks"/></td>	 
                  </tr>	
               </xsl:for-each>
	
               <xsl:for-each select = "/class/student[@rollno = 493]">
                  <tr>	 
                     <td><xsl:value-of select = "@rollno"/></td>
                     <td><xsl:value-of select = "firstname"/></td>
                     <td><xsl:value-of select = "lastname"/></td>
                     <td><xsl:value-of select = "nickname"/></td>
                     <td><xsl:value-of select = "marks"/></td>	 
                  </tr>	
               </xsl:for-each>

               <xsl:for-each select = "/class/student[marks > 85]">
                  <tr>	 
                     <td><xsl:value-of select = "@rollno"/></td>
                     <td><xsl:value-of select = "firstname"/></td>
                     <td><xsl:value-of select = "lastname"/></td>
                     <td><xsl:value-of select = "nickname"/></td>
                     <td><xsl:value-of select = "marks"/></td>	 
                  </tr>	
               </xsl:for-each>
	
	
            </table>
  
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
```

### Verify the output

![Formatted predicate Output](https://www.tutorialspoint.com/xpath/images/xpath_predicate.jpg)