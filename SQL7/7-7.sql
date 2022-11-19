UPDATE CUSTOMER
SET Active = FALSE
WHERE
    CustomerId IN (SELECT * FROM (
        SELECT CUSTOMER.CustomerId FROM CUSTOMER
        LEFT JOIN STREAM ON (CUSTOMER.CustomerId = STREAM.CustomerId)
        WHERE Country = 'China' AND StreamId IS NULL) T);
