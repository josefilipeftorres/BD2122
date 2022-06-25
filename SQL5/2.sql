DROP TABLE IF EXISTS GROUP_MEMBER;

CREATE TABLE IF NOT EXISTS GROUP_MEMBER
(
    UNum INT NOT NULL,
    GNum INT NOT NULL,
    Role ENUM('Admin','Moderator','Member') NOT NULL,
    PRIMARY KEY(UNum,GNum),
    FOREIGN KEY(UNum) REFERENCES USER(Num),
    FOREIGN KEY(GNum) REFERENCES USER_GROUP(Num)
);

SELECT Num INTO @u1 FROM USER WHERE Login='joao.pinto';
SELECT Num INTO @u2 FROM USER WHERE Login='semedo';
SELECT Num INTO @u3 FROM USER WHERE Login='catwoman';
SELECT Num INTO @u4 FROM USER WHERE Login='batman';
SELECT Num INTO @u5 FROM USER WHERE Login='ziggy';
SELECT Num INTO @u6 FROM USER WHERE Login='lady.z';
SELECT Num INTO @group FROM USER_GROUP WHERE Name='Azul e Branco';
SELECT Num INTO @group2 FROM USER_GROUP WHERE Name='Superheroes';
SELECT Num INTO @group3 FROM USER_GROUP WHERE Name='Lost Souls';
SELECT @u1, @u2, @u3, @group, @group2, @group3;

INSERT INTO GROUP_MEMBER(UNum,GNum,Role)
VALUES 
(@u1, @group, 'Admin'), 
(@u2, @group, 'Moderator'), 
(@u3, @group, 'Member'),
(@u3, @group2, 'Admin'),
(@u4, @group2, 'Admin'),
(@u5, @group2, 'Admin'),
(@u6, @group3, 'Member');

-- ALTER TABLE POST
-- ADD COLUMN GNum INT DEFAULT NULL;

-- ALTER TABLE GROUP_MEMBER
-- ADD FOREIGN KEY(GNum) REFERENCES USER_GROUP(Num);