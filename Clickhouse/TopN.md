





```sql
-- create database
CREATE database ad_test;

-- create table
CREATE TABLE ad_test.ad_stat (
  id             Int32   ,
  name           VARCHAR  ,
  product_group  VARCHAR  ,
  price          DOUBLE,
  promotion		 DOUBLE,
  order_date	DATE
  
) ENGINE = Memory ;
```



```sql
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 1  ,	'Tripple-A      ' ,		'Desktop   ' ,		1845 ,		0.84 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 2  ,	'Solid          ' ,		'Desktop   ' ,		1577 ,		0.85 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 3  ,	'Big Fat One    ' ,		'Desktop   ' ,		1134 ,		0.76 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 4  ,	'Workstation ONE' ,		'Desktop   ' ,		3285 ,		0.92 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 5  ,	'SmartAndElegant' ,		'Laptop    ' ,		3584 ,		0.86 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 6  ,	'WhiteHorse     ' ,		'Laptop    ' ,		3554 ,		0.9	 ,		'2018/05/11' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 7  ,	'Air            ' ,		'Laptop    ' ,		1725 ,		0.84 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 8  ,	'Angle          ' ,		'Laptop    ' ,		1437 ,		0.86 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 9  ,	'Rusty          ' ,		'Laptop    ' ,		1407 ,		0.96 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 10 ,	'AllRounder     ' ,		'Smartphone' ,		3267 ,		0.98 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 11 ,	'Oxygen 8       ' ,		'Smartphone' ,		3809 ,		0.81 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 12 ,	'Wizzard 7      ' ,		'Smartphone' ,		3922 ,		0.89 ,		'2018/05/11' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 13 ,	'AllDay Basic   ' ,		'Smartphone' ,		1146 ,		0.7	 ,		'2018/05/11' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 14 ,	'Tripple-A      ' ,		'Desktop   ' ,		828  ,		0.71 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 15 ,	'Solid          ' ,		'Desktop   ' ,		2210 ,		0.87 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 16 ,	'Big Fat One    ' ,		'Desktop   ' ,		1464 ,		0.84 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 17 ,	'Workstation ONE' ,		'Desktop   ' ,		3026 ,		0.78 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 18 ,	'SmartAndElegant' ,		'Laptop    ' ,		1502 ,		0.9	 ,		'2018/05/12' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 19 ,	'WhiteHorse     ' ,		'Laptop    ' ,		3707 ,		0.87 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 20 ,	'Air            ' ,		'Laptop    ' ,		626  ,		0.92 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 21 ,	'Angle          ' ,		'Laptop    ' ,		2033 ,		0.8	 ,		'2018/05/12' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 22 ,	'Rusty          ' ,		'Laptop    ' ,		3377 ,		0.98 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 23 ,	'AllRounder     ' ,		'Smartphone' ,		1647 ,		0.89 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 24 ,	'Oxygen 8       ' ,		'Smartphone' ,		643  ,		0.76 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 25 ,	'Wizzard 7      ' ,		'Smartphone' ,		3246 ,		0.95 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 26 ,	'AllDay Basic   ' ,		'Smartphone' ,		2254 ,		0.98 ,		'2018/05/12' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 27 ,	'Tripple-A      ' ,		'Desktop   ' ,		1691 ,		0.78 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 28 ,	'Solid          ' ,		'Desktop   ' ,		2446 ,		0.95 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 29 ,	'Big Fat One    ' ,		'Desktop   ' ,		554  ,		0.75 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 30 ,	'Workstation ONE' ,		'Desktop   ' ,		942  ,		0.94 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 31 ,	'SmartAndElegant' ,		'Laptop    ' ,		1154 ,		0.74 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 32 ,	'WhiteHorse     ' ,		'Laptop    ' ,		2601 ,		0.77 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 33 ,	'Air            ' ,		'Laptop    ' ,		1936 ,		0.88 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 34 ,	'Angle          ' ,		'Laptop    ' ,		1614 ,		0.8	 ,		'2018/05/13' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 35 ,	'Rusty          ' ,		'Laptop    ' ,		966  ,		0.91 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 36 ,	'AllRounder     ' ,		'Smartphone' ,		512  ,		0.83 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 37 ,	'Oxygen 8       ' ,		'Smartphone' ,		2560 ,		0.99 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 38 ,	'Wizzard 7      ' ,		'Smartphone' ,		1706 ,		0.84 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 39 ,	'AllDay Basic   ' ,		'Smartphone' ,		1702 ,		0.97 ,		'2018/05/13' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 40 ,	'Tripple-A      ' ,		'Desktop   ' ,		1141 ,		0.88 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 41 ,	'Solid          ' ,		'Desktop   ' ,		554  ,		0.75 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 42 ,	'Big Fat One    ' ,		'Desktop   ' ,		2664 ,		0.7	 ,		'2018/05/14' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 43 ,	'Workstation ONE' ,		'Desktop   ' ,		1363 ,		0.74 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 44 ,	'SmartAndElegant' ,		'Laptop    ' ,		2202 ,		0.91 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 45 ,	'WhiteHorse     ' ,		'Laptop    ' ,		2035 ,		0.83 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 46 ,	'Air            ' ,		'Laptop    ' ,		3620 ,		0.93 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 47 ,	'Angle          ' ,		'Laptop    ' ,		2887 ,		0.89 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 48 ,	'Rusty          ' ,		'Laptop    ' ,		3155 ,		0.84 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 49 ,	'AllRounder     ' ,		'Smartphone' ,		2861 ,		0.84 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 50 ,	'Oxygen 8       ' ,		'Smartphone' ,		783  ,		0.99 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 51 ,	'Wizzard 7      ' ,		'Smartphone' ,		2264 ,		0.84 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 52 ,	'AllDay Basic   ' ,		'Smartphone' ,		3100 ,		0.72 ,		'2018/05/14' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 53 ,	'Tripple-A      ' ,		'Desktop   ' ,		2955 ,		0.7	 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 54 ,	'Solid          ' ,		'Desktop   ' ,		1252 ,		0.75 ,		'2018/05/15' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 55 ,	'Big Fat One    ' ,		'Desktop   ' ,		3016 ,		0.76 ,		'2018/05/15' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 56 ,	'Workstation ONE' ,		'Desktop   ' ,		628  ,		0.82 ,		'2018/05/15' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 57 ,	'SmartAndElegant' ,		'Laptop    ' ,		1166 ,		0.8	 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 58 ,	'WhiteHorse     ' ,		'Laptop    ' ,		502  ,		0.98 ,		'2018/05/15' );	
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 59 ,	'Air            ' ,		'Laptop    ' ,		2467 ,		0.71 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 60 ,	'Angle          ' ,		'Laptop    ' ,		3620 ,		0.86 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 61 ,	'Rusty          ' ,		'Laptop    ' ,		1571 ,		0.73 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 62 ,	'AllRounder     ' ,		'Smartphone' ,		970  ,		0.74 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 63 ,	'Oxygen 8       ' ,		'Smartphone' ,		2392 ,		0.94 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 64 ,	'Wizzard 7      ' ,		'Smartphone' ,		3834 ,		0.93 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 65 ,	'AllDay Basic   ' ,		'Smartphone' ,		3644 ,		0.97 ,		'2018/05/15' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 66 ,	'Tripple-A      ' ,		'Desktop   ' ,		2899 ,		0.87 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 67 ,	'Solid          ' ,		'Desktop   ' ,		3766 ,		0.81 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 68 ,	'Big Fat One    ' ,		'Desktop   ' ,		3883 ,		0.85 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 69 ,	'Workstation ONE' ,		'Desktop   ' ,		2049 ,		0.9	 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 70 ,	'SmartAndElegant' ,		'Laptop    ' ,		1152 ,		0.83 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 71 ,	'WhiteHorse     ' ,		'Laptop    ' ,		3849 ,		0.75 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 72 ,	'Air            ' ,		'Laptop    ' ,		3365 ,		0.83 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 73 ,	'Angle          ' ,		'Laptop    ' ,		3616 ,		0.81 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 74 ,	'Rusty          ' ,		'Laptop    ' ,		3009 ,		0.85 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 75 ,	'AllRounder     ' ,		'Smartphone' ,		3514 ,		0.89 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 76 ,	'Oxygen 8       ' ,		'Smartphone' ,		1697 ,		0.81 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 77 ,	'Wizzard 7      ' ,		'Smartphone' ,		1089 ,		0.96 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 78 ,	'AllDay Basic   ' ,		'Smartphone' ,		2244 ,		0.86 ,		'2018/05/16' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 79 ,	'Tripple-A      ' ,		'Desktop   ' ,		1111 ,		0.81 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 80 ,	'Solid          ' ,		'Desktop   ' ,		733  ,		0.8	 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 81 ,	'Big Fat One    ' ,		'Desktop   ' ,		2608 ,		0.88 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 82 ,	'Workstation ONE' ,		'Desktop   ' ,		2758 ,		0.86 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 83 ,	'SmartAndElegant' ,		'Laptop    ' ,		2915 ,		0.74 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 84 ,	'WhiteHorse     ' ,		'Laptop    ' ,		723  ,		0.92 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 85 ,	'Air            ' ,		'Laptop    ' ,		2678 ,		0.93 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 86 ,	'Angle          ' ,		'Laptop    ' ,		1956 ,		0.74 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 87 ,	'Rusty          ' ,		'Laptop    ' ,		581  ,		0.82 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 88 ,	'AllRounder     ' ,		'Smartphone' ,		3225 ,		0.99 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 89 ,	'Oxygen 8       ' ,		'Smartphone' ,		2101 ,		0.9	 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 90 ,	'Wizzard 7      ' ,		'Smartphone' ,		1775 ,		0.97 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 91 ,	'AllDay Basic   ' ,		'Smartphone' ,		1090 ,		0.87 ,		'2018/05/17' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 92 ,	'Tripple-A      ' ,		'Desktop   ' ,		1496 ,		0.84 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 93 ,	'Solid          ' ,		'Desktop   ' ,		2836 ,		0.96 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 94 ,	'Big Fat One    ' ,		'Desktop   ' ,		1550 ,		0.99 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 95 ,	'Workstation ONE' ,		'Desktop   ' ,		962  ,		0.86 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 96 ,	'SmartAndElegant' ,		'Laptop    ' ,		1617 ,		0.86 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 97 ,	'WhiteHorse     ' ,		'Laptop    ' ,		714  ,		0.92 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 98 ,	'Air            ' ,		'Laptop    ' ,		2651 ,		0.94 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 99 ,	'Angle          ' ,		'Laptop    ' ,		1161 ,		0.8	 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 100,	'Rusty          ' ,		'Laptop    ' ,		1008 ,		0.78 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 101,	'AllRounder     ' ,		'Smartphone' ,		1679 ,		0.88 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 102,	'Oxygen 8       ' ,		'Smartphone' ,		1194 ,		0.83 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 103,	'Wizzard 7      ' ,		'Smartphone' ,		3925 ,		0.71 ,		'2018/05/18' );
INSERT INTO ad_test.ad_stat (id, name, product_group, price, promotion, order_date) VALUES ( 104,	'AllDay Basic   ' ,		'Smartphone' ,		1542 ,		0.72 ,		'2018/05/18' );

```



Top N

```sql
-- get the average of the top 5 of each group
SELECT
	product_group,
	order_date,
	arraySlice(
		groupArray(name),
		1,
		5
	) as name,
	round(
		arraySum(
			arraySlice(
				arrayReverseSort(
					groupArray(price)
				),
				1,
				5
			)
		) / 5,
		4
	) as price
FROM
	ad_test.ad_stat
GROUP BY
	product_group,
	order_date
ORDER BY
	order_date,
	product_group,
	price desc,
	name
```