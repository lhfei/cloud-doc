



```shell
pip install thrift_sasl pyhive

yum install cyrus-sasl-devel cyrus-sasl-gssapi cyrus-sasl-md5 cyrus-sasl-plain
```



```python
from pyhive import hive
import pandas as pd

#Create Hive connection 
conn = hive.Connection(host="10.182.61.116", port=10000, username="hdfs")

# Read Hive table and Create pandas dataframe
df = pd.read_sql("show databases", conn)
print(df.head())
```

