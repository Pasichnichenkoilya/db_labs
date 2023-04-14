--Отримати назву міста і назву регіону в якому знаходиться місто.
--У результат мають потрапити міста з населенням більше ніж 350 000
SELECT cities.name, regions.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid AND cities.population > 350000;

--За допомогою поєднань двох таблиць отримати міста яки знаходяться у регіоні з назвою Nord
SELECT cities.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid AND regions.name  = 'Nord';
