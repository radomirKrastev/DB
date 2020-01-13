SELECT COUNT(Id) AS Count 
  FROM WizzardDeposits;

SELECT MAX(MagicWandSize) AS LongestMagicWand 
  FROM WizzardDeposits;

  SELECT w.DepositGroup, MAX(w.MagicWandSize) AS LongestMagicWand
    FROM WizzardDeposits AS w
GROUP BY w.DepositGroup;

  SELECT TOP(2) DepositGroup
    FROM WizzardDeposits AS w
GROUP BY w.DepositGroup
ORDER BY AVG(w.MagicWandSize);

SELECT w.DepositGroup, SUM(w.DepositAmount) AS Amount
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup

  SELECT w.DepositGroup, SUM(w.DepositAmount) AS Amount
    FROM WizzardDeposits AS w
   WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup

SELECT w.DepositGroup, SUM(w.DepositAmount) AS Amount
    FROM WizzardDeposits AS w
   WHERE w.MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup
  HAVING SUM(w.DepositAmount) < 150000
ORDER BY Amount DESC;

SELECT w.DepositGroup, w.MagicWandCreator, MIN(w.DepositCharge) AS MinDepositCharge
FROM WizzardDeposits AS w
GROUP BY w.DepositGroup, w.MagicWandCreator
ORDER BY w.MagicWandCreator, w.DepositGroup;

SELECT 
CASE 
WHEN w.Age BETWEEN 0 AND 10 THEN '[0-10]'
WHEN w.Age BETWEEN 11 AND 20 THEN '[11-20]'
WHEN w.Age BETWEEN 21 AND 30 THEN '[21-30]'
WHEN w.Age BETWEEN 31 AND 40 THEN '[31-40]'
WHEN w.Age BETWEEN 41 AND 50 THEN '[41-50]'
WHEN w.Age BETWEEN 51 AND 60 THEN '[51-60]'
WHEN w.Age > 60 THEN '[61+]'
END AS AgeGroup, COUNT(*) AS WizzardCount
FROM WizzardDeposits AS w
GROUP By CASE 
WHEN w.Age BETWEEN 0 AND 10 THEN '[0-10]'
WHEN w.Age BETWEEN 11 AND 20 THEN '[11-20]'
WHEN w.Age BETWEEN 21 AND 30 THEN '[21-30]'
WHEN w.Age BETWEEN 31 AND 40 THEN '[31-40]'
WHEN w.Age BETWEEN 41 AND 50 THEN '[41-50]'
WHEN w.Age BETWEEN 51 AND 60 THEN '[51-60]'
WHEN w.Age > 60 THEN '[61+]'
END

SELECT grouped.AgeGroups, COUNT(*) AS WizzardsCount
FROM
(SELECT
  CASE
  WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
  WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
  WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
  WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
  WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
  WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
  WHEN Age > 60 THEN '[61+]'
END AS AgeGroups
  FROM WizzardDeposits) AS grouped
GROUP BY grouped.AgeGroups

  SELECT SUBSTRING(w.FirstName, 1, 1) AS FirstLetter
    FROM WizzardDeposits AS w
   WHERE DepositGroup = 'Troll Chest'
GROUP BY SUBSTRING(w.FirstName, 1, 1)


SELECT w.DepositGroup, w.IsDepositExpired, AVG(w.DepositInterest) AS AverageInterest
FROM WizzardDeposits AS w
WHERE w.DepositStartDate > '01/01/1985'
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC, IsDepositExpired

SELECT SUM(result.[Difference])
FROM(
SELECT w.FirstName AS HostWizard, w.DepositAmount AS HostWizardDeposit, 
	LEAD(w.FirstName, 1) OVER(ORDER BY Id) AS GuestWizard,
	LEAD(DepositAmount, 1) OVER(ORDER BY Id) AS GuestWizardAmount,
	w.DepositAmount - LEAD(DepositAmount, 1) OVER (ORDER BY Id) AS [Difference]
FROM WizzardDeposits AS w) as result