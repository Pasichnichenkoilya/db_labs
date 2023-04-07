--Отримати кількість населення в кожному регіоні
SELECT population
FROM cities
GROUP BY region;

--Отримати регіони та кількість населення в цих регіонах де кількість міст в регіоні більше або дорівнює 10
SELECT region, SUM(population) as population_sum
FROM cities
GROUP BY region
HAVING COUNT(name) >= 10;

--Отримати третю п'ятірку міст (назва та кількість населення)
--за кількістю населення якщо ці міста знаходяться в регіонах с кількість областей не меньше 5
SELECT name, population
FROM cities
WHERE region IN (
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(*) >= 5
)
ORDER BY population ASC
LIMIT 5 OFFSET 10;

--Отримати назви регіонів та кількість в них населення, за умови що
--в підрахунку кількості населення брали участь міста з населенням більше ніж 300 000.
SELECT region, SUM(population) as population_sum
FROM cities
WHERE population > 300000
GROUP BY region;

--Отримати назву так кількість населення міст які знаходяться в регіонах з кількістю областей не більше 5
--та кількість населення в цих містах не входить до діапазону 150 000 - 500 000
SELECT name, population
FROM cities
WHERE population NOT BETWEEN 150000 AND 500000 AND region IN (SELECT uuid
                  FROM regions
                  WHERE area_quantity <= 5)
