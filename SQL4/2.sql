--2.1
SELECT * FROM USER WHERE Sex = 'F';

--2.2
SELECT Login, Name FROM USER WHERE Sex = 'F';

--2.3
SELECT Login FROM USER WHERE Phone IS NULL;

--2.4
SELECT Login, Phone FROM USER WHERE Phone IS NOT NULL;

--2.5
SELECT Login, BirthDate FROM USER WHERE YEAR(BirthDate) < 2000;

--2.6
SELECT Login, BirthDate FROM USER 
WHERE YEAR(BirthDate) < 2000 AND Sex = 'F';

--2.7
SELECT Login, YEAR(BirthDate) FROM USER
WHERE YEAR(BirthDate) >= 2000;

--2.8
SELECT Num, Author, Content FROM POST
WHERE Content LIKE '%...%';

--2.9
SELECT Follower FROM FOLLOWER WHERE User = 7;

--2.10
SELECT Author, Content FROM COMMENT WHERE Post = 8;