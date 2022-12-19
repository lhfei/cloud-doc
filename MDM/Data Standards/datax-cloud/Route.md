#### data-standard-service

```ini
standard/
├── contraststat				对照统计
│   └── index.vue
├── datadict					标准字典				
│   ├── DataDictAdd.vue
│   ├── DataDictDetail.vue
│   ├── DataDictEdit.vue
│   ├── DataDictList.vue
│   └── index.vue
├── dictcontrast				字典对照
│   ├── components
│   │   └── FormContrast.vue
│   ├── DictContrastAdd.vue
│   ├── DictContrastDetail.vue
│   ├── DictContrastEdit.vue
│   ├── DictContrastList.vue
│   └── index.vue
├── dictmapping					对照表
│   └── index.vue
└── index.vue

/standard/contraststat/index
/standard/datadict/index
/standard/dictcontrast/index
/standard/dictmapping/index
```



#### data-metadata-service

```ini
metadata/
├── changerecord
│   ├── ChangeRecordAdd.vue
│   ├── ChangeRecordDetail.vue
│   ├── ChangeRecordEdit.vue
│   ├── ChangeRecordList.vue
│   └── index.vue
├── dataauthorize
│   └── index.vue
├── datablood
│   └── index.vue
├── datacolumn
│   ├── DataColumnDetail.vue
│   ├── DataColumnList.vue
│   └── index.vue
├── datamap
│   └── index.vue
├── datasearch
│   ├── ColumnPane.vue
│   ├── index.vue
│   ├── SourcePane.vue
│   └── TablePane.vue
├── datasource
│   ├── DataSourceAdd.vue
│   ├── DataSourceDetail.vue
│   ├── DataSourceEdit.vue
│   ├── DataSourceList.vue
│   └── index.vue
├── index.vue
└── sqlconsole
    └── index.vue
```



1. Menus

   ```ini
   /metadata/changerecord/index
   /metadata/dataauthorize/index
   /metadata/datablood/index
   /metadata/datacolumn/index
   /metadata/datamap/index
   /metadata/datasearch/index
   /metadata/datasource/index
   /metadata/sqlconsole/indexs
   ```

   

2. Buttons

   ```ini
   metadata:datasource:add
   metadata:datasource:edit
   metadata:datasource:detail
   	metadata:datasource:sync			元数据同步
   	metadata:datasource:word			数据库文档
   	metadata:datasource:connect			数据源验证	
   metadata:datasource:remote
   ```

   

3. ...