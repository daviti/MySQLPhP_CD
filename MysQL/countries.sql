SELECT countries.name, languages.language, languages.percentage
FROM languages
LEFT JOIN countries ON languages.country_code = countries.code
WHERE language='slovene' 
ORDER BY languages.percentage DESC;
​
SELECT countries.name, count(cities.name)
FROM countries
LEFT JOIN cities on cities.country_code = countries.code
GROUP BY countries.name
ORDER BY count(cities.name) DESC;

SELECT cities.name, cities.population 
FROM cities
LEFT JOIN countries on cities.country_code = countries.code
WHERE countries.name='mexico' AND cities.population > '500000​'
ORDER BY cities.population desc;
​
SELECT countries.name, languages.language, languages.percentage
FROM languages
LEFT JOIN countries on languages.country_code = countries.code
WHERE languages.percentage > '89​'
ORDER BY languages.percentage DESC;

SELECT name, surface_area, population
FROM countries
WHERE surface_area < '501' AND population > '100000​';

SELECT name, government_form, capital, life_expectancy
FROM countries
WHERE government_form = "constitutional monarchy"
and capital > '200' 
and life_expectancy > '75' 
​
SELECT countries.name, cities.name, cities.district, cities.population
FROM cities
LEFT JOIN countries ON cities.country_code = countries.id
WHERE countries.name = 'Argentina' AND cities.district = 'Buenos Aires' AND cities.population > '500000​'

SELECT region, count(*) AS countries
FROM countries
GROUP BY region
ORDER BY countries desc