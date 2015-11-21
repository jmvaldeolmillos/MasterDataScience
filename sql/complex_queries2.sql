--- airlines y Ref. Añadir el nombre a la de Ref.

SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code" = r.airline_code_2c;

--- Hay siempre que mirar la integridad mirando que sale lo que tienen que salir (n lineas = a la tabla izda).
--- Si hay duplicados, deberíamos arreglar la BBDD. O mirar criterios: mirar fechas de validez de la referencia.

--- Sacar top ten del anterior.

SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
LEFT OUTER JOIN optd_airlines AS o
ON o."2char_code" = r.airline_code_2c 
ORDER BY flight_freq DESC LIMIT 10;

--- Cambiamos el orden de la tabla

SELECT airline_code_2c, name, flight_freq
FROM optd_airlines AS r
LEFT OUTER JOIN ref_airline_nb_of_flights AS o
ON r."2char_code" = o.airline_code_2c 
ORDER BY flight_freq DESC LIMIT 10;

--- RIGTH

SELECT airline_code_2c, name, flight_freq
FROM ref_airline_nb_of_flights AS r
RIGHT OUTER JOIN optd_airlines AS o
ON o."2char_code" = r.airline_code_2c
ORDER BY flight_freq DESC LIMIT 10;

--- CONSULTAS MULTIPLES CON WHERE Y HAVING

SELECT name, country_name, elevation 
FROM optd_por_public
WHERE elevation > (
    SELECT AVG(elevation) FROM optd_por_public WHERE elevation IS NOT NULL AND location_type='C') 
    AND location_type='C'
ORDER BY elevation DESC
LIMIT 10;

--- contar ciudades de cada pais y mostrar cuantas ciudades pero saca solo los que tienes más de 3 pero de la elevación media global.

SELECT country_name, count(*) 
FROM optd_por_public
WHERE elevation > (
    SELECT AVG(elevation) FROM optd_por_public WHERE elevation IS NOT NULL AND location_type='C') 
    AND location_type='C'
GROUP BY country_name
HAVING count(*) >= 3;

--- Ejercicio: Cuantas ciudades hay en cada país por encima de la media de cada uno de los países. Modificar la anterior que da la media total, para que de la media para cada pais.



















--- Ejercicio tienda de informática:

create table fabricantes (
    codigo INT PRIMARY KEY,
    nombre VARCHAR);
    
create table articulos (
    codigo INT PRIMARY KEY, 
    nombre VARCHAR,
    precio INT,
    fabricante INT REFERENCES fabricantes(codigo));
    
Query 2

SELECT DISTINCT fabricantes.nombre
FROM articulos
LEFT OUTER JOIN fabricantes
ON (fabricantes.codigo = articulos.codigo) 
WHERE precio BETWEEN 60 AND 200;

--- cuantos articulos tiene cada fab. en esta franja?

SELECT DISTINCT fabricantes.nombre, count(*)
FROM articulos
LEFT OUTER JOIN fabricantes
ON (fabricantes.codigo = articulos.codigo) 
WHERE precio BETWEEN 60 AND 200
GROUP BY fabricantes.nombres;

--- Solo los que tengan más de 3 articulos

SELECT DISTINCT fabricantes.nombre, count(*)
FROM articulos
LEFT OUTER JOIN fabricantes
ON (fabricantes.codigo = articulos.codigo) 
WHERE precio BETWEEN 60 AND 200
GROUP BY fabricantes.nombres
HAVING count(*) >= 3;