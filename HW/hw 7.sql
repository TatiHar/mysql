USE shop;
-- №1
SELECT DISTINCT name 
  FROM users 
  INNER JOIN orders  
    ON users.id = orders.user_id;
    
-- №2   
SELECT products.name AS product_name, catalogs.name AS product_type 
  FROM products 
  LEFT JOIN catalogs 
    ON products.catalog_id = catalogs.id;
    
-- №3 

DROP DATABASE IF EXISTS airlogs;
CREATE DATABASE airlogs;
USE airlogs;

CREATE TABLE cities (
	label VARCHAR(100) PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);
INSERT INTO cities(label, name)
VALUE ('moscow','Москва'),('irkutsk','Иркутск'),
	  ('novgorod','Новгород'),('kazan','Казань'),
	  ('omsk','Омск'),('orsk','Орск');

CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(100) NOT NULL,
	`to` VARCHAR(100) NOT NULL
);

ALTER TABLE flights
ADD CONSTRAINT fk_from
FOREIGN KEY (`from`)
REFERENCES cities (label)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE flights
ADD CONSTRAINT fk_to
FOREIGN KEY (`to`)
REFERENCES cities (label)
ON DELETE CASCADE
ON UPDATE CASCADE;

INSERT INTO flights(`from`, `to`)
VALUE ('moscow','omsk'),('irkutsk','kazan'),
	  ('irkutsk','moscow'),('omsk','irkutsk'),
	  ('moscow','kazan'),('orsk','moscow');

SELECT C.name AS `from`, C1.name as `to`
FROM flights F
INNER JOIN cities C ON C.label = F.`from`
INNER JOIN cities C1 ON C1.label = F.`to`
ORDER BY F.id;