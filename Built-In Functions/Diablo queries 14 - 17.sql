  SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start] FROM Games
   WHERE YEAR([Start]) BETWEEN 2011 AND 2012
ORDER BY [Start], [Name];

  SELECT Username, SUBSTRING(Email, CHARINDEX('@', Email) + 1,LEN(Email)) AS [Provider] FROM Users
ORDER BY [Provider], Username;

  SELECT Username, IpAddress FROM Users
   WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username;

SELECT [Name], Id, 
CASE 
WHEN CAST([Start] AS TIME) BETWEEN '0:00:00' AND '11:59:59' THEN 'Morning'
WHEN CAST([Start] AS TIME) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
WHEN CAST([Start] AS TIME) BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
END AS PartOfDay,
CASE 
WHEN Duration <= 3 THEN 'Extra Short'
WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
WHEN Duration > 6 THEN 'Long'
WHEN Duration IS NULL THEN 'Extra Long'
END AS DurationCategory
FROM Games
ORDER BY [Name], DurationCategory, PartOfDay;