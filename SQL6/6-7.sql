SELECT DepId, DEPARTMENT.Name, Manager, STAFF.Name
FROM DEPARTMENT JOIN STAFF ON (Manager = StaffId);