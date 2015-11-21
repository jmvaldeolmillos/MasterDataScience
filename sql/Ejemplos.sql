SELECT country_name, count(*) AS n
    FROM optd_por_public
    WHERE location_type='A' OR location_type='CA'
    GROUP BY country_name
    ORDER BY n DESC
    LIMIT 10;
    
-------

Aviones por número de motores (ojo a los nulos)

SELECT model, manufacturer, nb_engines FROM optd_aircraft WHERE nb_engines IS NOT NULL ORDER BY nb_engines DESC, manufacturer LIMIT 10;

-------

Cuantos hay con cuatro motores??

SELECT count(*) FROM optd_aircraft WHERE nb_engines=4;

-------

SELECT nb_engines, count(*) FROM optd_aircraft GRUOP BY nb_engines;

-------

Numero medio de Motores x fabricante Top Ten

SELECT manufacturer, avg(nb_engines) FROM optd_aircraft WHERE nb_engines IS NOT NULL GROUP BY manufacturer ORDER BY avg DESC LIMIT 10;

-------

SELECT iata_code, name, country_name, population, elevation FROM optd_por_public WHERE elevation IS NOT NULL ORDER BY elevation DESC LIMIT 10

-------

--- Pueblos más altos de España

SELECT iata_code, name, country_name, population, elevation FROM optd_por_public WHERE code='ES' AND location IS NOT NULL ORDER BY elevation DESC LIMIT 10

-------

--- Ciudad con más poblacion

SELECT iata_code, name, city_name, population, elevation FROM optd_por_public WHERE code='ES' AND population IS NOT NULL ORDER BY elevation DESC LIMIT 10

-------

--- el 2 es para decir que es order por sum y el pais cn más población.

SELECT country_name, SUM(population) FROM optd_por_public WHERE population IS NOT NULL GROUP BY country_name ORDER BY 2 DESC LIMIT 10;

---- contar aeropuertos


SELECT country_name, count(*) FROM optd_por_public WHERE location_type='A' GROUP BY country_name ORDER BY 2 LIMIT 10