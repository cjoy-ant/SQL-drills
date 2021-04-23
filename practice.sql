-- 1) Get all restaurants
SELECT * FROM restaurants;

-- 2) Get Italian restaurants
SELECT * FROM restaurants
WHERE cuisine='Italian';

-- 3) Get 10 Italian restaurants, subset of fields
SELECT id, name
FROM restaurants
WHERE cuisine='Italian'
LIMIT 10;

-- 4) Count of Thai restaurants
SELECT COUNT(*)
FROM restaurants
WHERE cuisine='Thai';

-- 5) Count of restaurants
SELECT COUNT(*)
FROM restaurants;

-- 6) Count of Thai restaurants in zip code
SELECT COUNT(*)
FROM restaurants
WHERE cuisine='Thai'
AND address_zipcode='11372';

-- 7) Italian restaurants in one of several zip codes
SELECT id, name
FROM restaurants
WHERE cuisine='Italian'
AND (address_zipcode='10012'
OR address_zipcode='10013'
OR address_zipcode='10014')
ORDER BY name
LIMIT 5;

-- 8) Create a restaurant
-- name: 'Byte Cafe',
-- borough: 'Brooklyn',
-- cuisine: 'coffee',
-- address_building_number: '123',
-- address_street: 'Atlantic Avenue',
-- address_zipcode: '11231'

INSERT INTO restaurants (name, borough, cuisine, address_building_number, address_street, address_zipcode)
VALUES ('Byte Cafe', 'Brooklyn', 'coffee', '123', 'Atlantic Avenue', '11231');

-- 9) Create a restaurant and return id and name
INSERT INTO restaurants (name, borough, cuisine, address_building_number, address_street, address_zipcode)
VALUES ('Test', 'Manhattan', 'Test', '123', 'Test Street', '10014')
RETURNING id, name;

-- 10) Create 3 restaurants and return id and name
INSERT INTO restaurants (name, borough, cuisine, address_building_number, address_street, address_zipcode)
VALUES 
('Test 1', 'Manhattan', 'Test', '123', 'Test Street', '10014'),
('Test 2', 'Manhattan', 'Test', '123', 'Test Street', '10014'),
('Test 3', 'Manhattan', 'Test', '123', 'Test Street', '10014')
RETURNING id, name;

-- 11) Update a record
UPDATE restaurants
SET name = 'DJ Reynolds Pub and Restaurant'
WHERE nyc_restaurant_id='30191841';

-- 12) Delete by id
DELETE from grades
WHERE id='10';

-- 13) A blocked delete
DELETE from restaurants
WHERE id='22';

--ERROR:  update or delete on table "restaurants" violates foreign key constraint "grades_restaurant_id_fkey" on table "grades"
--DETAIL:  Key (id)=(22) is still referenced from table "grades".

-- 14) Create a table
CREATE TYPE borough AS ENUM (
  'Bronx', 'Brooklyn', 'Manhattan', 'Queens', 'Staten Island'
);

CREATE TABLE inspectors (
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  borough borough
);

-- 15) Update a table
ALTER TABLE grades
ADD notes TEXT
;

-- 16) Drop a table
DROP TABLE inspectors;