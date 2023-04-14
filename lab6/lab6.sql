--Отримати назву міста і назву регіону в якому знаходиться місто.
--У результат мають потрапити міста з населенням більше ніж 350 000
SELECT cities.name, regions.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid AND cities.population > 350000;

--За допомогою поєднань двох таблиць отримати міста яки знаходяться у регіоні з назвою Nord
SELECT cities.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid AND regions.name  = 'Nord';

--Виводимо станції та колор гілки
SELECT stations.name AS name, branches.color AS branch_color
FROM stations
INNER JOIN branches ON stations.branch_id

--Виводимо всі станції які мають переход
SELECT t.id, CONCAT(
    (SELECT name FROM stations WHERE id = t.station_to_id),
    ' - ',
    (SELECT name FROM stations WHERE id = t.station_FROM_id))
    AS result
FROM transitions AS t