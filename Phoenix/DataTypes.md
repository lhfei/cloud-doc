# Data Types

## Index

| [INTEGER Type](https://phoenix.apache.org/language/datatypes.html#integer_type) [UNSIGNED_INT Type](https://phoenix.apache.org/language/datatypes.html#unsigned_int_type) [BIGINT Type](https://phoenix.apache.org/language/datatypes.html#bigint_type) [UNSIGNED_LONG Type](https://phoenix.apache.org/language/datatypes.html#unsigned_long_type) [TINYINT Type](https://phoenix.apache.org/language/datatypes.html#tinyint_type) [UNSIGNED_TINYINT Type](https://phoenix.apache.org/language/datatypes.html#unsigned_tinyint_type) [SMALLINT Type](https://phoenix.apache.org/language/datatypes.html#smallint_type) [UNSIGNED_SMALLINT Type](https://phoenix.apache.org/language/datatypes.html#unsigned_smallint_type) [FLOAT Type](https://phoenix.apache.org/language/datatypes.html#float_type) | [UNSIGNED_FLOAT Type](https://phoenix.apache.org/language/datatypes.html#unsigned_float_type) [DOUBLE Type](https://phoenix.apache.org/language/datatypes.html#double_type) [UNSIGNED_DOUBLE Type](https://phoenix.apache.org/language/datatypes.html#unsigned_double_type) [DECIMAL Type](https://phoenix.apache.org/language/datatypes.html#decimal_type) [BOOLEAN Type](https://phoenix.apache.org/language/datatypes.html#boolean_type) [TIME Type](https://phoenix.apache.org/language/datatypes.html#time_type) [DATE Type](https://phoenix.apache.org/language/datatypes.html#date_type) [TIMESTAMP Type](https://phoenix.apache.org/language/datatypes.html#timestamp_type) [UNSIGNED_TIME Type](https://phoenix.apache.org/language/datatypes.html#unsigned_time_type) | [UNSIGNED_DATE Type](https://phoenix.apache.org/language/datatypes.html#unsigned_date_type) [UNSIGNED_TIMESTAMP Type](https://phoenix.apache.org/language/datatypes.html#unsigned_timestamp_type) [VARCHAR Type](https://phoenix.apache.org/language/datatypes.html#varchar_type) [CHAR Type](https://phoenix.apache.org/language/datatypes.html#char_type) [BINARY Type](https://phoenix.apache.org/language/datatypes.html#binary_type) [VARBINARY Type](https://phoenix.apache.org/language/datatypes.html#varbinary_type) [ARRAY](https://phoenix.apache.org/language/datatypes.html#array) |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
|                                                              |                                                              |                                                              |

### INTEGER Type

```
INTEGER
```

Possible values: -2147483648 to 2147483647.

Mapped to `java.lang.Integer`. The binary representation is a 4 byte integer with the sign bit flipped (so that negative values sorts before positive values).

Example:

INTEGER

### UNSIGNED_INT Type

```
UNSIGNED_INT
```

Possible values: 0 to 2147483647. Mapped to `java.lang.Integer`. The binary representation is a 4 byte integer, matching the `HBase` Bytes.toBytes(int) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_INT

### BIGINT Type

```
BIGINT
```

Possible values: -9223372036854775808 to 9223372036854775807. Mapped to `java.lang.Long`. The binary representation is an 8 byte long with the sign bit flipped (so that negative values sorts before positive values).

Example:

BIGINT

### UNSIGNED_LONG Type

```
UNSIGNED_LONG
```

Possible values: 0 to 9223372036854775807. Mapped to `java.lang.Long`. The binary representation is an 8 byte integer, matching the `HBase` Bytes.toBytes(long) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_LONG

### TINYINT Type

```
TINYINT
```

Possible values: -128 to 127. Mapped to `java.lang.Byte`. The binary representation is a single byte, with the sign bit flipped (so that negative values sorts before positive values).

Example:

TINYINT

### UNSIGNED_TINYINT Type

```
UNSIGNED_TINYINT
```

Possible values: 0 to 127. Mapped to `java.lang.Byte`. The binary representation is a single byte, matching the `HBase` Bytes.toBytes(byte) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_TINYINT

### SMALLINT Type

```
SMALLINT
```

Possible values: -32768 to 32767. Mapped to `java.lang.Short`. The binary representation is a 2 byte short with the sign bit flipped (so that negative values sort before positive values).

Example:

SMALLINT

### UNSIGNED_SMALLINT Type

```
UNSIGNED_SMALLINT
```

Possible values: 0 to 32767. Mapped to `java.lang.Short`. The binary representation is an 2 byte integer, matching the `HBase` Bytes.toBytes(short) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_SMALLINT

### FLOAT Type

```
FLOAT
```

Possible values: -3.402823466 E + 38 to 3.402823466 E + 38. Mapped to `java.lang.Float`. The binary representation is an 4 byte float with the sign bit flipped (so that negative values sort before positive values).

Example:

FLOAT

### UNSIGNED_FLOAT Type

```
UNSIGNED_FLOAT
```

Possible values: 0 to 3.402823466 E + 38. Mapped to `java.lang.Float`. The binary representation is an 4 byte float matching the `HBase` Bytes.toBytes(float) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_FLOAT

### DOUBLE Type

```
DOUBLE
```

Possible values: -1.7976931348623158 E + 308 to 1.7976931348623158 E + 308. Mapped to `java.lang.Double`. The binary representation is an 8 byte double with the sign bit flipped (so that negative values sort before positive value).

Example:

DOUBLE

### UNSIGNED_DOUBLE Type

```
UNSIGNED_DOUBLE
```

Possible values: 0 to  1.7976931348623158 E + 308. Mapped to `java.lang.Double`. The binary representation is an 8 byte double matching the `HBase` Bytes.toBytes(double) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_DOUBLE

### DECIMAL Type

| `DECIMAL` | `( precisionInt , scaleInt )` |
| --------- | ----------------------------- |
|           |                               |

Data type with fixed precision and scale. A user can specify precision and scale by expression `DECIMAL`(precision,scale) in a `DDL` statement, for example, `DECIMAL`(10,2). The maximum precision is 38 digits. Mapped to `java.math.BigDecimal`. The binary representation is binary comparable, variable length format. When used in a row key, it is terminated with a null byte unless it is the last column.

Example:

DECIMAL
DECIMAL(10,2)

### BOOLEAN Type

```
BOOLEAN
```

Possible values: `TRUE` and `FALSE`.

Mapped to `java.lang.Boolean`. The binary representation is a single byte with 0 for false and 1 for true

Example:

BOOLEAN

### TIME Type

```
TIME
```

The time data type. The format is yyyy-`MM`-dd hh:mm:ss, with both the date and time parts maintained. Mapped to `java.sql.Time`. The binary representation is an 8 byte long (the number of milliseconds from the epoch), making it possible (although not necessarily recommended) to store more information within a `TIME` column than what is provided by `java.sql.Time`. Note that the internal representation is based on a number of milliseconds since the epoch (which is based on a time in `GMT`), while `java.sql.Time` will format times based on the client's local time zone. Please note that this `TIME` type is different than the `TIME` type as defined by the SQL 92 standard in that it includes year, month, and day components. As such, it is not in compliance with the `JDBC APIs`. As the underlying data is still stored as a long, only the presentation of the value is incorrect.

Example:

TIME

### DATE Type

```
DATE
```

The date data type. The format is yyyy-`MM`-dd hh:mm:ss, with both the date and time parts maintained to a millisecond accuracy. Mapped to `java.sql.Date`. The binary representation is an 8 byte long (the number of milliseconds from the epoch), making it possible (although not necessarily recommended) to store more information within a `DATE` column than what is provided by `java.sql.Date`. Note that the internal representation is based on a number of milliseconds since the epoch (which is based on a time in `GMT`), while `java.sql.Date` will format dates based on the client's local time zone. Please note that this `DATE` type is different than the `DATE` type as defined by the SQL 92 standard in that it includes a time component. As such, it is not in compliance with the `JDBC APIs`. As the underlying data is still stored as a long, only the presentation of the value is incorrect.

Example:

DATE

### TIMESTAMP Type

```
TIMESTAMP
```

The timestamp data type. The format is yyyy-`MM`-dd hh:mm:ss[.nnnnnnnnn]. Mapped to `java.sql.Timestamp` with an internal representation of the number of nanos from the epoch. The binary representation is 12 bytes: an 8 byte long for the epoch time plus a 4 byte integer for the nanos. Note that the internal representation is based on a number of milliseconds since the epoch (which is based on a time in `GMT`), while `java.sql.Timestamp` will format timestamps based on the client's local time zone.

Example:

TIMESTAMP

### UNSIGNED_TIME Type

```
UNSIGNED_TIME
```

The unsigned time data type. The format is yyyy-`MM`-dd hh:mm:ss, with both the date and time parts maintained to the millisecond accuracy. Mapped to `java.sql.Time`. The binary representation is an 8 byte long (the number of milliseconds from the epoch) matching the `HBase.toBytes`(long) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_TIME

### UNSIGNED_DATE Type

```
UNSIGNED_DATE
```

The unsigned date data type. The format is yyyy-`MM`-dd hh:mm:ss, with both the date and time parts maintained to a millisecond accuracy. Mapped to `java.sql.Date`. The binary representation is an 8 byte long (the number of milliseconds from the epoch) matching the `HBase.toBytes`(long) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_DATE

### UNSIGNED_TIMESTAMP Type

```
UNSIGNED_TIMESTAMP
```

The timestamp data type. The format is yyyy-`MM`-dd hh:mm:ss[.nnnnnnnnn]. Mapped to `java.sql.Timestamp` with an internal representation of the number of nanos from the epoch. The binary representation is 12 bytes: an 8 byte long for the epoch time plus a 4 byte integer for the nanos with the long serialized through the `HBase.toBytes`(long) method. The purpose of this type is to map to existing `HBase` data that was serialized using this `HBase` utility method. If that is not the case, use the regular signed type instead.

Example:

UNSIGNED_TIMESTAMP

### VARCHAR Type

| `VARCHAR` | `( precisionInt )` |
| --------- | ------------------ |
|           |                    |

A variable length String with an optional max byte length. The binary representation is `UTF8` matching the `HBase` Bytes.toBytes(String) method. When used in a row key, it is terminated with a null byte unless it is the last column.

Mapped to `java.lang.String`.

Example:

VARCHAR
VARCHAR(255)

### CHAR Type

```
CHAR ( precisionInt )
```

A fixed length String with single-byte characters. The binary representation is `UTF8` matching the `HBase` Bytes.toBytes(String) method.

Mapped to `java.lang.String`.

Example:

CHAR(10)

### BINARY Type

```
BINARY ( precisionInt )
```

Raw fixed length byte array.

Mapped to `byte[]`.

Example:

BINARY

### VARBINARY Type

```
VARBINARY
```

Raw variable length byte array.

Mapped to `byte[]`.

Example:

VARBINARY

### ARRAY

| `ARRAY` | `[` `dimensionInt``]` |
| ------- | --------------------- |
|         |                       |

Mapped to `java.sql.Array`. Every primitive type except for `VARBINARY` may be declared as an `ARRAY`. Only single dimensional arrays are supported.

Example:

VARCHAR ARRAY
CHAR(10) ARRAY [5]
INTEGER []
INTEGER [100]