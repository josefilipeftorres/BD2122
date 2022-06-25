CREATE DATABASE IF NOT EXISTS ZEUS_GYM;

USE ZEUS_GYM;

DROP TABLE IF EXISTS CLIENTE, NUM_TELEF_CLIENTE, FUNCIONARIO, NUM_TELEF_FUNCIONARIO, ESPACO, FORNECEDOR, NUM_TELEF_FORNECEDOR, FORNECE, FREQUENTA;

CREATE TABLE CLIENTE
(
    Codigo        INT PRIMARY KEY,
    Nome          VARCHAR(128) NOT NULL,
    Plano         ENUM('Livre', 'Off Peak', 'Mini' , 'Shot') NOT NULL,
    DataNasc      Date NOT NULL,
    Email         VARCHAR(64) DEFAULT NULL,
    MRua          VARCHAR(64) NOT NULL,
    MNum          INT NOT NULL,
    MAndar        VARCHAR(64) DEFAULT NULL,
    MCodPostal    VARCHAR(64) NOT NULL,
    MLocalidade   VARCHAR(64) NOT NULL,
    Treinador     INT DEFAULT NULL,
    Nutricionista INT DEFAULT NULL

);

CREATE TABLE FUNCIONARIO
(
    CodigoFunc  INT PRIMARY KEY,
    Cargo       ENUM('T', 'R', 'N', 'L') NOT NULL,
    Nome        VARCHAR(128) NOT NULL,
    Salario     INT NOT NULL,
    DataNasc    DATE NOT NULL,
    Email       VARCHAR(64) NOT NULL,
    MRua        VARCHAR(64) NOT NULL,
    MNum        INT NOT NULL,
    MAndar      VARCHAR(64) DEFAULT NULL,
    MCodPostal  VARCHAR(64) NOT NULL,
    MLocalidade VARCHAR(64) NOT NULL,
    Espaco      INT  NOT NULL,
    HoraInic    TIME NOT NULL,
    HoraFim     TIME NOT NULL
);


CREATE TABLE ESPACO
(
    CodEspaco   INT PRIMARY KEY,
    Nome        VARCHAR(128) NOT NULL,
    MRua        VARCHAR(64) NOT NULL,
    MNum        INT NOT NULL,
    MAndar      VARCHAR(64) DEFAULT NULL,
    MCodPostal  VARCHAR(64) NOT NULL,
    MLocalidade VARCHAR(64) NOT NULL,
    Gestor      INT NOT NULL
);


CREATE TABLE FORNECEDOR
(
    Nome        VARCHAR(128) PRIMARY KEY,
    Email       VARCHAR(64) NOT NULL,
    Custo       INT NOT NULL,
    Proposito   VARCHAR(128) NOT NULL,
    MRua        VARCHAR(64) NOT NULL,
    MNum        INT NOT NULL,
    MAndar      VARCHAR(64) DEFAULT NULL,
    MCodPostal  VARCHAR(64) NOT NULL,
    MLocalidade VARCHAR(64) NOT NULL
);



CREATE TABLE FORNECE
(
    Fornecedor  VARCHAR(128) NOT NULL,
    Espaco      INT  NOT NULL,
    PRIMARY KEY(Fornecedor,Espaco),
    FOREIGN KEY(Fornecedor) REFERENCES FORNECEDOR(Nome),
    FOREIGN KEY(Espaco) REFERENCES ESPACO(CodEspaco)
);

CREATE TABLE FREQUENTA
(
    Cliente      VARCHAR(128) NOT NULL,
    Espaco       VARCHAR(128) NOT NULL,
    PRIMARY KEY(Cliente,Espaco) 
);

CREATE TABLE NUM_TELEF_CLIENTE
(
    Cliente      INT NOT NULL,   
    Num          INT NOT NULL,
    PRIMARY KEY(Cliente, Num),
    FOREIGN KEY(Cliente) REFERENCES CLIENTE(Codigo)          
);

CREATE TABLE NUM_TELEF_FUNCIONARIO
(  
    Funcionario  INT NOT NULL,
    Num          INT NOT NULL,
    PRIMARY KEY(Funcionario, Num),    
    FOREIGN KEY(Funcionario) REFERENCES FUNCIONARIO(CodigoFunc)                   
);

CREATE TABLE NUM_TELEF_FORNECEDOR
(
    Fornecedor   VARCHAR(128) NOT NULL,
    Num          INT NOT NULL,
    PRIMARY KEY(Fornecedor, Num),
    FOREIGN KEY(Fornecedor) REFERENCES FORNECEDOR(Nome)          
);

/*
    Inserir valores para CLIENTE
*/
INSERT INTO 
    CLIENTE(Codigo, Nome, Plano, DataNasc, Email, MRua, MNum, MAndar, MCodPostal, MLocalidade, Treinador, Nutricionista)
VALUES
    ('579437', 'Daniel Ribeiro Goncalves' , 'Livre'     , '1968-01-08',                  NULL              , 'Rua da Rotunda'           , '12' , '2', '4560-132', 'Campanha'       , '312636', '715835'),
    ('914714', 'José Silva Ribeiro'       , 'Off Peak'  , '1999-05-01', 'zezinhosilveiro23@hmail.com'      , 'Rua São José'             , '43' , '5', '4470-208', 'Cedofeita'      , '296113',  NULL   ),
    ('332080', 'Sofia Lima Rocha'         , 'Shot'      , '1954-01-21',                  NULL              , 'Rua dali debaixo'         , '576', '1', '4485-010', 'Nevogilde'      , '238139',  NULL   ),
    ('798819', 'Ana Nogueira Vila-Cha'    , 'Mini'      , '1986-03-11', 'ananogueira_villagetea@gmail.com' , 'Rua da Ponte'             , '76' , NULL,'4480-222', 'Nevogilde'      , '502638', '807132'),
    ('893649', 'Clara Dias Castro'        , 'Mini'      , '1974-06-18', 'claranoites@zzzmail.pt'           , 'Rua Antonio Costa'        , '78' , '1', '4485-941', 'Nevogilde'      ,  NULL   , '715835'),
    ('723550', 'Samuel Pinto Sousa'       , 'Off Peak'  , '1953-07-06', 'samuelpinto060753@jmail.com'      , 'Rua Fernando Santos'      , '767', NUll,'4485-916', 'Santo Ildefonso', '296113', '589453'),
    ('157180', 'Thiago Cunha Pereira'     , 'Livre'     , '1952-04-21',                  NULL              , 'Rua da Boavista'          , '98' , '7', '4430-281', 'Massarelos'     ,  NULL   ,  NULL   ),
    ('584312', 'Guilherme Pinto Cunha'    , 'Livre'     , '2004-03-28', 'guipintinho04@intlook.uk'         , 'Rua Goncalo Velho Cabral' , '54' , NULL,'4400-632', 'Bonfim'         , '238139', '589453'),
    ('307776', 'Tiago Joãozinho Saramago' , 'Livre'     , '1990-12-19', 'tiagovski@paysafe.com'            , 'Rua do Roubo'             , '21' , NULL,'4415-918', 'Santo Ildefonso', '675559', '715835'),
    ('277071', 'Mariza Ribeiro Araujo'    , 'Off Peak'  , '2002-10-07', 'marizanotfadista@gemail.pt'       , 'Rua Santo Antonio'        , '19' , '3', '4415-073', 'Massarelos'     , '675559',  NULL   );

/*
    Inserir valores para FUNCIONARIO
*/
INSERT INTO 
    FUNCIONARIO(CodigoFunc, Cargo, Nome, Salario, DataNasc, Email, MRua, MNum, MAndar, MCodPostal, MLocalidade, Espaco, HoraInic, HoraFim)
VALUES
    ('312636', 'T', 'Mateus Gomes Castro'        , '1086' , '1997-05-21', 'mateusgcast@zmail.com'       , 'Rua da Torre Velha'  , '114', '4', '4560-132', 'Campanha'        , '2', '9:00:00' , '17:00:00'),
    ('425226', 'R', 'Julia Pereira Gomes'        , '763'  , '1997-02-01', 'juliapergomes@hmail.com'     , 'Rua São Tome'        , '239', '3', '4470-298', 'Cedofeita'       , '1', '9:00:00' , '18:00:00'),
    ('807132', 'N', 'Yasmin Barros Melo'         , '862'  , '1991-01-22', 'yasminnutricionista@mail.co' , 'Rua da Nossa Senhora', '423', NULL,'4485-213', 'Nevogilde'       , '1', '9:00:00' , '12:00:00'),
    ('502638', 'T', 'Matilde Silva Barros'       , '1086' , '1998-05-19', 'matildecoach@gmail.com'      , 'Rua do Campo Alegre' , '389', '1', '4150-172', 'Campo Alegre'    , '1', '9:00:00' , '17:00:00'),
    ('589453', 'N', 'Maria Gomes Carvalho'       , '862'  , '1994-12-29', 'mariahealthyfood@zzzmail.pt' , 'Rua dos Clerigos'    , '124', NULL,'4050-205', 'Santo Ildefonso' , '2', '9:00:00' , '12:00:00'),
    ('940026', 'L', 'Jose Filipe Torres'         , '665'  , '1991-11-10', 'zetudolimpo@jmail.com'       , 'Rua da Campanha'     , '14' , NULL,'4300-135', 'Campanha'        , '1', '14:30:00', '22:30:00'),
    ('925472', 'L', 'Eduardo Correia Cavalcanti' , '665'  , '1986-07-05', 'educavalcanti@umail.io'      , 'Rua da Boavista'     , '88' , '6', '4050-112', 'Massarelos'      , '3', '14:30:00', '22:30:00'),
    ('406990', 'N', 'Miguel Bruno Gomes'         , '862'  , '1991-02-28', 'mbgomesnutri@intlook.uk'     , 'Rua D. Dinis'        , '12' , NULL,'4213-870', 'Bonfim'          , '3', '9:00:00' , '12:00:00'),
    ('990203', 'R', 'Luis Pereira Sousa'         , '763'  , '1991-08-06', 'luisousa@tmail.com'          , 'Rua Sa da Bandeira'  , '34' , '3', '4000-435', 'Santo Ildefonso' , '2', '9:00:00' , '18:00:00'),
    ('238139', 'T', 'Beatriz Araujo Fernandes'   , '1086' , '1984-05-09', 'beastrongp@gemail.pt'        , 'Rua da Pedra'        , '66' , '2', '4743-423', 'Bonfim'          , '3', '17:00:00', '22:00:00'),
    ('675559', 'T', 'Leonardo Gomes Azevedo'     , '1086' , '1998-09-11', 'leomakebodies@gemail.pt'     , 'Rua Santo Antonio'   , '90' , NULL,'4550-692', 'Campanha'        , '2', '17:00:00', '22:00:00'),
    ('296113', 'T', 'Igor Martins Araujo'        , '1086' , '1990-04-11', 'igorcoachdeles@gemail.pt'    , 'Rua São Luis'        , '54' , '5', '4562-243', 'Santo Ildefonso' , '3', '9:00:00' , '17:00:00'),
    ('715835', 'N', 'Mariana Fernandes Melo'     , '862'  , '1996-12-16', 'marianasaudavel@gemail.pt'   , 'Rua Santa Maria'     , '73' , NULL,'4465-345', 'Massarelos'      , '3', '9:00:00' , '12:00:00');


/*
    Inserir valores para ESPACO
*/
INSERT INTO 
    ESPACO(CodEspaco, Nome, MRua, MNum, MAndar, MCodPostal, MLocalidade, Gestor)
VALUES
    ('1', 'ZEUS Ildefonso'  , 'Rua de Santo Ildefonso', '242' , '1', '4049-020', 'Santo Ildefonso'  , '502638'),
    ('2', 'ZEUS Massarelos' , 'Avenida da Boavista'   , '577' , NULL,'4100-127', 'Massarelos'       , '312636'),
    ('3', 'ZEUS Gaia'       , 'Rua Diogo Couto'       , '888' , '2', '4523-878', 'Vila Nova de Gaia', '238139');

/*
    Inserir valores para FORNECEDOR
*/
INSERT INTO 
    FORNECEDOR(Nome, Email, Custo, Proposito, MRua, MNum, MAndar, MCodPostal, MLocalidade)
VALUES
    ('Fanaticos do Ferro', 'fanaticos_doferro@zzmail.com', '1799' , 'Aparelhos de musculacao'     , 'Rua da Vila baixa', '792', '1', '4561-789', 'Vila Nova de Gaia'),
    ('BurnItFast'        , 'cardiogymsupply@jmail.com'   , '1299' , 'Aparelhos de cardio'         , 'Rua do Fim'       , '982',NULL, '4123-998', 'Matosinhos'),
    ('4YourBody'         , '4urbodysupply@jmail.com'     , '1999' , 'Suplementos e Snacks'        , 'Rua da Bela Vista', '321',NULL, '4989-321', 'Santa Maria da Feira'),
    ('Iron Man'          , 'ironmangym@jmail.com'        , '1899' , 'Aparelhos de luta e pesos'   , 'Rua Largo do Leao', '123', '3', '4782-675', 'Campanha');

/*
    Inserir valores para FORNECE
*/
INSERT INTO
    FORNECE(Fornecedor, Espaco)
VALUES
    ('Fanaticos do Ferro', '2'),
    ('Fanaticos do Ferro', '3'),
    ('BurnItFast'        , '2'),
    ('4YourBody'         , '1'),
    ('4YourBody'         , '3'),
    ('Iron Man'          , '1');

/*
    Inserir nºs de telef dos clientes
*/
INSERT INTO
    NUM_TELEF_CLIENTE(Cliente, Num)
VALUES
    ('579437', '937485927'),
    ('914714', '984728542'),
    ('332080', '928342322'),
    ('798819', '970850204'),
    ('893649', '996279693'),
    ('723550', '912977938'),
    ('157180', '921086960'),
    ('584312', '953542388'),
    ('307776', '980829375'),
    ('277071', '917617969');

/*
    Inserir nºs de telef dos funcionarios
*/
INSERT INTO
    NUM_TELEF_FUNCIONARIO(Funcionario, Num)
VALUES
    ('312636', '904492173'),
    ('425226', '931078224'),
    ('807132', '914102308'),
    ('502638', '947017134'),
    ('589453', '920162587'),
    ('940026', '967613278'),
    ('925472', '962266060'),
    ('406990', '928675301'),
    ('990203', '958162310'),
    ('238139', '933876306'),
    ('675559', '995779826'),
    ('296113', '992049780'),
    ('715835', '966168877');

/*
    Inserir nºs de telef dos fornecedores
*/
INSERT INTO
    NUM_TELEF_FORNECEDOR(FORNECEDOR, Num)
VALUES
    ('Fanaticos do Ferro', '981821707'),
    ('Fanaticos do Ferro', '985720415'),
    ('BurnItFast'        , '912700023'),
    ('4YourBody'         , '995014071'),
    ('Iron Man'          , '911725328'),
    ('4YourBody'         , '984192231');

INSERT INTO 
    FREQUENTA(Cliente, Espaco)
VALUES
    ('579437', '1'),
    ('914714', '1'),
    ('332080', '2'),
    ('798819', '3'),
    ('893649', '1'),
    ('723550', '3'),
    ('157180', '3'),
    ('584312', '2'),
    ('307776', '2'),
    ('277071', '1'),
    ('579437', '3'),
    ('277071', '2');


ALTER TABLE CLIENTE ADD FOREIGN KEY(Treinador) REFERENCES FUNCIONARIO(CodigoFunc);
ALTER TABLE CLIENTE ADD FOREIGN KEY(Nutricionista) REFERENCES FUNCIONARIO(CodigoFunc);	
ALTER TABLE FUNCIONARIO ADD FOREIGN KEY(Espaco) REFERENCES ESPACO(CodEspaco);
ALTER TABLE ESPACO ADD FOREIGN KEY(Gestor) REFERENCES FUNCIONARIO(CodigoFunc);
