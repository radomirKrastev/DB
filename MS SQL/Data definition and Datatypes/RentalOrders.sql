CREATE TABLE Categories (
Id INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(30) NOT NULL,
DailyRate DECIMAL (7, 2),
WeeklyRate DECIMAL (7, 2),
MonthlyRate DECIMAL (8, 2),
WeekendRate DECIMAL (7, 2)
)

INSERT Categories VALUES
('Sport', 60.567, 360.56, 1153.67, 99.678),
('SUV', 78.567, 460.56, 1354.67, 130.678),
('OFF ROAD', NULL, NULL, NULL, NULL)

CREATE TABLE Cars (
Id INT PRIMARY KEY IDENTITY,
PlateNumber NVARCHAR(10) NOT NULL,
Model VARCHAR(15) NOT NULL,
CarYear DATE NOT NULL,
CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
Doors TINYINT NOT NULL,
Picture VARBINARY(MAX),
Condition NVARCHAR(MAX),
Available BIT
)

INSERT Cars VALUES
('Â 1967 ÂÂ', 'RX450h', '2019', 2, 4, NULL, NULL, 0),
('Â 2222 XÂ', 'IS350h', '2019', 1, 5, NULL, NULL, 1),
('Â 7777 OÂ', 'LC-F', '2019', 1, 2, NULL, NULL, 0)


CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(20) NOT NULL,
Title NVARCHAR(30) NOT NULL,
Notes NVARCHAR(MAX)
)

INSERT Employees VALUES
('Daniel', 'Hristov', 'Customer Support', NULL),
('Hristo', 'Smirnenski', 'Machine Enthusiast', NULL),
('Icata', 'Stoichkov', 'phd', NULL)


CREATE TABLE Customers (
Id INT PRIMARY KEY IDENTITY,
DriverLicenceNumber NVARCHAR(20) NOT NULL,
FullName NVARCHAR(40) NOT NULL,
[Address] NVARCHAR(40) NOT NULL,
City NVARCHAR(20) NOT NULL,
ZIPCode VARCHAR(9),
Notes NVARCHAR(MAX)
)

INSERT Customers VALUES
('565548215', 'Ken Block', 'Blvd "Hristo Botev"', 'Plovdiv', '900024578', NULL),
('165867158', 'Jurgen Klop', 'Baker''s Street', 'Varna', '900069874', NULL),
('316848763', 'Mickey Mouse', 'Orlandovci', 'Sofia', '89989', NULL)


CREATE TABLE RentalOrders (
Id INT PRIMARY KEY IDENTITY,
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
CustomerId INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
CarId INT FOREIGN KEY REFERENCES Cars(Id) NOT NULL,
TankLevel DECIMAL(5, 3) NOT NULL,
KilometrageStart DECIMAL(6, 2) NOT NULL,
KilometrageEnd DECIMAL(6, 2) NOT NULL,
TotalKilometrage DECIMAL(10, 2) NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalDays TINYINT NOT NULL,
RateApplied DECIMAL(6, 2) NOT NULL,
TaxRate DECIMAL(6, 2) NOT NULL,
OrderStatus BIT,
Notes NVARCHAR(MAX)
)

INSERT RentalOrders 
VALUES
(2, 3, 1, 0, 235, 278.56, 200000, '2019-02-15', '2019-03-15', 30, 24.4, 4.4, 1, NULL),
(1, 2, 1, 99.6, 134.50, 500.9, 150000, '2018-04-27', '2018-04-28', 1 , 12.3, 2.2, 0, NULL),
(3, 1, 2, 90, 0, 293, 987865, '2012-12-12', '2012-12-15', 3, 132.8, 13.2, 1, NULL)
 