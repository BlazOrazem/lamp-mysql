-----------------------
Modifying Data - UPDATE
-----------------------
UPDATE products SET price = price * 1.1;
UPDATE products SET quantity = quantity - 100 WHERE name = 'Pen Red';
UPDATE products SET quantity = quantity + 50, price = 1.23 WHERE name = 'Pen Red';