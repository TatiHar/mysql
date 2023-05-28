USE vk;
-- №1

SELECT count(*) mess, friend FROM 
	(SELECT body, to_user_id AS friend FROM messages WHERE from_user_id = 1
	 UNION
	 SELECT body,from_user_id AS friend FROM messages WHERE to_user_id = 1) as history
GROUP BY friend
ORDER BY mess DESC
LIMIT 1;

-- №2

SELECT COUNT(id) FROM likes 
	WHERE user_id = 
		(SELECT user_id FROM profiles WHERE YEAR(birthday) > 2011 AND user_id = likes.user_id);


-- №3

SELECT IF(
	(SELECT COUNT(id) FROM LIKES WHERE user_id IN (
		SELECT user_id FROM profiles WHERE gender="m")
	) 
	> 
	(SELECT COUNT(id) FROM LIKES WHERE user_id IN (
		SELECT user_id FROM profiles WHERE gender="f")
	), 
   'male', 'female');