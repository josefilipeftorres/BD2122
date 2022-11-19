-- USE guest;
DROP TABLE IF EXISTS ACCOUNT;

CREATE TABLE ACCOUNT 
(
  AccountId INT PRIMARY KEY,
  Value INT 
);

INSERT INTO ACCOUNT(AccountId, Value)
VALUES (1, 100), 
       (2, 200), 
       (3, 300), 
       (4, 400), 
       (5, 500);

DROP PROCEDURE IF EXISTS transfer;

DELIMITER $
CREATE PROCEDURE transfer(IN id1 INT, IN id2 INT, IN amount INT, OUT done BOOLEAN) 
BEGIN
  DECLARE i1 INT;
  DECLARE i2 INT;
  DECLARE v1 INT;
  DECLARE v2 INT;

  START TRANSACTION;

  UPDATE ACCOUNT 
  SET Value = Value - amount 
  WHERE AccountId = id1; 

  UPDATE ACCOUNT 
  SET Value = Value + amount 
  WHERE AccountId = id2;

  SELECT AccountId, Value INTO i1, v1 FROM ACCOUNT
  WHERE AccountId = id1;

  SELECT AccountId, Value INTO i2, v2 FROM ACCOUNT
  WHERE AccountId = id2;

  IF i1 IS NULL OR i2 IS NULL OR v1 < amount OR id1 = id2 THEN
    SET DONE = FALSE;
    ROLLBACK;
  ELSE
    SET DONE = TRUE;
    COMMIT;
  END IF;
END $

DELIMITER ;

