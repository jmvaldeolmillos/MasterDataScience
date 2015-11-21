/* --- Top Ten de paises

SELECT country_name, SUM(population) AS npop 
FROM optd_por_public 
WHERE population IS NOT NULL 
GROUP BY country_name 
ORDER BY npop DESC LIMIT 10;

---Pop ten de aeropuertos per capita


SELECT country_name, count(*) AS nairports
FROM optd_por_public 
WHERE location_type='A'OR location_type='CA' 
GROUP BY country_name 
ORDER BY nairports LIMIT 10

*/

--- Método de "unimos ambas con inner join, solo que con una tabla" usamos CAST y float para problemas con decimales y enteros.

SELECT t1.country_name, npop, nairports, CAST(nairports AS float/npop)*100 AS percapita
FROM

(SELECT country_name, SUM(population) AS npop 
FROM optd_por_public 
WHERE population IS NOT NULL 
GROUP BY country_name) AS t1,

(SELECT country_name, count(*) AS nairports
FROM optd_por_public 
WHERE location_type='A'OR location_type='CA' 
GROUP BY country_name) AS t2

WHERE (t1.country_name = t2.country_name) AND npop > 0
ORDER BY percapita DESC LIMIT 10;



--- Lo mismo anterior pero mediante el uso de vistas. Creando ambas vistas primero.

SELECT populations2.country_name, npop, nairports, CAST(nairports AS float/npop)*100 AS percapita
FROM populations2, airports2
WHERE (populations2.country_name = airports2.country_name) AND npop > 0
ORDER BY percapita DESC LIMIT 10;

--- Sintaxis Inner Join

SELECT populations2.country_name, npop, nairports, CAST(nairports AS float/npop)*100 AS percapita
FROM populations2
INNER JOIN airports2
ON (populations2.country_name = airports2.country_name)
ORDER BY percapita DESC LIMIT 10;

