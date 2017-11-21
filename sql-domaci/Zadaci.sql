-- Napisati upit koji ispisuje gradove ali sa redom sledecim informacijama: naziv drzave, naziv regije, naziv grada
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    cities.`name` AS grad
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id;


-- Napisati upit koji ispipsuje gradove koji imaju populaciju milion ili vise, sortiranim po populaciji 
--opadajuce, sa sledecim informacijama: kratki kod zemlje, naziv zemlje, naziv grada, populacija
SELECT
    countries.sortname,
    countries.`name`,
    cities.`name`,
    cities.population
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
WHERE
    cities.population >= 1000000
ORDER BY
    cities.population DESC;

-- Napisati upit koji prikazuje gradove za koje nije uneta populacija (tj populacija je 0) 
--sa kolonama: naziv drzave, naziv regije, naziv grada
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    cities.`name` AS grad
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
WHERE
    cities.population = 0;


-- Napisati upit koji prikazuje broj gradova za koje nije uneta populaija
SELECT    
    COUNT(id) AS broj_gradova_za_koji_nije_uneta_populacija
FROM
    cities
WHERE
    cities.population = 0;

-- Napisati upit koji prikazuje regije zajedno sa brojem stanovnika u regiji, polja koja se prikazuju su: 
--naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    SUM(cities.population) AS broj_stanovnika_u_regiji
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    states.id;
    


-- Napisati upit koji pronalazi 10 regija sa najvise stanovnika, polja koja se prikazuju su: 
--naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    SUM(cities.population) AS broj_stanovnika_u_regiji
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    states.id
ORDER BY
    broj_stanovnika_u_regiji DESC
LIMIT 10;


-- Napisati upit koji pronalazi regija sa brojem stanovnika vecim od milion, polja koja se prikazuju su: 
--naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    SUM(cities.population) AS broj_stanovnika_u_regiji
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    states.id
HAVING
    broj_stanovnika_u_regiji > 1000000;


-- Napisati upit koji pronalazi 5 regija sa najvise registrovanih gradova, polja koja se prikazuju su: 
--naziv drzave, naziv regije, broj gradova u regiji
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    COUNT(cities.id) AS broj_gradova_u_regiji
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    states.id
ORDER BY
    broj_gradova_u_regiji DESC
LIMIT 5;


-- Napisati upit koji pronalazi regije sa nijednim unetim gradom (broj gradova je 0), polja koja se prikazuju su: 
--naziv drzave, naziv regije, broj gradova u regiji
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    COUNT(cities.id) AS broj_gradova_u_regiji
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    states.id
HAVING
    broj_gradova_u_regiji = 0;


-- Napisati upit koji pronalazi 5 regija sa najvise registrovanih gradova ciji naziv pocinje sa slovom 'r', 
--polja koja se prikazuju su: naziv drzave, naziv regije, broj gradova u regiji
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    COUNT(cities.id) AS broj_gradova_u_regiji
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
WHERE
    cities.`name` LIKE 'r%'
GROUP BY
    states.id
ORDER BY
    broj_gradova_u_regiji DESC
LIMIT 5;


-- Napisati upit koji pronalazi 5 regija sa najvise milionskih gradova (broje se gradovi sa populacijom vecom od milion),
-- polja koja se prikazuju su: naziv drzave, naziv regije, broj gradova u regiji
SELECT
    countries.`name` AS drzava,
    states.`name` AS regija,
    COUNT(cities.id) AS broj_gradova_u_regiji
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
WHERE
    cities.population > 1000000
GROUP BY
    states.id
ORDER BY
    broj_gradova_u_regiji DESC
LIMIT 5;



-- Napisati upit koji pronalazi drzave koje imaju vise od 100 regija, polja koja se prikazuju su id drzave, kratki kod drzave, 
--naziv drzave i broj regija
SELECT
    countries.id AS id_drzave,
    countries.sortname AS kod_drzave,
    countries.`name` AS drzava,
    COUNT(states.id) AS broj_regija
FROM
    states
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    countries.id
HAVING
    broj_regija > 100;


-- Napisati upit koji pronalazi drzave koje imaju vise od 10 regija ciji naziv pocinje sa slovom 'a', polja koja se prikazuju su id drzave, 
--kratki kod drzave, naziv drzave i broj regija
SELECT
    countries.id AS id_drzave,
    countries.sortname AS kod_drzave,
    countries.`name` AS drzava,
    COUNT(states.id) AS broj_regija
FROM
    states
JOIN
    countries ON countries.id = states.country_id
WHERE
    states.`name` LIKE 'a%'
GROUP BY
    countries.id
HAVING
    COUNT(states.id) > 10;


-- Napisati upit koji prikazuje drzave zajedno sa njihovim brojem stanovnika, sortiranih po broju stanovnika opadajuce, 
--polja koja se prikazuju su id drzave, kratki kod drzave, naziv drzave i broj stanovnika
SELECT
    countries.id AS id_drzave,
    countries.sortname AS kod_drzave,
    countries.`name` AS drzava,
    SUM(cities.population) AS broj_stanovnika
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    countries.id
ORDER BY
    broj_stanovnika DESC;


-- Napisati upit koji prolazi drzave koje imaju vise od milion stanovnika, polja koja se prikazuju su id drzave, kratki kod drzave, 
--naziv drzave i broj stanovnika
SELECT
    countries.id AS id_drzave,
    countries.sortname AS kod_drzave,
    countries.`name` AS drzava,
    SUM(cities.population) AS broj_stanovnika
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    countries.id
HAVING
    broj_stanovnika > 1000000;


-- Napisati upit koji prikazuje prvih 5 drzava sa najvise milionskih gradova
SELECT
    countries.id AS id_drzave,
    countries.sortname AS kod_drzave,
    countries.`name` AS drzava,
    SUM(cities.population) AS broj_stanovnika
FROM
    cities
JOIN
    states ON states.id = cities.state_id
JOIN
    countries ON countries.id = states.country_id
GROUP BY
    countries.id
HAVING
    broj_stanovnika > 1000000
ORDER BY
    broj_stanovnika DESC
LIMIT 5;