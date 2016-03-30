-------------------------
Producing Summary Reports
-------------------------

*DISTINCT*
SELECT price FROM products;
SELECT DISTINCT price AS `Distinct Price` FROM products;
SELECT DISTINCT price, name FROM products;

*GROUP BY Clause*
SELECT * FROM products ORDER BY productCode, productID;
Only first record in each group is shown
SELECT * FROM products GROUP BY productCode;

SELECT COUNT(*) AS `Count` FROM products;
SELECT productCode, COUNT(*) FROM products GROUP BY productCode;

SELECT productCode, COUNT(*) AS count 
       FROM products 
       GROUP BY productCode
       ORDER BY count DESC;

SELECT MAX(price), MIN(price), AVG(price), STD(price), SUM(quantity) 
       FROM products;

SELECT productCode, MAX(price) AS `Highest Price`, MIN(price) AS `Lowest Price`
       FROM products
       GROUP BY productCode;
	   
SELECT productCode, MAX(price), MIN(price),
	  CAST(AVG(price) AS DECIMAL(7,2)) AS `Average`,
	  CAST(STD(price) AS DECIMAL(7,2)) AS `Std Dev`,
	  SUM(quantity)
FROM products
GROUP BY productCode;

*HAVING clause*
SELECT
  productCode AS `Product Code`,
  COUNT(*) AS `Count`,
  CAST(AVG(price) AS DECIMAL(7,2)) AS `Average`
FROM products 
GROUP BY productCode
HAVING Count >=3;

*WITH ROLLUP*
SELECT 
  productCode, 
  MAX(price), 
  MIN(price), 
  CAST(AVG(price) AS DECIMAL(7,2)) AS `Average`,
  SUM(quantity)
FROM products
GROUP BY productCode
WITH ROLLUP;