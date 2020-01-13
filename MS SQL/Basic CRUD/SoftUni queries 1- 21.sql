SELECT * FROM Departments;

SELECT [Name] FROM Departments;

SELECT FirstName, LastName, Salary FROM Employees;

SELECT FirstName, MiddleName, LastName FROM Employees;

GO

CREATE VIEW v_EmployeesEmails AS
	 SELECT FirstName + '.' + LastName + '@softuni.bg' AS Email
	   FROM Employees

GO

SELECT * FROM v_EmployeesEmails;

SELECT FirstName + '.' + LastName + '@softuni.bg' AS Email FROM Employees;

SELECT DISTINCT Salary FROM Employees
	   ORDER BY Salary;

SELECT * FROM Employees
		WHERE JobTitle = 'Sales Representative';

SELECT FirstName, LastName, JobTitle FROM Employees
 WHERE Salary BETWEEN 20000 AND 30000;

SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS FullName FROM Employees
 WHERE Salary IN (25000, 14000, 12500, 23600);

SELECT FirstName, LastName FROM Employees
 WHERE ManagerID is NULL;

   SELECT FirstName, LastName, Salary FROM Employees
    WHERE Salary > 50000
 ORDER BY Salary DESC;  

SELECT TOP (5) FirstName, LastName FROM Employees
  ORDER BY Salary DESC;
	
SELECT FirstName, LastName FROM Employees
 WHERE DepartmentID != 4;

SELECT * FROM Employees
	 ORDER BY Salary DESC,
			  FirstName ASC,
			  LastName DESC,
			  MiddleName ASC;

GO

CREATE VIEW v_EmployeesSalaries AS
     SELECT FirstName, LastName, Salary
	   FROM Employees;

GO

SELECT * FROM v_EmployeesSalaries;

GO

CREATE VIEW v_EmployeeNameJobTitle
		 AS
	 SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS FullName, JobTitle
	 --SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS FullName, JobTitle
	   FROM Employees;

GO

SELECT * FROM v_EmployeeNameJobTitle;

SELECT DISTINCT JobTitle FROM Employees;

SELECT TOP (10) * FROM Projects
	 ORDER BY StartDate, Name;

SELECT TOP (7) FirstName, LastName, HireDate FROM Employees
  ORDER BY HireDate DESC;

UPDATE Employees
SET Salary *= 1.12
WHERE DepartmentID IN (1, 2, 4, 11);

SELECT Salary FROM Employees