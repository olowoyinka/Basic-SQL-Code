##Create a table  
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
);

##Adding a Row to the table created
INSERT INTO flights(origin, destination, duration) VALUES ('New York', 'London', '414');

##Accessin all row 
SELECT * FROM flights;

##Accessin only two column
SELECT origin, destination FROM flights;

##Accessin all row but wit an Id
SELECT * FROM flights WHERE id = 3;

##Accessin all row but wit an origin
SELECT * FROM flights WHERE origin = 'New York';

##Accessin all row but wit an duration and equality
SELECT * FROM flights WHERE duration > 500;

##Accessin all row but
SELECT * FROM flights WHERE destination = 'london' AND duration > 500;

##Accessin all row but
SELECT * FROM flights WHERE destination = 'london' OR duration > 500; 

##Average length of duration column
SELECT AVG(duration) FROM flights;

##Average length of duration column
SELECT MIN(duration) FROM flights;

##Average length of duration column
SELECT AVG(duration) FROM flights WHERE origin = 'New York';

##Count column
SELECT COUNT(*) FROM flights

##Count column
SELECT COUNT(*) FROM flights WHERE origin = 'New York';

##Usin IN
SELECT * FROM flights WHERE origin IN ('New York', 'Lima');

##Usin IN
SELECT * FROM flights WHERE origin LIKE '%a%';




##UPDATE
UPDATE flights SET duration = 430 WHERE origin = 'New York' AND destination = 'London';

##DELETE
DELETE FROM flights WHERE destination  'Tokyo';

##Limit
SELECT * FROM flights LiMIT 2;

##Order
SELECT * FROM flights ORDER BY duration ASC;

##Order
SELECT * FROM flights ORDER BY duration DSC;

##Order and limit 
SELECT * FROM flights ORDER BY duration ASC LIMIT 3;


##
SELECT origin, COUNT(*) FROM flights GROUP BY origin;

##
SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1;


#Foreign Key
CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights 
);


SELECT origin, destination, name FROM flights JOIN passengers ON passengers.flight_id = flights.id;

SELECT origin, destination, name FROM flights JOIN passengers ON passengers.flight_id = flights.id WHERE name = 'Alice';

SELECT origin, destination, name FROM flights LEFT JOIN passengers ON passengers.flight_id = flights.id;

SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1;

SELECT * FROM flights WHERE id IN (SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1;);





