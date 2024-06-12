### To MySQL

```python
import pymongo
import pymysql
from pymongo import MongoClient

# MongoDB connection details
mongo_client = MongoClient('mongodb://127.0.0.1:27017/')
mongo_db = mongo_client['Profile']
mongo_collection = mongo_db['users']

# MySQL connection details
mysql_host = 'localhost'
mysql_user = 'root'
mysql_password = '*****'
mysql_db = 'Profile'

# Connect to MySQL
mysql_conn = pymysql.connect(host=mysql_host, user=mysql_user, password=mysql_password, db=mysql_db)
mysql_cursor = mysql_conn.cursor()

# Query MongoDB and insert records into MySQL
mongo_data = mongo_collection.find()
for document in mongo_data:
    # Convert MongoDB _id to string for insertion into MySQL
    _id_str = str(document['_id'])
    
    # Set MySQL id field using MongoDB _id
    document['id'] = _id_str

    # Exclude the '_id' and 'id' fields from columns
    columns = [key for key in document.keys() if key not in ('_id', 'id')]
    values = [document.get(column, None) for column in columns]

    # Escape special characters in values using parameterized queries
    values = [str(value) for value in values]

    # Create the placeholders for the query string
    placeholders = ', '.join(['%s'] * len(columns))

    # Construct the query string
    query = f"INSERT INTO users (id, {', '.join(columns)}) VALUES (%s, {placeholders})"

    # Execute the query
    mysql_cursor.execute(query, [_id_str] + values)

# Commit and close connections
mysql_conn.commit()
mysql_conn.close()
mongo_client.close()
```

