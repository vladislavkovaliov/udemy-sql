CREATE TABLE location2 AS (SELECT * FROM LOCATIONS l WHERE 1=2);


INSERT INTO location2 (LOCATION_ID, street_address, city, country_id) VALUES (3300, '1314 Sexam', 'Milan', 'IT');

INSERT INTO location2 (LOCATION_ID, street_address, city, country_id) VALUES (3400, '1516 Pushkin', 'Turin', 'IT');

SELECT * FROM location2;

COMMIT;



INSERT INTO location2 VALUES (3500, '1718 De Golle', '12345', INITCAP('paris'), 'Some province 1', UPPER('fr'));

INSERT INTO location2 VALUES (3600, '1718 Jules Verne', '67890', INITCAP('lion'), 'Some province 2', UPPER('fr'));

COMMIT;



SELECT * FROM LOCATIONS l WHERE LENGTH(STATE_PROVINCE) > 9;

INSERT INTO location2 (SELECT * FROM LOCATIONS l WHERE LENGTH(STATE_PROVINCE) > 9);

COMMIT;


CREATE TABLE location4europe AS (SELECT * FROM locations WHERE 1=2);

INSERT
	ALL
	WHEN 1 = 1 THEN 
INTO
	location2
VALUES (location_id,
street_address,
postal_code,
city,
state_province,
country_id)
WHEN country_id IN (
SELECT
	country_id
FROM
	COUNTRIES c
WHERE
	region_id = 1) THEN 
INTO
	location4europe (location_id,
	street_address,
	city,
	country_id)
VALUES (location_id,
street_address,
city,
country_id)  
SELECT
	*
FROM
	LOCATIONS l;

COMMIT;


SELECT * FROM location4europe;


SELECT * FROM location2;

UPDATE location2 SET postal_code = '789456'
WHERE postal_code IS NULL ;

COMMIT;

ROLLBACK;


SELECT postal_code FROM LOCATIONS l WHERE location_id = 2600;

UPDATE location2 SET postal_code = (SELECT postal_code FROM LOCATIONS l WHERE location_id = 2600) WHERE postal_code IS NULL; 

COMMIT;


DELETE FROM location2 WHERE country_id = 'IT';

SAVEPOINT s1;

UPDATE location2 SET street_address = 'Sezam st. 18'
WHERE location_id > 2500;

SAVEPOINT s2;

DELETE FROM location2 WHERE street_address = 'Sezam st. 18';


ROLLBACK TO s2;

COMMIT;

