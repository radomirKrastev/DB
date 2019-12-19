CREATE TABLE Users(
Id BIGINT PRIMARY KEY IDENTITY,
Username VARCHAR(30) NOT NULL,
[Password] VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(MAX),
LastLoginTime DATETIME,
IsDeleted VARCHAR(5)
)

ALTER TABLE Users
ADD CONSTRAINT CHK_Users_ProfilePicture__900KB CHECK (DATALENGTH(ProfilePicture) <= 921600);

ALTER TABLE Users
ADD CONSTRAINT UC_Users_Username UNIQUE (Username)

ALTER TABLE Users
ALTER COLUMN IsDeleted BIT


INSERT INTO Users VALUES
('UserOne', 'abracadabraasdt31', NULL, '2012-04-06T12:23:45', 0),
('UserTwo', 'abracadabra5', NULL, '2012-11-26T15:30:11', 1),
('UserThree', 'abracadabra3', NULL, '2015-09-17T15:32:54', 1),
('UserFour', 'abracadabra2', NULL, '2014-12-30T12:27:59', 0),
('UserFive', 'abracadabra1', NULL, '1998-01-26T15:30:11', 1)

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC073C254AEF

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id,Username)

ALTER TABLE Users
ADD CONSTRAINT CHK_Users__Password__5_Symbols CHECK (DATALENGTH([Password]) >= 5);


ALTER TABLE Users
ADD CONSTRAINT DF_DefaultTime_Now DEFAULT GETDATE() FOR LastLoginTime;


INSERT INTO Users
(Username, [Password], ProfilePicture, IsDeleted) 
VALUES
('Default', 'abracadabraasdt31', NULL, 0)

SELECT * FROM Users

ALTER TABLE Users
ADD CONSTRAINT CHK_Users__Username__3_Symbols CHECK (DATALENGTH(Username) >= 3);

ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users_Id PRIMARY KEY (Id)
