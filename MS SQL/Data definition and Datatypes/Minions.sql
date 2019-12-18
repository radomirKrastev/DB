CREATE TABLE Minions (
Id INT PRIMARY KEY,
[Name] NVARCHAR,
Age INT
)

CREATE TABLE Towns (
Id INT PRIMARY KEY,
[Name] NVARCHAR
)

ALTER TABLE Minions
ADD TownId INT FOREIGN KEY REFERENCES Towns(Id);

ALTER TABLE Minions
ALTER COLUMN [Name] NVARCHAR(30)

ALTER TABLE Towns
ALTER COLUMN [Name] NVARCHAR(30)

INSERT INTO Towns(Id, [Name]) VALUES
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna')

INSERT INTO MINIONS(Id, [Name], Age, TownId) VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2)

SELECT * FROM Minions

TRUNCATE TABLE Minions

DROP TABLE Minions

DROP TABLE TOWNS