-------------------------
One-To-Many Relationship
-------------------------
DROP TABLE IF EXISTS suppliers;

CREATE TABLE suppliers (
 supplierID  INT UNSIGNED  NOT NULL AUTO_INCREMENT, 
 name        VARCHAR(30)   NOT NULL DEFAULT '', 
 phone       CHAR(8)       NOT NULL DEFAULT '',
 PRIMARY KEY (supplierID)
);

INSERT INTO suppliers VALUE
  (501, 'ABC Traders', '88881111'), 
  (502, 'XYZ Company', '88882222'), 
  (503, 'QQ Corp', '88883333');
  
ALTER TABLE products
   ADD COLUMN supplierID INT UNSIGNED NOT NULL;
   
UPDATE products SET supplierID = 501;

ALTER TABLE products
   ADD FOREIGN KEY (supplierID) REFERENCES suppliers (supplierID);
   
UPDATE products SET supplierID = 502 WHERE productID  = 2004;

*SELECT with JOIN*
SELECT products.name, price, suppliers.name 
FROM products 
  JOIN suppliers ON products.supplierID = suppliers.supplierID
WHERE price < 0.6;

SELECT products.name, price, suppliers.name 
FROM products, suppliers 
WHERE products.supplierID = suppliers.supplierID
  AND price < 0.6;
  
SELECT products.name AS `Product Name`, price, suppliers.name AS `Supplier Name` 
FROM products 
  JOIN suppliers ON products.supplierID = suppliers.supplierID
WHERE price < 0.6;

SELECT p.name AS `Product Name`, p.price, s.name AS `Supplier Name` 
FROM products AS p 
  JOIN suppliers AS s ON p.supplierID = s.supplierID
WHERE p.price < 0.6;