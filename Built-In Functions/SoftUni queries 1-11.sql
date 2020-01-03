SELECT FirstName, LastName FROM Employees
 WHERE FirstName LIKE 'SA%';

SELECT FirstName, LastName FROM Employees
  WHERE LastName LIKE '%ei%';

SELECT FirstName FROM Employees
 WHERE (DepartmentID IN (3, 10))
   AND (YEAR(HireDate) BETWEEN 1995 AND 2005);

SELECT FirstName, LastName FROM Employees
 WHERE JobTitle NOT LIKE '%engineer%'
 
  SELECT [Name] FROM Towns
   WHERE LEN([Name]) IN (5, 6)
ORDER BY [Name];

  SELECT TownID, [Name] FROM Towns
   WHERE [Name] LIKE '[mkbe]%'
ORDER BY [Name];

   SELECT TownID, [Name] FROM Towns
    WHERE [Name] NOT LIKE '[rbd]%'
 ORDER BY [Name];

GO

 CREATE VIEW V_EmployeesHiredAfter2000 AS
	  SELECT FirstName, LastName FROM Employees
	   WHERE YEAR(HireDate) > 2000;

GO

SELECT * FROM V_EmployeesHiredAfter2000;

SELECT FirstName, LastName FROM Employees
 WHERE LEN(LastName) = 5;

SELECT 
 EmployeeID,
 FirstName,
 LastName,
 Salary,
 DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) [Rank] FROM Employees
 WHERE Salary BETWEEN 10000 AND 50000
 ORDER BY Salary DESC
 
WITH EmployeesRanks AS
(
  SELECT *, DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) SalaryRank FROM Employees
)

SELECT EmployeeID, FirstName, LastName, Salary, SalaryRank FROM EmployeesRanks
 WHERE SalaryRank = 2
 AND Salary BETWEEN 10000 AND 50000
 ORDER BY Salary DESC

