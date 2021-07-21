# XPath - Expression

------



[ Previous Page](https://www.tutorialspoint.com/xpath/xpath_overview.htm)

[Next Page ](https://www.tutorialspoint.com/xpath/xpath_nodes.htm)

An XPath expression generally defines a pattern in order to select a set of nodes. These patterns are used by XSLT to perform transformations or by XPointer for addressing purpose.

XPath specification specifies seven types of nodes which can be the output of execution of the XPath expression.

- Root
- Element
- Text
- Attribute
- Comment
- Processing Instruction
- Namespace

XPath uses a path expression to select node or a list of nodes from an XML document.

Following is the list of useful paths and expression to select any node/ list of nodes from an XML document.

| S.No. |                   Expression & Description                   |
| ----- | :----------------------------------------------------------: |
| 1     | **node-name**Select all nodes with the given name "nodename" |
| 2     |           **/**Selection starts from the root node           |
| 3     | **//**Selection starts from the current node that match the selection |
| 4     |                **.**Selects the current node                 |
| 5     |         **..**Selects the parent of the current node         |
| 6     |                   **@**Selects attributes                    |
| 7     | **student**Example − Selects all nodes with the name "student" |
| 8     | **class/student**Example − Selects all student elements that are children of class |
| 9     | **//student**Selects all student elements no matter where they are in the document |

## Example

In this example, we've created a sample XML document, students.xml and its stylesheet document **students.xsl** which uses the XPath expressions under **select** attribute of various XSL tags to get the values of roll no, firstname, lastname, nickname and marks of each student node.

### students.xml

```xml
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

```xml
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
               <xsl:for-each select = "class/student">
                  <tr>
                     <td> <xsl:value-of select = "@rollno"/></td>
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

![XPath expression Output](https://www.tutorialspoint.com/xpath/images/xpath_students.jpg)

