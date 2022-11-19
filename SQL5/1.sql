DROP TABLE IF EXISTS USER_GROUP;

CREATE TABLE IF NOT EXISTS USER_GROUP
(
   Num INT PRIMARY KEY AUTO_INCREMENT ,
   Creation DATETIME NOT NULL DEFAULT NOW(),
   Name VARCHAR(64) UNIQUE NOT NULL ,
   Description TEXT DEFAULT NULL
);

INSERT INTO USER_GROUP(Creation, Name,Description)
VALUES
('2020-01-01 12:15:23', 'Azul e branco', 'Adeptos do FCP - moderado por João Pinto'),
('2020-02-20 14:30:00', 'Superheroes', 'Here you will find Batman, Catwoman, ...'),
('2020-02-21 23:59:59', 'Lost Souls',  NULL);