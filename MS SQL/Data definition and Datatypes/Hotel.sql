CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(17) NOT NULL,
LastName NVARCHAR(17) NOT NULL,
Title NVARCHAR(30),
Notes NVARCHAR(MAX)
)

INSERT Employees (FirstName, LastName, Notes) VALUES
('Bruce', 'Wayne', NULL),
('Stanimir', 'Stanimirov', NULL),
('Roberto', 'Firmino', NULL)

CREATE TABLE Customers (
AccountNumber INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(17) NOT NULL,
LastName NVARCHAR(17) NOT NULL,
PhoneNumber VARCHAR(17) NOT NULL,
EmergencyName NVARCHAR(17),
EmergencyNumber VARCHAR(17),
Notes NVARCHAR(MAX)
)

INSERT Customers (FirstName, LastName, PhoneNumber) VALUES
('Andrwe', 'Robertson', '0879567892'),
('Steven', 'Gerrard', '0879567332'),
('Sadio', 'Mane', '0879566666')

CREATE TABLE RoomStatus(
Id INT PRIMARY KEY IDENTITY NOT NULL,
RoomStatus BIT,
Notes VARCHAR(MAX)
)
 
INSERT INTO RoomStatus(RoomStatus, Notes)
VALUES
(1,'Refill the minibar'),
(2,'Check the towels'),
(3,'Move the bed for couple')

CREATE TABLE RoomTypes (
RoomType NVARCHAR(20) PRIMARY KEY NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT RoomTypes (RoomType) VALUES
('Large'),
('President Apartment'),
('Double')

CREATE TABLE BedTypes (
BedType NVARCHAR(20) PRIMARY KEY NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT BedTypes (BedType) VALUES
('Queen'),
('King'),
('Person and a half')

CREATE TABLE Rooms (
RoomNumber INT PRIMARY KEY IDENTITY,
RoomType NVARCHAR(20) FOREIGN KEY REFERENCES RoomTypes(RoomType) NOT NULL,
BedType NVARCHAR(20) FOREIGN KEY REFERENCES BedTypes(BedType) NOT NULL,
Rate DECIMAL(7, 2) NOT NULL,
RoomStatus BIT NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT Rooms (RoomType, BedType, Rate, RoomStatus) VALUES
('Large', 'Queen', 1234.55, 1),
('President Apartment', 'King', 5534.55, 0),
('Double', 'Queen', 789.55, 1)

CREATE TABLE Payments (
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
PaymentDate SMALLDATETIME NOT NULL,
AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
FirstDateOccupied DATE NOT NULL,
LastDateOccupied DATE NOT NULL,
TotalDays AS DATEDIFF(DAY, FirstDateOccupied, LastDateOccupied),
AmountCharged DECIMAL (8, 2) NOT NULL,
TaxRate DECIMAL (5, 2),
TaxAmount AS (AmountCharged * (TaxRate/100)),
PaymentTotal AS (AmountCharged * (TaxRate/100)) + AmountCharged,
Notes NVARCHAR(MAX)
)

INSERT Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, AmountCharged, TaxRate) VALUES
(2, '2019-10-01', 1, '2019-10-01', '2019-10-10', 10034.55, 20.50),
(3, '2019-09-18', 3, '2019-09-22', '2019-09-27', 5000.55, 32.50),
(1, '2017-01-01', 2, '2017-01-19', '2017-01-23', 1245.55, 12.37)


CREATE TABLE Occupancies (
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
DateOccupied DATE NOT NULL,
AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber) NOT NULL,
RateApplied DECIMAL (8, 2) NOT NULL,
PhoneCharge DECIMAL (5, 2),
Notes NVARCHAR(MAX)
)


INSERT Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge) VALUES
(2, '2019-10-01', 1, 2, 20.50, 9),
(3, '2019-09-18', 3, 2, 32.50, 5),
(1, '2017-01-01', 2, 3, 12.37, 4)
