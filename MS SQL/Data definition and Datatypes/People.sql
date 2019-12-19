CREATE TABLE PEOPLE(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX),
Height DECIMAL (3, 2),
[Weight] DECIMAL (3, 2),
Gender Char(1) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR
) 

ALTER TABLE PEOPLE ADD CONSTRAINT CHK_PEOPLE_Picture__2MB CHECK (DATALENGTH(Picture) <= 2097152);

ALTER TABLE PEOPLE
ALTER COLUMN [Weight] DECIMAL(5, 2)

ALTER TABLE PEOPLE
ALTER COLUMN Biography NVARCHAR(MAX)

INSERT INTO PEOPLE VALUES
('Maikal', NULL, 1.85, 112.47, 'M', '1989-12-23', 'BIO'),
('Firmino', NULL, 1.61, 64.6, 'M', '1956-11-23', NULL),
('Novakov', NULL, 1.99, 98.78, 'M', '1939-9-15', 'SOME BIO'),
('HIKIMQN', NULL, 1.53, 57, 'M', '1829-11-7', 'BIOGRAPHY'),
('Anton', NULL, 1.87, 88.45, 'M', '1829-11-19', NULL);