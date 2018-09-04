

### Conceptual View    

| Row Key            | Time Stamp |                               | ColumnFamily anchor        | ColumnFamily people |
| ------------------ | ---------- | ----------------------------- | -------------------------- | ------------------- |
| "com.cnn.www"      | t9         | anchor:cnnsi.com = "CNN"      |                            |                     |
| "com.cnn.www"      | t8         | anchor:my.look.ca = "CNN.com" |                            |                     |
| "com.cnn.www"      | t6         | contents:html = "<html>…"     |                            |                     |
| "com.cnn.www"      | t5         | contents:html = "<html>…"     |                            |                     |
| "com.cnn.www"      | t3         | contents:html = "<html>…"     |                            |                     |
| "com.example.ww w" | t5         | contents:html = "<html>…"     | people:author = "John Doe" |                     |

 

```json
{
    "com.cnn.www": {
        contents: {
            t6: contents:html: "<html>..."
            t5: contents:html: "<html>..."
            t3: contents:html: "<html>..."
        } 
        anchor: {
            t9: anchor:cnnsi.com = "CNN"
            t8: anchor:my.look.ca = "CNN.com"
        } 
        people: {}
    } 
    "com.example.www": {
        contents: {
            t5: contents:html: "<html>..."
        } 
        anchor: {}
        people: {
            t5: people:author: "John Doe"
        }
    }
}
```



### Physical View

Although at a conceptual level tables may be viewed as a sparse set of rows, they are physically
stored by column family. A new column qualifier (column_family:column_qualifier) can be added
to an existing column family at any time.

**Table 7. ColumnFamily**  *anchor*

| Row Key       | Time Stamp | Column Family anchor          |
| ------------- | ---------- | ----------------------------- |
| "com.cnn.www" | t9         | anchor:cnnsi.com = "CNN"      |
| "com.cnn.www" | t8         | anchor:my.look.ca = "CNN.com" |



**Table 8. ColumnFamily**  *contents*

| Row Key       | Time Stamp | ColumnFamily contents:    |
| ------------- | ---------- | ------------------------- |
| "com.cnn.www" | t6         | contents:html = "<html>…" |
| "com.cnn.www" | t5         | contents:html = "<html>…" |
| "com.cnn.www" | t3         | contents:html = "<html>…  |

 




