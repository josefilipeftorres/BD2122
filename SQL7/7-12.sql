UPDATE STREAM
SET Charge = 4.5
WHERE 
    CustomerId IN (
        SELECT CustomerId FROM CUSTOMER
        JOIN COUNTRY ON (CUSTOMER.Country = COUNTRY.Name)
        JOIN REGION USING(RegionId)
        WHERE REGION.Name <> 'Africa')
    AND
    MovieId IN (
        SELECT MovieId FROM MOVIE
        NATURAL JOIN MOVIE_GENRE
        NATURAL JOIN GENRE
        WHERE Label = 'Sci-Fi' AND Year < 1985
    );