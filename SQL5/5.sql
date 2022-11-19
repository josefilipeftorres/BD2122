-- 5.1
SELECT COUNT(*) FROM POST;

-- 5.2
SELECT COUNT(DISTINCT(Author)) FROM POST;

-- 5.3
SELECT COUNT(*), SUM(LENGTH(Content)) FROM POST 
WHERE Content LIKE '%batman%' OR Content LIKE '%joker%';

-- 5.4
SELECT MIN(Joined), MAX(Joined) FROM USER
WHERE Sex = 'M';

-- 5.5
SELECT MIN(TIMESTAMPDIFF(YEAR, BirthDate, '2021-03-17')) AS Min,
       MAX(TIMESTAMPDIFF(YEAR, BirthDate, '2021-03-17')) AS Max,
       AVG(TIMESTAMPDIFF(YEAR, BirthDate, '2021-03-17')) AS Media,
       (MAX(TIMESTAMPDIFF(YEAR, BirthDate, '2021-03-17')) - MIN(TIMESTAMPDIFF(YEAR, BirthDate, '2021-03-17'))) AS Diff
       FROM USER;