--Повернути другу п'ятірку міст України (за алфавітом) назву повернути у верхньому регістрі
SELECT UPPER(name)
FROM cities
ORDER BY name ASC
LIMIT 5 OFFSET 5;

--Отримати назву міста і в окремому стовпчику довжину назви.
--У результат не повинні потрапити міста з довжиною назва 8,9 та 10 символів
SELECT name, LENGTH(name) as name_length
FROM cities
WHERE LENGTH(name) NOT BETWEEN 8 AND 10;

--Отримати кількість населення у регіоні C та S
SELECT SUM(population) as C_S_population
FROM cities
WHERE region IN('C', 'S');

--Отримати середню кількість населення у містах з регіону W
SELECT AVG(population) average_population
FROM cities
WHERE region = 'W';

--Отримати кількість міст у регіоні E
SELECT COUNT(*) E_cities_count
FROM cities
WHERE region = 'E';
