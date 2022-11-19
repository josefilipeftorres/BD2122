/*SELECT Title, A2.Name
FROM
    MOVIE,
        (ACTOR A1 NATURAL JOIN MOVIE_ACTOR MA1),
        (ACTOR A2 NATURAL JOIN MOVIE_ACTOR MA2),
        MOVIE
        WHERE A1.Name = 'Johnny Depp'
        AND A2.Name <> 'Johnny Depp'
        AND MA1.MovieId = MA2.MovieId
        AND MOVIE.MovieId = MA1.MovieId
        ORDER BY Title, A2.Name;
*/
SELECT Title, A2.Name
FROM
    (ACTOR A1 NATURAL JOIN MOVIE_ACTOR MA1) JOIN
    (ACTOR A2 NATURAL JOIN MOVIE_ACTOR MA2) USING (MovieId)
    NATURAL JOIN MOVIE
    WHERE A1.Name = 'Johnny Depp'
    AND A2.Name <> 'Johnny Depp'
    ORDER BY Title, A2.Name;