SELECT DISTINCT STREAM.StreamDate, MOVIE.Title, CUSTOMER.Name, CUSTOMER.Country
FROM 
    (STREAM JOIN CUSTOMER USING (CustomerId))
    JOIN MOVIE USING(MovieId)
    NATURAL JOIN MOVIE_ACTOR JOIN ACTOR USING (ActorId)
WHERE
    MovieId IN (SELECT MovieId FROM MOVIE_ACTOR JOIN ACTOR USING (ActorId)
                WHERE ACTOR.Name = 'Johnny Depp')
    AND
    MovieId NOT IN (SELECT MovieId FROM MOVIE_ACTOR JOIN ACTOR USING (ActorId)
                    WHERE ACTOR.Name = 'Helena Bonham Carter')
    AND
    CUSTOMER.Country <> 'China'
ORDER BY STREAM.StreamDate DESC
LIMIT 15;
