USE vk;

SELECT 
u.id,
u.firstname,
u.lastname,
m.to_user_id ,
COUNT(*) AS total_messages
FROM users u  
JOIN friend_requests fr ON (u.id = fr.initiator_user_id OR u.id = fr.target_user_id) 
JOIN messages m ON u.id = m.from_user_id
WHERE u.id = 1 AND status = 'approved'
GROUP BY u.id 
ORDER BY total_messages;

SELECT 
COUNT(*) AS likes
FROM likes l  
JOIN profiles p ON l.user_id = p.user_id AND timestampdiff(YEAR, p.birthday, now())<12
ORDER BY likes;

SELECT 
p.gender,
COUNT(*) AS likes
FROM likes l  
JOIN profiles p ON l.user_id = p.user_id
GROUP BY p.gender;
