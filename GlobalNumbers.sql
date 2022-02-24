
---GLOBAL NUMBERS
---Total New daily cases and total daily deaths 
SELECT date, SUM(new_cases) AS TOTAL_DAILY_CASES, SUM(CAST(new_deaths as int)) AS TOTAL_DAILY_DEATHS, SUM(CAST(new_deaths as int))/SUM(new_cases) *100 AS WorldDeathRate
FROM dbo.CovidDeaths
WHERE continent is not null
GROUP BY date
ORDER BY 1 DESC


--Total World Cases
SELECt SUM(new_cases) AS TOTAL_DAILY_CASES, SUM(CAST(new_deaths as int)) AS TOTAL_DAILY_DEATHS, SUM(CAST(new_deaths as int))/SUM(new_cases) *100 AS WorldDeathRate
FROM dbo.CovidDeaths
WHERE continent is not null 
AND date  between CAST(2020-03-20 AS INT) and CAST(2020-05-31 AS INT)
--GROUP BY date
ORDER BY 1 DESC


--EXPLORE VACCINATIONS TABLE
SELECT *
FROM dbo.Vaccinations


---shows vaccinations, tests, by date ansd location
SELECT location, population, date,total_tests, total_vaccinations
FROM dbo.Vaccinations
ORDER BY 1 

--Sows vaccinations and tests by location
SELECT  location, SUM(CAST(new_tests AS INT)) as Totaltests, SUM(CAST(new_vaccinations AS INT)) as TotalVaccinations
FROM dbo.Vaccinations
WHERE new_vaccinations is not null and new_tests is not null 
GROUP BY location
ORDER BY 3 desc


--JOIN the two tables
SELECT dbo.CovidDeaths.date, dbo.CovidDeaths.location dbo.CovidDeaths.new_cases, dbo.CovidDeaths.total_cases, dbo.Vaccinations.new_tests, dbo.Vaccinations.new_vaccinations
FROM dbo.CovidDeaths
JOIN dbo.Vaccinations
	ON dbo.CovidDeaths.date=dbo.Vaccinations.date



---JOIN the two tables
SELECT *
FROM dbo.CovidDeaths dea
JOIN dbo.Vaccinations vac
	ON dea.date=vac.date
ORDER BY dea.date DESC

SELECT *
FROM dbo.CovidDeaths
