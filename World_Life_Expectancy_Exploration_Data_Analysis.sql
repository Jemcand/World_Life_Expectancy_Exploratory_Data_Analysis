#World Life Expentancy Project (Exploratory Data Analysis)

SELECT *
FROM world_life_expectancy
;

SELECT Country, 
MIN(`Life expectancy`) AS Lowest, 
MAX(`Life expectancy`) as Highest,
ROUND(MAX(`Life expectancy`) - MIN(`Life expectancy`),1) AS Increased_over_15_years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY Increased_over_15_years desc
#ORDER BY Increased_over_15_years asc
;
#Haiti, Zimbabwe, Eritrea and Uganda show over 20 years increase od life expentancy in the past 15 years

SELECT Year, ROUND(AVG(`Life expectancy`),1) AS Avg_Life_EXp
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year 
;
#globally 2007 started with life exp on 66.8 which keep incresing to 71.6 in 2022.
#only 2009 and 2010 didn't increase. both years remained at 67.4

SELECT Country, 
ROUND(AVG(`Life expectancy`),1) AS Avg_Life_EXp, 
ROUND(AVG(GDP),1) AS Avg_GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Avg_Life_EXp <> 0
AND Avg_GDP <> 0
ORDER BY Avg_GDP ASC
;
#low life expentancy correlates to lower GDP. Somalia is the lowest while Switzwerland is the highest
#Great for tableau visualization

SELECT 
SUM(CASE WHEN GDP >= 1200 THEN 1 ELSE 0 END) High_GDP_Count,
ROUND(AVG(CASE WHEN GDP >= 1200 THEN `Life expectancy` ELSE NULL END),1) High_GDP_Life_Exp,
SUM(CASE WHEN GDP <= 1200 THEN 1 ELSE 0 END) Low_GDP_Count,
ROUND(AVG(CASE WHEN GDP <= 1200 THEN `Life expectancy` ELSE NULL END),1) Low_GDP_Life_Exp
FROM world_life_expectancy
;
#Split the count by half, so 1452 are high at 73.7 Life Exp and 1487 are low at 64.4

SELECT Status, 
ROUND(AVG(`Life expectancy`),1) AS Avg_Life_EXp
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Status
;
SELECT Status, 
COUNT(DISTINCT Country) Country_Count, 
ROUND(AVG(`Life expectancy`),1) AS Avg_Life_EXp
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Status
;
#only 32 Developed countries with vs 151 Developing with an avgerage life expectancy of 12 years difference

SELECT Country, 
ROUND(AVG(`Life expectancy`),1) AS Avg_Life_EXp, 
ROUND(AVG(BMI),1) AS Avg_BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Avg_Life_EXp <> 0
AND Avg_BMI <> 0
ORDER BY Avg_BMI DESC
;
#BMIs are showing to be alarming high in most countries

SELECT Country, 
Year, 
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) as Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE '%states%'
;
#it seems 931 Adults died in 15 years. Probable a data collection issue.










