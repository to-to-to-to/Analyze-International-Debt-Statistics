
SELECT * FROM international_debt.table LIMIT 10;

SELECT 
    COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt.table;

SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM international_debt.table
ORDER BY distinct_debt_indicators;

SELECT 
    ROUND(SUM(debt)/1000000, 2) AS total_debt
FROM international_debt.table; 

SELECT 
    country_name, 
    SUM(debt) as total_debt
FROM international_debt.table
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    AVG(debt) AS average_debt
FROM international_debt.table
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

SELECT 
    country_name, 
    indicator_name
FROM international_debt.table
WHERE debt = (SELECT 
                 MAX(debt)
             FROM international_debt.table
             WHERE indicator_code='DT.AMT.DLXF.CD');
             
SELECT indicator_code, 
        COUNT(indicator_code) AS indicator_count
FROM international_debt.table
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC

LIMIT 20;

SELECT country_name, 
        indicator_code,
        MAX(debt) AS maximum_debt
FROM international_debt.table
GROUP BY country_name, indicator_code
ORDER BY maximum_debt DESC
LIMIT 10;

