# XPath - Axes

------



[ Previous Page](https://www.tutorialspoint.com/xpath/xpath_relative_path.htm)

[Next Page ](https://www.tutorialspoint.com/xpath/xpath_operators.htm)

As location path defines the location of a node using absolute or relative path, axes are used to identify elements by their relationship like **parent, child, sibling,** etc. Axes are named so because they refer to axis on which elements are lying relative to an element.

Following is the list of various Axis values.

| S.No. |                      Axis & Description                      |
| ----- | :----------------------------------------------------------: |
| 1     | **ancestor**Represents the ancestors of the current node which include the parents up to the root node. |
| 2     | **ancestor-or-self**Represents the current node and it's ancestors. |
| 3     | **attribute**Represents the attributes of the current node.  |
| 4     |    **child**Represents the children of the current node.     |
| 5     | **descendant**Represents the descendants of the current node. Descendants include the node's children upto the leaf node(no more children). |
| 6     | **descendant-or-self**Represents the current node and it's descendants. |
| 7     | **following**Represents all nodes that come after the current node. |
| 8     | **following-sibling**Represents the following siblings of the context node. Siblings are at the same level as the current node and share it's parent. |
| 9     |  **namespace**Represents the namespace of the current node.  |
| 10    |     **parent**Represents the parent of the current node.     |
| 11    | **preceding**Represents all nodes that come before the current node (i.e. before it's opening tag). |
| 12    |             **self**Represents the current node.             |

Following are a few examples on the uses of axes.

**firstname** − select firstname related to student nodes.

```
<p><xsl:value-of select = "firstname"/></p>
<xsl:value-of select = "/class/student/preceding-sibling::comment()"/>
```

## Example

In this example, we've created a sample XML document **students.xml** and its stylesheet document **students.xsl** which uses the XPath expressions.

Following is the sample XML used.

### students.xml

```
<?xml version = "1.0"?>
<?xml-stylesheet type = "text/xsl" href = "students.xsl"?>
<class>
   <!-- Comment: This is a list of student -->
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
            <xsl:value-of select = "/class/student/preceding-sibling::comment()"/>
            <br/>
            <xsl:text>First Student: </xsl:text>
            <xsl:value-of select = "/class/student/child::firstname" />    
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
```

### Verify the output

![XPath axes](https://www.tutorialspoint.com/xpath/images/xpath_axes.jpg)