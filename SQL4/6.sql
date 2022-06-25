-- 6.1
SELECT Login, Name FROM USER ORDER BY Login;

-- 6.2
SELECT Login, Name, BirthDate FROM USER ORDER BY BirthDate DESC, Login ASC;

-- 6.3
SELECT Login, Name, BirthDate FROM USER 
WHERE Sex = 'M'
ORDER BY BirthDate DESC, Login ASC;

-- 6.4
SELECT Login, Name, BirthDate FROM USER 
ORDER BY BirthDate DESC, Login ASC
LIMIT 3;

-- 6.5
SELECT Num, Author, Content FROM POST 
ORDER BY Creation DESC 
LIMIT 5;

-- 6.6
SELECT Post, Tag FROM HASHTAG ORDER BY Post, Tag;

-- 6.7
SELECT DISTINCT Tag FROM HASHTAG ORDER BY Tag;

-- 6.8
SELECT DISTINCT Post FROM COMMENT ORDER BY Post DESC;

-- 6.9
SELECT Login, Name FROM USER 
WHERE Name LIKE '%y%' AND Sex = 'F'
ORDER BY Login;

-- 6.10
SELECT Num, Creation, Content FROM POST
WHERE HOUR(Creation) >= '05:00' AND HOUR(Creation) <= '18:00'
ORDER BY Creation DESC;

-- 6.11
SELECT Login, BirthDate FROM USER
ORDER BY BirthDate
LIMIT 3;

-- 6.12
SELECT Login, Joined, TIMESTAMPDIFF(DAY, Joined, '2020-01-10') AS Days
FROM USER
ORDER BY Days;

-- 6.13
SELECT Login, BirthDate, TIMESTAMPDIFF(YEAR, BirthDate, '2020-01-10') AS Age
FROM USER
ORDER BY Age
LIMIT 4;


