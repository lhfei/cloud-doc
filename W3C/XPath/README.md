# XPath Tutorial

[❮ Previous](https://www.w3schools.com/xml/dom_examples.asp)[Next ❯](https://www.w3schools.com/xml/xpath_nodes.asp)

------

## What is XPath?

XPath is a major element in the XSLT standard.

XPath can be used to navigate through elements and attributes in an XML document.

| ![XPath](https://www.w3schools.com/xml/pic_xpath.gif) | XPath stands for XML Path LanguageXPath uses "path like" syntax to identify and navigate nodes in an XML documentXPath contains over 200 built-in functionsXPath is a major element in the XSLT standardXPath is a W3C recommendation |
| ----------------------------------------------------- | ------------------------------------------------------------ |
|                                                       |                                                              |

------

## XPath Path Expressions

XPath uses path expressions to select nodes or node-sets in an XML document.

These path expressions look very much like the path expressions you use with traditional computer file systems:

![Folders](https://www.w3schools.com/xml/img_xpath_folders.jpg)

------

## XPath Standard Functions

XPath includes over 200 built-in functions.

There are functions for string values, numeric values, booleans, date and time comparison, node manipulation, sequence manipulation, and much more.

Today XPath expressions can also be used in JavaScript, Java, XML Schema, PHP, Python, C and C++, and lots of other languages.

------

## XPath is Used in XSLT

XPath is a major element in the XSLT standard.

With XPath knowledge you will be able to take great advantage of your XSLT knowledge.

------

## XPath is a W3C Recommendation

XPath 1.0 became a W3C Recommendation on November 16, 1999.

XPath 2.0 became a W3C Recommendation on January 23, 2007.

XPath 3.0 became a W3C Recommendation on April 8, 2014.



# XPath Nodes

[❮ Previous](https://www.w3schools.com/xml/xpath_intro.asp)[Next ❯](https://www.w3schools.com/xml/xpath_syntax.asp)

------

## XPath Terminology

### Nodes

In XPath, there are seven kinds of nodes: element, attribute, text, namespace, processing-instruction, comment, and document nodes.

XML documents are treated as trees of nodes. The topmost element of the tree is called the root element.

Look at the following XML document:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>
 <book>
  <title lang="en">Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
 </book>
</bookstore>
```



Example of nodes in the XML document above:

```ini
<bookstore> (root element node)

<author>J K. Rowling</author> (element node)

lang="en" (attribute node)
```



### Atomic values

Atomic values are nodes with no children or parent.

Example of atomic values:

```ini
J K. Rowling

"en"
```



### Items

Items are atomic values or nodes.



## Relationship of Nodes

### Parent

Each element and attribute has one parent.

In the following example; the book element is the parent of the title, author, year, and price:

```xml
<book>
 <title>Harry Potter</title>
 <author>J K. Rowling</author>
 <year>2005</year>
 <price>29.99</price>
</book>
```



### Children

Element nodes may have zero, one or more children.

In the following example; the title, author, year, and price elements are all children of the book element:

```xml
<book>
 <title>Harry Potter</title>
 <author>J K. Rowling</author>
 <year>2005</year>
 <price>29.99</price>
</book>
```



### Siblings

Nodes that have the same parent.

In the following example; the title, author, year, and price elements are all siblings:

```xml
<book>
 <title>Harry Potter</title>
 <author>J K. Rowling</author>
 <year>2005</year>
 <price>29.99</price>
</book>
```



### Ancestors

A node's parent, parent's parent, etc.

In the following example; the ancestors of the title element are the book element and the bookstore element:

```xml
<bookstore>

<book>
 <title>Harry Potter</title>
 <author>J K. Rowling</author>
 <year>2005</year>
 <price>29.99</price>
</book>

</bookstore>
```



### Descendants

A node's children, children's children, etc.

In the following example; descendants of the bookstore element are the book, title, author, year, and price elements:

```xml
<bookstore>

<book>
 <title>Harry Potter</title>
 <author>J K. Rowling</author>
 <year>2005</year>
 <price>29.99</price>
</book>

</bookstore>
```



# XPath Syntax

[❮ Previous](https://www.w3schools.com/xml/xpath_nodes.asp)[Next ❯](https://www.w3schools.com/xml/xpath_axes.asp)

------

XPath uses path expressions to select nodes or node-sets in an XML document. The node is selected by following a path or steps.

------

## The XML Example Document

We will use the following XML document in the examples below.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<bookstore>

<book>
  <title lang="en">Harry Potter</title>
  <price>29.99</price>
</book>

<book>
  <title lang="en">Learning XML</title>
  <price>39.95</price>
</book>

</bookstore>
```



------

## Selecting Nodes

XPath uses path expressions to select nodes in an XML document. The node is selected by following a path or steps. The most useful path expressions are listed below:

| Expression | Description                                                  |
| :--------- | :----------------------------------------------------------- |
| *nodename* | Selects all nodes with the name "*nodename*"                 |
| /          | Selects from the root node                                   |
| //         | Selects nodes in the document from the current node that match the selection no matter where they are |
| .          | Selects the current node                                     |
| ..         | Selects the parent of the current node                       |
| @          | Selects attributes                                           |

In the table below we have listed some path expressions and the result of the expressions:

| Path Expression | Result                                                       |
| :-------------- | :----------------------------------------------------------- |
| bookstore       | Selects all nodes with the name "bookstore"                  |
| /bookstore      | Selects the root element bookstore**Note:** If the path starts with a slash ( / ) it always represents an absolute path to an element! |
| bookstore/book  | Selects all book elements that are children of bookstore     |
| //book          | Selects all book elements no matter where they are in the document |
| bookstore//book | Selects all book elements that are descendant of the bookstore element, no matter where they are under the bookstore element |
| //@lang         | Selects all attributes that are named lang                   |

------

------

## Predicates

Predicates are used to find a specific node or a node that contains a specific value.

Predicates are always embedded in square brackets.

In the table below we have listed some path expressions with predicates and the result of the expressions:

| Path Expression                    | Result                                                       |
| :--------------------------------- | :----------------------------------------------------------- |
| /bookstore/book[1]                 | Selects the first book element that is the child of the bookstore element.**Note:** In IE 5,6,7,8,9 first node is[0], but according to W3C, it is [1]. To solve this problem in IE, set the SelectionLanguage to XPath:*In JavaScript: xml*.setProperty("SelectionLanguage","XPath"); |
| /bookstore/book[last()]            | Selects the last book element that is the child of the bookstore element |
| /bookstore/book[last()-1]          | Selects the last but one book element that is the child of the bookstore element |
| /bookstore/book[position()<3]      | Selects the first two book elements that are children of the bookstore element |
| //title[@lang]                     | Selects all the title elements that have an attribute named lang |
| //title[@lang='en']                | Selects all the title elements that have a "lang" attribute with a value of "en" |
| /bookstore/book[price>35.00]       | Selects all the book elements of the bookstore element that have a price element with a value greater than 35.00 |
| /bookstore/book[price>35.00]/title | Selects all the title elements of the book elements of the bookstore element that have a price element with a value greater than 35.00 |

------

## Selecting Unknown Nodes

XPath wildcards can be used to select unknown XML nodes.

| Wildcard | Description                  |
| :------- | :--------------------------- |
| *        | Matches any element node     |
| @*       | Matches any attribute node   |
| node()   | Matches any node of any kind |

In the table below we have listed some path expressions and the result of the expressions:

| Path Expression | Result                                                       |
| :-------------- | :----------------------------------------------------------- |
| /bookstore/*    | Selects all the child element nodes of the bookstore element |
| //*             | Selects all elements in the document                         |
| //title[@*]     | Selects all title elements which have at least one attribute of any kind |

------

## Selecting Several Paths

By using the | operator in an XPath expression you can select several paths.

In the table below we have listed some path expressions and the result of the expressions:

| Path Expression                  | Result                                                       |
| :------------------------------- | :----------------------------------------------------------- |
| //book/title \| //book/price     | Selects all the title AND price elements of all book elements |
| //title \| //price               | Selects all the title AND price elements in the document     |
| /bookstore/book/title \| //price | Selects all the title elements of the book element of the bookstore element AND all the price elements in the document |



# XPath Axes

[❮ Previous](https://www.w3schools.com/xml/xpath_syntax.asp)[Next ❯](https://www.w3schools.com/xml/xpath_operators.asp)

------

## The XML Example Document

We will use the following XML document in the examples below.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<bookstore>

<book>
  <title lang="en">Harry Potter</title>
  <price>29.99</price>
</book>

<book>
  <title lang="en">Learning XML</title>
  <price>39.95</price>
</book>

</bookstore>
```



------

## XPath Axes

An axis represents a relationship to the context (current) node, and is used to locate nodes relative to that node on the tree.

| AxisName           | Result                                                       |
| :----------------- | :----------------------------------------------------------- |
| ancestor           | Selects all ancestors (parent, grandparent, etc.) of the current node |
| ancestor-or-self   | Selects all ancestors (parent, grandparent, etc.) of the current node and the current node itself |
| attribute          | Selects all attributes of the current node                   |
| child              | Selects all children of the current node                     |
| descendant         | Selects all descendants (children, grandchildren, etc.) of the current node |
| descendant-or-self | Selects all descendants (children, grandchildren, etc.) of the current node and the current node itself |
| following          | Selects everything in the document after the closing tag of the current node |
| following-sibling  | Selects all siblings after the current node                  |
| namespace          | Selects all namespace nodes of the current node              |
| parent             | Selects the parent of the current node                       |
| preceding          | Selects all nodes that appear before the current node in the document, except ancestors, attribute nodes and namespace nodes |
| preceding-sibling  | Selects all siblings before the current node                 |
| self               | Selects the current node                                     |



# XPath Operators

[❮ Previous](https://www.w3schools.com/xml/xpath_axes.asp)[Next ❯](https://www.w3schools.com/xml/xpath_examples.asp)

------

An XPath expression returns either a node-set, a string, a Boolean, or a number.

------

## XPath Operators

Below is a list of the operators that can be used in XPath expressions:

| Operator | Description                  | Example                   |
| :------- | :--------------------------- | :------------------------ |
| \|       | Computes two node-sets       | //book \| //cd            |
| +        | Addition                     | 6 + 4                     |
| -        | Subtraction                  | 6 - 4                     |
| *        | Multiplication               | 6 * 4                     |
| div      | Division                     | 8 div 4                   |
| =        | Equal                        | price=9.80                |
| !=       | Not equal                    | price!=9.80               |
| <        | Less than                    | price<9.80                |
| <=       | Less than or equal to        | price<=9.80               |
| >        | Greater than                 | price>9.80                |
| >=       | Greater than or equal to     | price>=9.80               |
| or       | or                           | price=9.80 or price=9.70  |
| and      | and                          | price>9.00 and price<9.90 |
| mod      | Modulus (division remainder) | 5 mod 2                   |



# XPath Examples

[❮ Previous](https://www.w3schools.com/xml/xpath_operators.asp)[Next ❯](https://www.w3schools.com/xml/xsl_intro.asp)

------

Let's try to learn some basic XPath syntax by looking at some examples.

------

## The XML Example Document

We will use the following XML document in the examples below.

"books.xml":

```xml
<?xml version="1.0" encoding="UTF-8"?>

<bookstore>

<book category="cooking">
  <title lang="en">Everyday Italian</title>
  <author>Giada De Laurentiis</author>
  <year>2005</year>
  <price>30.00</price>
</book>

<book category="children">
  <title lang="en">Harry Potter</title>
  <author>J K. Rowling</author>
  <year>2005</year>
  <price>29.99</price>
</book>

<book category="web">
  <title lang="en">XQuery Kick Start</title>
  <author>James McGovern</author>
  <author>Per Bothner</author>
  <author>Kurt Cagle</author>
  <author>James Linn</author>
  <author>Vaidyanathan Nagarajan</author>
  <year>2003</year>
  <price>49.99</price>
</book>

<book category="web">
  <title lang="en">Learning XML</title>
  <author>Erik T. Ray</author>
  <year>2003</year>
  <price>39.95</price>
</book>

</bookstore>
```



[View the "books.xml" file in your browser](https://www.w3schools.com/xml/books.xml).

------

------

## Loading the XML Document

Using an XMLHttpRequest object to load XML documents is supported in all modern browsers.

```javasc
var xmlhttp = new XMLHttpRequest();
```



Code for older browsers (IE5 and IE6) can be found in the AJAX tutorial.

------

## Selecting Nodes

Unfortunately, there are different ways of dealing with XPath in different browsers.

Chrome, Firefox, Edge, Opera, and Safari use the evaluate() method to select nodes:

```javasc
xmlDoc.evaluate(*xpath*, xmlDoc, null, XPathResult.ANY_TYPE,null);
```



Internet Explorer uses the selectNodes() method to select node:

```javascript
xmlDoc.selectNodes(*xpath*);
```



In our examples we have included code that should work with most major browsers.

------

## Select all the titles

The following example selects all the title nodes:

### Example

```ini
/bookstore/book/title
```



[Try it Yourself »](https://www.w3schools.com/xml/tryit.asp?filename=try_xpath_select_cdnodes)

------

## Select the title of the first book

The following example selects the title of the first book node under the bookstore element:

### Example

```ini
/bookstore/book[1]/title
```



[Try it Yourself »](https://www.w3schools.com/xml/tryit.asp?filename=try_xpath_select_cdnodes_first)

------

## Select all the prices

The following example selects the text from all the price nodes:

### Example

```ini
/bookstore/book/price[text()]
```



[Try it Yourself »](https://www.w3schools.com/xml/tryit.asp?filename=try_xpath_select_pricenodes_text)

------

## Select price nodes with price>35

The following example selects all the price nodes with a price higher than 35:

### Example

```ini
/bookstore/book[price>35]/price
```



[Try it Yourself »](https://www.w3schools.com/xml/tryit.asp?filename=try_xpath_select_pricenodes_35)

------

## Select title nodes with price>35

The following example selects all the title nodes with a price higher than 35:

### Example

```ini
/bookstore/book[price>35]/title
```



[Try it Yourself »](https://www.w3schools.com/xml/tryit.asp?filename=try_xpath_select_pricenodes_high)