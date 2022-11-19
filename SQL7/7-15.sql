DELETE FROM STREAM
WHERE
    CustomerId IN (
        SELECT CustomerId FROM CUSTOMER
        JOIN COUNTRY ON (CUSTOMER.Country = COUNTRY.Name)
        JOIN REGION USING (RegionId)
        WHERE REGION.Name <> 'America'
    )
    AND
    MovieId IN (
        SELECT MovieId FROM MOVIE
        NATURAL JOIN MOVIE_GENRE
        JOIN GENRE USING (GenreId)
        WHERE Duration <= 120 AND Label = 'Biography'
    );