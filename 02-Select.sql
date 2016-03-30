------
Select
------

*Querying the Database*
SELECT name, price FROM products;
SELECT * FROM products;

*SELECT without Table*
SELECT 1+1;
SELECT NOW();
SELECT 1+1, NOW();

*Comparison Operators*
SELECT name, price FROM products WHERE price < 1.0;
SELECT name, quantity FROM products WHERE quantity <= 2000;

*String Pattern Matching - LIKE and NOT LIKE*
SELECT name, price FROM products WHERE name LIKE 'PENCIL%';
SELECT name, price FROM products WHERE name LIKE 'P__ %';

*Logical Operators - AND, OR, NOT, XOR*
SELECT * FROM products WHERE quantity >= 5000 AND name LIKE 'Pen %';
SELECT * FROM products WHERE quantity >= 5000 AND price < 1.24 AND name LIKE 'Pen %';
SELECT * FROM products WHERE NOT (quantity >= 5000 AND name LIKE 'Pen %');

*IN, NOT IN*
SELECT * FROM products WHERE name IN ('Pen Red', 'Pen Black');

*BETWEEN, NOT BETWEEN*
SELECT * FROM products 
WHERE (price BETWEEN 1.0 AND 2.0) AND (quantity BETWEEN 1000 AND 2000);

*IS NULL, IS NOT NULL*
SELECT * FROM products WHERE productCode IS NULL;

*ORDER BY Clause*
SELECT * FROM products WHERE name LIKE 'Pen %' ORDER BY price DESC;
SELECT * FROM products WHERE name LIKE 'Pen %' ORDER BY price DESC, quantity;
SELECT * FROM products ORDER BY RAND();

*LIMIT Clause*
SELECT * FROM products ORDER BY price LIMIT 2;
SELECT * FROM products ORDER BY price LIMIT 2, 1;

*AS - Alias*
SELECT productID AS ID, productCode AS Code, name AS Description, price AS `Unit Price`
FROM products
ORDER BY ID;

*Function CONCAT()*
SELECT CONCAT(productCode, ' - ', name) AS `Product Description`, price FROM products;