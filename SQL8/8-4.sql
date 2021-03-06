DROP FUNCTION IF EXISTS getDepartment;
DELIMITER $

CREATE FUNCTION getDepartment(staff_id INT)
RETURNS INT
BEGIN
    DECLARE dep_id INT;
    SET dep_id = NULL;

    SELECT DepId INTO dep_id
    FROM STAFF
    JOIN DEPARTMENT ON(STAFF.StaffId = DEPARTMENT.Manager
                       OR Supervisor = Manager) 
    WHERE StaffId = staff_id;
    RETURN dep_id;
END $

DELIMITER ;