





```sql
-- create database
CREATE database ad_test;

-- create table
CREATE TABLE ad_test.ck_test.product (
  id             Int32   ,
  name           VARCHAR  ,
  product_group  VARCHAR  ,
  prize          DOUBLE
) ENGINE = Memory ;

-- init data

INSERT INTO ad_test.product VALUES ( 1, 'Big Fat One'    , 'Desktop',    545);
INSERT INTO ad_test.product VALUES ( 2, 'SmartAndElegant', 'Laptop',     675);
INSERT INTO ad_test.product VALUES ( 3, 'Angle',           'Laptop',     398);
INSERT INTO ad_test.product VALUES ( 4, 'Wizzard 7',       'Smartphone', 380);
INSERT INTO ad_test.product VALUES ( 5, 'Solid',           'Desktop',    565);
INSERT INTO ad_test.product VALUES ( 6, 'AllRounder',      'Smartphone', 535);
INSERT INTO ad_test.product VALUES ( 7, 'WhiteHorse',      'Laptop',     675);
INSERT INTO ad_test.product VALUES ( 8, 'Workstation ONE', 'Desktop',    499);
INSERT INTO ad_test.product VALUES ( 9, 'Air',             'Laptop',     450);
INSERT INTO ad_test.product VALUES (10, 'Rusty',           'Laptop',     390);
INSERT INTO ad_test.product VALUES (11, 'Tripple-A',       'Desktop',    580);
INSERT INTO ad_test.product VALUES (12, 'Oxygen 8',        'Smartphone', 450);
INSERT INTO ad_test.product VALUES (13, 'AllDay Basic',    'Smartphone',  75);
```





```sql
-- SELECT with a non-correlated subquery. The subquery is executed only once.
SELECT *
FROM   ad_test.product
WHERE  prize IN      -- prize is a very weak criterion
  (SELECT MAX(prize)
   FROM   ad_test.product
   GROUP BY product_group
  )
;
```



```sql
-- SELECT with a correlated subquery. Observe the performance! The subquery is executed
-- once per row of p1 !!!
SELECT *
FROM   ad_test.product p1
WHERE  prize IN      -- prize is a very weak criterion
  (SELECT MAX(prize)
   FROM   ad_test.product p2
   WHERE  p1.product_group = p2.product_group
  )
;
```



```sql
SELECT p1.*
FROM   ad_test.product p1
JOIN   ad_test.product p2 ON (p1.product_group = p2.product_group)
GROUP BY p1.id, p1.name, p1.product_group, p1.prize
HAVING p1.prize = MAX(p2.prize)
;	
```



```sql
SELECT *
FROM   ad_test.product p1
WHERE NOT EXISTS
  (SELECT *
   FROM  ad_test.product p2
   WHERE p1.product_group = p2.product_group
   AND   p1.prize < p2.prize
  )
;
```



```
-- modification of the second solution (correlated subquery)
SELECT *
FROM   ad_test.product p1
WHERE  id IN
  (SELECT id
   FROM   ad_test.product p2
   WHERE  p1.product_group = p2.product_group
   ORDER BY prize DESC
   FETCH FIRST 1 ROW ONLY    -- replace "ONLY" with "WITH TIES" to include rows with identical prize at the cutting edge
  )
;
```





















```sql
SELECT *
FROM
  (SELECT product.*,
          row_number() OVER (PARTITION BY product_group ORDER BY prize DESC) AS rownumber_per_group,
          min(prize)   OVER (PARTITION BY product_group ORDER BY prize DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS min,
          avg(prize)   OVER (PARTITION BY product_group ORDER BY prize DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS avg,
          max(prize)   OVER (PARTITION BY product_group ORDER BY prize DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max
   FROM   ad_test.product
  ) tmp
WHERE  rownumber_per_group < 2
;
```



TOP N

```sql
SELECT
	page,
	arrayMap(
		lambda(
			tuple(i),
			countries[(
				i + 1
			)]
		),
		range(5)
	) AS countries,
	arrayMap(
		lambda(
			tuple(i),
			countryImpressions[(
				i + 1
			)]
		),
		range(5)
	) AS countryImpressions,
	totalImpressions
FROM
	(
		SELECT
			page,
			groupArray(country) AS countries,
			groupArray(impressions) AS countryImpressions,
			sum( impressions ) AS totalImpressions
		FROM
			(
				SELECT
					page,
					country,
					uniq(requestid) AS impressions
				FROM
					mydatabase.mytable
				GROUP BY
					page,
					country
				ORDER BY
					impressions DESC
			)
		GROUP BY
			page
		ORDER BY
			totalImpressions DESC
	)
LIMIT 10

```

