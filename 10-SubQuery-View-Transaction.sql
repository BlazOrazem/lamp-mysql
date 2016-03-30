---------
Sub-Query
---------
SELECT suppliers.name from suppliers
WHERE suppliers.supplierID
  NOT IN (SELECT DISTINCT supplierID from products_suppliers);

  
---------
View
---------
CREATE VIEW supplier_view
AS
SELECT suppliers.name as `Supplier Name`, products.name as `Product Name`
FROM products 
  JOIN suppliers ON products.productID = products_suppliers.productID
  JOIN products_suppliers ON suppliers.supplierID = products_suppliers.supplierID;
  
SELECT * FROM supplier_view;
  
SELECT * FROM supplier_view WHERE `Supplier Name` LIKE 'ABC%';

DROP VIEW IF EXISTS supplier_view;


------------
Transactions
------------
CREATE TABLE accounts (
  name     VARCHAR(30),
  balance  DECIMAL(10,2)
);
 
INSERT INTO accounts VALUES ('Paul', 1000), ('Peter', 2000);

START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE name = 'Paul';
UPDATE accounts SET balance = balance + 100 WHERE name = 'Peter';
COMMIT;

START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE name = 'Paul';
UPDATE accounts SET balance = balance + 100 WHERE name = 'Peter';
ROLLBACK;

SET autocommit = 0;
UPDATE accounts SET balance = balance - 100 WHERE name = 'Paul';
UPDATE accounts SET balance = balance + 100 WHERE name = 'Peter';
COMMIT;

SELECT * FROM accounts;

UPDATE accounts SET balance = balance - 100 WHERE name = 'Paul';
UPDATE accounts SET balance = balance + 100 WHERE name = 'Peter';
ROLLBACK;

SELECT * FROM accounts;

SET autocommit = 1; 