INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('1', 'Joshua', 'Kimmich', '123jk156@gmail.com', '89033602667');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('2', 'Leon', 'Goretzka', '123lg156@gmail.com', '89233719285');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('3', 'Serge', 'Gnabry', '123sg156@gmail.com', '89021984176');
INSERT INTO 'users' ('id', 'firtsname', 'lastname', 'email', 'phone') VALUES ('4', 'Leroy', ' Sane', '123ls156@gmail.com', '89022775317');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('5', 'Thomas', 'Müller', '123tm156@gmail.com', '89066187164');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('6', 'Benjamin', 'Pavard', '123bp156@gmail.com', '89033817562');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('7', 'Manuel', 'Neuer', '123mn156@gmail.com', '89066318275');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('8', 'Joao', 'Cancelo', '123jc156@gmail.com', '89022817562');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('9', 'Alphonso', 'Davies', '123ad156@gmail.com', '89057661238');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('10', 'Kim', 'Sane', '123ks156@gmail.com', '89066381726');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('11', 'Jamal', 'Musiala', '123jm156@gmail.com', '89033663182');
INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone') VALUES ('12', 'Kai', 'Havertz', '123kh156@gmail.com', '89033881726');


INSERT INTO 'users' ('id', 'firstname', 'lastname', 'email', 'phone')
VALUES ('1', 'Joshua', 'Kimmich', '123jk156@gmail.com', '89033602667'),
	   ('2', 'Leon', 'Goretzka', '123lg156@gmail.com', '89233719285'),
	   ('3', 'Serge', 'Gnabry', '123sg156@gmail.com', '89021984176'),
       ('4', 'Leroy', ' Sane', '123ls156@gmail.com', '89022775317'),
	   ('5', 'Thomas', 'Müller', '123tm156@gmail.com', '89066187164'),
	   ('6', 'Benjamin', 'Pavard', '123bp156@gmail.com', '89033817562'),
       ('7', 'Manuel', 'Neuer', '123mn156@gmail.com', '89066318275'),
       ('8', 'Joao', 'Cancelo', '123jc156@gmail.com', '89022817562'),
	   ('9', 'Alphonso', 'Davies', '123ad156@gmail.com', '89057661238'),
	   ('10', 'Kim', 'Sane', '123ks156@gmail.com', '89066381726'),
       ('11', 'Jamal', 'Musiala', '123jm156@gmail.com', '89033663182'),
	   ('12', 'Kai', 'Havertz', '123kh156@gmail.com', '89033881726'),
;

select distinct firstname
from users 
order by firstname;

ALTER TABLE vk.profiles
ADD COLUMN is_active BIT DEFAULT 1;

UPDATE profiles
SET is_active = 0
WHERE (birthday + INTERVAL 18 YEAR) > NOW();

select *
from profiles
where is_active = 0
order by birthday;

select *
from profiles 
where is_active = 1
order by birthday;

ALTER TABLE messages
ADD COLUMN is_deleted BIT DEFAULT 0;


update messages 
set created_at = now() + interval 1 year
limit 5;

update messages
set is_deleted = 1
where created_at > NOW();


delete from messages 
where created_at > NOW();

select *
from messages
order by created_at;

COMMENT = 'База данных фильмов и сериа'
