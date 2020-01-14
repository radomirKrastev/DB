  SELECT e.DepartmentID, SUM(e.Salary) AS TotalSalary
	FROM Employees AS e
GROUP BY e.DepartmentID;

  SELECT e.DepartmentID, MIN(e.Salary) AS MinimumSalary
	FROM Employees AS e
   WHERE e.DepartmentID IN (2, 5, 7)
     AND e.HireDate > '01/01/2000'
GROUP BY e.DepartmentID;

SELECT * INTO NewEmployees 
  FROM Employees
 WHERE Salary > 30000;

 DELETE FROM NewEmployees
  WHERE ManagerID = 42;

 UPDATE NewEmployees
 SET Salary += 5000
 WHERE DepartmentID = 1;
 
   SELECT DepartmentID, AVG(Salary) AS AverageSalary
     FROM NewEmployees 
 GROUP BY DepartmentID;

  SELECT DepartmentID, MAX(Salary) AS MaximumSalary
    FROM Employees
GROUP BY DepartmentID
  HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000;

SELECT COUNT(Salary) AS [Count]
  FROM Employees
 WHERE ManagerID IS NULL;

  SELECT DepartmentID, Salary
    FROM Employees
GROUP BY DepartmentID, Salary

GO

WITH Result AS
(
SELECT DepartmentID, Salary, DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS DenseRank
  FROM Employees
)

SELECT DISTINCT DepartmentID, Salary
  FROM Result
 WHERE Result.DenseRank = 3;

GO

WITH Res AS
(
  SELECT DepartmentID, AVG(Salary) AS AverageSalary
    FROM Employees
GROUP BY DepartmentID
)

  SELECT TOP(10) e.FirstName, e.LastName, e.DepartmentID --, e.Salary, r.AverageSalary 
    FROM Employees AS e, Res AS r
   WHERE e.DepartmentID = r.DepartmentID
     AND e.Salary > r.AverageSalary
ORDER BY e.DepartmentID