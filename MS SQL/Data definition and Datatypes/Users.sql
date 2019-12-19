CREATE TABLE Users(
Id BIGINT PRIMARY KEY IDENTITY,
Username VARCHAR(30) NOT NULL,
[Password] VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(MAX),
LastLoginTime DATETIME,
IsDeleted VARCHAR(5)
)

ALTER TABLE Users
ADD CONSTRAINT CHK_Users_ProfilePicture__900KB CHECK (DATALENGTH(ProfilePicture) <= 900000);

INSERT INTO Users VALUES
('UserOne', 'abracadabraasdt31', NULL, '2012-04-06T12:23:45', 'false'),
('UserTwo', 'abracadabra5', NULL, '2012-11-26T15:30:11', 'true'),
('UserThree', 'abracadabra3', NULL, '2015-09-17T15:32:54', 'false'),
('UserFour', 'abracadabra2', NULL, '2014-12-30T12:27:59', 'true'),
('UserFive', 'abracadabra1', NULL, '1998-01-26T15:30:11', 'false')