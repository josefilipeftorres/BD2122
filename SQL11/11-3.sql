SELECT Title
FROM MOVIE
WHERE 
    MovieId IN (SELECT MovieId FROM MOVIE_GENRE 
                            JOIN GENRE USING (GenreId)
                            WHERE Label = 'Action')
    AND
    MovieId IN (SELECT MovieId FROM MOVIE_GENRE 
                            JOIN GENRE USING (GenreId)
                            WHERE Label = 'Comedy')
ORDER BY Title;