SELECT DISTINCT Name
FROM CUSTOMER
    JOIN STREAM USING (CustomerId)
    JOIN MOVIE USING (MovieId)
WHERE
    TIME(StreamDate) >= '20:00' AND Duration >= 180
ORDER BY Name;