SELECT MOVIE.Title
FROM MOVIE NATURAL JOIN MOVIE_ACTOR
           NATURAL JOIN ACTOR
           NATURAL JOIN MOVIE_GENRE
           NATURAL JOIN GENRE
    WHERE ACTOR.Name = 'Tom Cruise' AND GENRE.Label = 'Action';

DELETE FROM MOVIE_ACTOR
WHERE
    ActorId = (SELECT ActorId FROM ACTOR WHERE Name = 'Tom Cruise')
    AND
    MovieId IN (SELECT MovieId FROM MOVIE_GENRE NATURAL JOIN GENRE 
                                    WHERE Label = 'Action');