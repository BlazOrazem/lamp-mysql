-----------------------
One-to-one Relationship
-----------------------
CREATE TABLE product_details (
  productID  INT UNSIGNED   NOT NULL,
  comment    TEXT  NULL,
  PRIMARY KEY (productID),
  FOREIGN KEY (productID) REFERENCES products (productID)
);