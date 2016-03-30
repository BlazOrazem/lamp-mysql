-------------------------
Many-To-Many Relationship
-------------------------
CREATE TABLE products_suppliers (
 productID   INT UNSIGNED  NOT NULL,
 supplierID  INT UNSIGNED  NOT NULL,
 PRIMARY KEY (productID, supplierID),
 FOREIGN KEY (productID)  REFERENCES products  (productID),
 FOREIGN KEY (supplierID) REFERENCES suppliers (supplierID)
);

INSERT INTO products_suppliers VALUES (2001, 501), (2002, 501),
       (2003, 501), (2004, 502), (2001, 503);
	   
ALTER TABLE products DROP FOREIGN KEY products_ibfk_1;

ALTER TABLE products DROP supplierID;

SELECT products.name AS `Product Name`, price, suppliers.name AS `Supplier Name`
FROM products_suppliers 
  JOIN products  ON products_suppliers.productID = products.productID
  JOIN suppliers ON products_suppliers.supplierID = suppliers.supplierID
WHERE price < 0.6;

SELECT p.name AS `Product Name`, s.name AS `Supplier Name`
FROM products_suppliers AS ps 
  JOIN products AS p ON ps.productID = p.productID
  JOIN suppliers AS s ON ps.supplierID = s.supplierID
WHERE p.name = 'Pencil 3B';