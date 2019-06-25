



### Read Excel and Extract to Hive

#### Hive Table

```sql
CREATE TABLE `kpi_1`(
   `bank_name` varchar(64),
   `ammount` integer)
 ROW FORMAT SERDE
   'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
 WITH SERDEPROPERTIES (
   'field.delim'=',',
   'serialization.format'=',')
 STORED AS INPUTFORMAT
   'org.apache.hadoop.mapred.TextInputFormat'       
 OUTPUTFORMAT
   'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
 TBLPROPERTIES (
   'bucketing_version'='2',
   'skip.header.line.count'='1',
   'serialization.encoding'='GBK',
   'transient_lastDdlTime'='1555316771');
```



#### Notebook

```python
import pandas as pd
import pandas.io as sql
import matplotlib.pyplot as plt
from pyhive import hive
import pandas as pd
import numpy as np
import os
import subprocess

stor_path="./Dataset/"
kpi_name = "kpi_1";
excel_file = "./Dataset/enterprise.xlsx"

# sales = pd.read_excel(excel_file)

sales = pd.read_excel(excel_file, sheet_name="2.大户汇总透视表（大项）")

sales.head(100)

#lp = sales[sales.columns[2]]

# lp[1:len(lp)].plot(kind='barh')
#lp.polt(kind='hist')
#plt.show()

sub_arr = sales[sales.columns[1:3]]

sub_arr.head(100)
# sub_arr[3:]

#df = pd.DataFrame(sub_arr[4:])
df = sub_arr[4:]

df.columns = ["bank_name", "ammount"]

file_path = stor_path + kpi_name
df.to_csv(file_path, encoding="GBK", index=False)

#os.system('whoami')
out = subprocess.Popen(['hdfs', 'dfs', '-put', file_path, '/warehouse/tablespace/managed/hive/pcb_edw.db/kpi_1'], 
           stdout=subprocess.PIPE, 
           stderr=subprocess.STDOUT)

print(out.communicate())
```

