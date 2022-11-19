DROP VIEW REGION_DATA;

CREATE VIEW REGION_DATA
(Name, Manager, Countries, Customers)
AS(
    SELECT REGION.Name, STAFF.Name, COUNT(DISTINCT(COUNTRY.Name)), COUNT(CustomerId)
    FROM REGION JOIN STAFF ON (RegionManager = StaffId)
         JOIN COUNTRY USING (RegionId)
         JOIN CUSTOMER ON (Country = COUNTRY.Name)
    GROUP BY REGION.Name, RegionManager
);