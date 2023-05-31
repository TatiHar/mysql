-- 1
START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users u WHERE id=1;
DELETE  FROM shop.users WHERE id=1;
COMMIT;

SELECT * FROM sample.users u WHERE id=1;
SELECT * FROM shop.users u WHERE id=1;

-- 2
DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
			SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
			SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
			SELECT 'Добрый вечер';
		ELSE
			SELECT 'Доброй ночи';
	END CASE;
END //
delimiter ;

CALL hello();