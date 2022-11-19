SELECT Name, COUNT(*) AS N
FROM ACTOR 
    NATURAL JOIN MOVIE_ACTOR
    NATURAL JOIN MOVIE
GROUP BY Name
HAVING N >= 15
ORDER BY N DESC, Name;