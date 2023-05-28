-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»
-- 1. 
UPDATE users SET created_at = NOW();
UPDATE users SET updated_at = NOW();
-- 2. 
ALTER TABLE users ADD created_at_dt DATETIME, updated_at_dt DATETIME;
UPDATE users
SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
    updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;
-- 3. 
SELECT * FROM storehouses_products
  ORDER BY CASE WHEN value = 0 then 1 else 0 end, value;

-- Практическое задание теме «Агрегация данных» 
-- 1. 
SELECT
AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM
  users;
-- 2. 
SELECT
	DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
	COUNT(*) AS total
FROM
	users
GROUP BY
	day
ORDER BY
	total DESC;