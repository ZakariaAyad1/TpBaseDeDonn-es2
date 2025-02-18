1

create table classe (
    nomc varchar(10) primary key
);

create table eleve (
    nume int primary key,
    nome varchar(50),
    nomc varchar(10),
    foreign key (nomc) references classe(nomc)
);

create table professeur (
    nump varchar(10) primary key,
    nomp varchar(50)
);

create table service (
    nump varchar(10),
    nomc varchar(10),
    nbh int,
    primary key (nump, nomc),
    foreign key (nump) references professeur(nump),
    foreign key (nomc) references classe(nomc)
);







2

INSERT INTO CLASSE VALUES ('CM1');
INSERT INTO CLASSE VALUES ('CM2');
INSERT INTO CLASSE VALUES ('CE1');
INSERT INTO CLASSE VALUES ('CE2');


INSERT INTO ELEVE VALUES (10, 'FRICOTIN', 'CM1');
INSERT INTO ELEVE VALUES (11, 'FILOCHARD', 'CM2');
INSERT INTO ELEVE VALUES (12, 'CROQUIGNOL', 'CE1');
INSERT INTO ELEVE VALUES (13, 'RIBOUDINGUE', 'CE2');
INSERT INTO ELEVE VALUES (14, 'TARZAN', 'CM1');
INSERT INTO ELEVE VALUES (15, 'TINTIN', 'CM2');
INSERT INTO ELEVE VALUES (16, 'MILOU', 'CE1');
INSERT INTO ELEVE VALUES (17, 'SPIROU', 'CE1');
INSERT INTO ELEVE VALUES (18, 'FANTASIO', 'CM1');
INSERT INTO ELEVE VALUES (19, 'MICKEY', 'CM2');
INSERT INTO ELEVE VALUES (20, 'DONALD', 'CE1');
INSERT INTO ELEVE VALUES (21, 'BOULE', 'CE2');
INSERT INTO ELEVE VALUES (23, 'BILL', 'CM1');

INSERT INTO PROFESSEUR VALUES ('P1', 'DUPONT');
INSERT INTO PROFESSEUR VALUES ('P2', 'DUBOIS');
INSERT INTO PROFESSEUR VALUES ('P3', 'DUGENOU');
INSERT INTO PROFESSEUR VALUES ('P4', 'DURACUIRE');
INSERT INTO PROFESSEUR VALUES ('P5', 'DUBALAI');
INSERT INTO PROFESSEUR VALUES ('P6', 'DUVAL');


INSERT INTO SERVICE VALUES ('P1', 'CM1', 12);
INSERT INTO SERVICE VALUES ('P1', 'CM2', 25);
INSERT INTO SERVICE VALUES ('P2', 'CE1', 18);
INSERT INTO SERVICE VALUES ('P3', 'CE2', 30);
INSERT INTO SERVICE VALUES ('P3', 'CM2', 28);
INSERT INTO SERVICE VALUES ('P4', 'CE1', 15);
INSERT INTO SERVICE VALUES ('P4', 'CE2', 30);
INSERT INTO SERVICE VALUES ('P5', 'CE1', 32);
INSERT INTO SERVICE VALUES ('P5', 'CM1', 18);
INSERT INTO SERVICE VALUES ('P6', 'CM1', 25);
INSERT INTO SERVICE VALUES ('P6', 'CE2', 28);











3

SELECT * FROM ELEVE WHERE nomC = 'CM1';





4

SELECT DISTINCT E.*
FROM ELEVE E
JOIN SERVICE S ON E.nomC = S.nomC
JOIN PROFESSEUR P ON S.numP = P.numP
WHERE P.nomP = 'DUBALAI';






5

SELECT SUM(nbh) AS total_heures
FROM SERVICE S
JOIN PROFESSEUR P ON S.numP = P.numP
WHERE P.nomP = 'DUBALAI';





6

SELECT SUM(nbh) AS total_heures FROM SERVICE;







7

SELECT AVG(nbh) AS moyenne_heures FROM SERVICE;






8

SELECT P.nomP, S.nomC, S.nbh
FROM SERVICE S
JOIN PROFESSEUR P ON S.numP = P.numP
WHERE ROWNUM = 1
ORDER BY S.nbh DESC;







9

SELECT sub.nomP, sub.nomC, sub.NBH
FROM (
    SELECT P.nomP, S.nomC, S.NBH
    FROM SERVICE S
    JOIN PROFESSEUR P ON S.numP = P.numP
    ORDER BY S.NBH DESC
) sub
WHERE ROWNUM = 1;








10

SELECT nomP, total_heures 
FROM (
    SELECT P.nomP, SUM(S.nbh) AS total_heures
    FROM SERVICE S
    JOIN PROFESSEUR P ON S.numP = P.numP
    GROUP BY P.nomP
    ORDER BY total_heures DESC
) 
WHERE ROWNUM = 1;






11

SELECT nomP, total_heures 
FROM (
    SELECT P.nomP, SUM(S.nbh) AS total_heures
    FROM SERVICE S
    JOIN PROFESSEUR P ON S.numP = P.numP
    GROUP BY P.nomP
    ORDER BY total_heures ASC
) 
WHERE ROWNUM = 1;










12

ALTER TABLE PROFESSEUR ADD Age INT;

UPDATE PROFESSEUR 
SET Age = CASE 
    WHEN numP = 'P1' THEN 34
    WHEN numP = 'P2' THEN 52
    WHEN numP = 'P3' THEN 59
    WHEN numP = 'P4' THEN 42
    WHEN numP = 'P5' THEN 29
    WHEN numP = 'P6' THEN 62
END;






13

SELECT S.NOMC
FROM SERVICE S
JOIN PROFESSEUR P ON P.NUMP = S.NUMP
WHERE P.AGE > 60
GROUP BY S.NOMC;



Voici une autre manière de faire la même chose :



SELECT NOMC
FROM (
    SELECT S.NOMC, P.AGE
    FROM SERVICE S
    JOIN PROFESSEUR P ON P.NUMP = S.NUMP
) 
WHERE AGE > 60
GROUP BY NOMC;




