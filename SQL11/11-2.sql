SELECT Title, StreamDate, Charge
FROM STREAM JOIN MOVIE USING (MovieId)
     NATURAL JOIN MOVIE_GENRE
     JOIN GENRE USING (GenreId)
WHERE Label = 'Thriller' AND MONTH(StreamDate) = '12' AND YEAR(StreamDate) = '2017'
ORDER BY Title, StreamDate DESC;