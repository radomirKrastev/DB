  SELECT CountryName, IsoCode FROM Countries
   WHERE CountryName LIKE '%a%a%a%'
ORDER BY IsoCode;

SELECT Peaks.PeakName, Rivers.RiverName, LOWER(Peaks.PeakName + RIGHT(Rivers.RiverName, LEN(Rivers.RiverName) - 1)) AS Mix
FROM Peaks
INNER JOIN Rivers ON RIGHT(Peaks.PeakName, 1)=LEFT(Rivers.RiverName, 1)
ORDER BY Mix;
