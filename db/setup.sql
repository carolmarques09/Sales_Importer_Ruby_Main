CREATE DATABASE IF NOT EXISTS sales_importer;
USE sales_importer;

CREATE TABLE purchasers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(255),
  price DECIMAL(10,2)
);

CREATE TABLE purchases (
  id INT AUTO_INCREMENT PRIMARY KEY,
  purchaser_id INT,
  merchant_id INT,
  item_id INT,
  purchase_count INT,
  FOREIGN KEY (purchaser_id) REFERENCES purchasers(id),
  FOREIGN KEY (merchant_id) REFERENCES merchants(id),
  FOREIGN KEY (item_id) REFERENCES items(id)
);
