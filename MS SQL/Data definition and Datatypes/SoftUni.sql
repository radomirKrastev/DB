CREATE TABLE Towns (
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL
)

INSERT Towns VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

CREATE TABLE Addresses (
Id INT PRIMARY KEY IDENTITY,
AddressText NVARCHAR(70) NOT NULL,
TownId INT FOREIGN KEY REFERENCES Towns(Id)
)

INSERT Addresses VALUES
('blvd 8-mi Primorski polk 132', 2),
('Upper Parliament Street', 3)

CREATE TABLE Departments (
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL
)

INSERT Departments VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(20) NOT NULL,
MiddleName NVARCHAR(20),
LastName NVARCHAR(20) NOT NULL,
JobTitle NVARCHAR(30) NOT NULL,
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
HireDate DATE,
Salary DECIMAL (8, 2) NOT NULL,
AddressId INT FOREIGN KEY REFERENCES Addresses(Id)
)

INSERT Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary) VALUES 
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, CONVERT(DATE, '01/02/2013', 103),	3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, CONVERT(DATE, '02/03/2004', 103),	4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, CONVERT(DATE, '28/08/2016', 103),	525.25),
('Georgi', 'Teziev', 'Ivanova', 'CEO', 2, CONVERT(DATE, '09/12/2007', 103),	3000.00),
('Peter', 'Pan', 'Pan', 'intern', 3, CONVERT(DATE, '28/08/2016', 103),	599.88)

SELECT DISTINCT [Name] FROM Towns
ORDER BY [Name]
SELECT DISTINCT [Name] FROM Departments
ORDER BY [Name]
SELECT FirstName, LastName, JobTitle, Salary FROM Employees
ORDER BY Salary DESC

UPDATE Employees
SET Salary += Salary * 0.1
SELECT Salary FROM Employees
ORDER BY Salary DESC


USE Hotel
UPDATE Payments
SET TaxRate = TaxRate - (TaxRate * 0.03)
SELECT TaxRate FROM Payments

TRUNCATE TABLE Occupancies