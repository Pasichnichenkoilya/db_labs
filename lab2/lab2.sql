--Отримати список міст-мільйонерів України
SELECT *
FROM cities
WHERE population >= 1000000;

--Отримати список міст з регіону E та W відсортований за кількістю населення
SELECT * 
FROM cities
WHERE region = 'E' OR 'W'
ORDER BY population ASC;

--Отримати список міст з населенням більше ніж 50000 з регіонів S, C та N (вікористовуючи оператор IN)
SELECT * 
FROM cities
WHERE population >= 50000 AND region IN('S', 'C', 'N');

--Отримати перші 20 міст (за назвою) у яких населення більше ніж 150000 але не більше ніж 350000 та які знаходяться в регіонах E,W,N
SELECT * 
FROM cities
WHERE population BETWEEN 150000 AND 350000 AND region IN('E', 'W', 'N')
ORDER BY name ASC
LIMIT 20;

--Отримати другу десятку міст за кількістю населення які не входять до регіонів E та W
SELECT * 
FROM cities 
WHERE region NOT IN ('E', 'W')
ORDER BY population ASC
LIMIT 10 OFFSET 10;
