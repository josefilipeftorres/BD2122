--3.1
INSERT INTO USER 
(Login, Joined, Name, BirthDate, Sex, Phone, Email)
VALUES
('master.of.sql','2020-03-01','Susan Doe','2000-01-23','F',NULL,'master.of.sql@nosql.com');

--3.2.1
INSERT INTO POST_LIKED
(User,Post)
VALUES (12,1);

--3.2.2
INSERT INTO FOLLOWER
(User,Follower)
VALUES (12,1),(12,2);

--3.2.3
INSERT INTO COMMENT
(Post,Author,Creation,Content)
VALUES
(1, 12, NOW(), 'LOL');

--3.2.4
INSERT INTO POST
(Author,Creation,Content)
VALUES
(12, NOW(), 'I love SQL');

--3.2.5
INSERT INTO HASHTAG
(Post, Tag)
VALUES
(13, 'sql'),
(13, 'db');