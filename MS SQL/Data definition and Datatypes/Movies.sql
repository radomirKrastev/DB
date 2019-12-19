CREATE TABLE Directors(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT Directors VALUES
('Edward Zwick', NULL),
('Gavin O''Conor', NULL),
('James Cameron', NULL),
('Ridley Scott', NULL),
('Peter Jackson', NULL)

CREATE TABLE Genres(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT Genres VALUES
('Horror', NULL),
('Action', NULL),
('Thriller', NULL),
('War', NULL),
('Science fiction', NULL)


CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT Categories VALUES
('Adventure', NULL),
('Drama', NULL),
('Cosmic', NULL),
('Western', NULL),
('Comedy', NULL)

CREATE TABLE Movies(
Id INT PRIMARY KEY IDENTITY,
Title NVARCHAR(30) NOT NULL,
DirectorId INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
CopyrightYear DATE NOT NULL, 
[Length] TIME NOT NULL,
GenreId INT FOREIGN KEY REFERENCES Genres(Id),
CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
Rating DECIMAL(2,1),
Notes NVARCHAR(MAX)
)

INSERT Movies VALUES
('Last Samurai', 1, '2003', '1:59:22', 4, NULL, 7.7, NULL),
('Avatar', 3, '2009', '2:23:00', 5, NULL, 7.8, NULL),
('Warrior', 2, '2011', '2:20:22', NULL, 2, 8.2, NULL),
('Gladiator', 4, '2000', '2:35:00', 4, NULL, 8.5, NULL),
('Lord Of The Rings', 5, '2001', '2:58:00', NULL, 1, 8.8, NULL)

