DELETE FROM MOVIE_ACTOR
WHERE
    MovieId IN (SELECT MovieId FROM MOVIE_GENRE 
                JOIN GENRE USING (GenreId)
                WHERE Label = 'Action')
    AND
    MovieId NOT IN (SELECT MovieId FROM STREAM);