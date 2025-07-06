SELECT * FROM customers;
SELECT * FROM people;

-- INSERT START
INSERT INTO customers (id, first_name, country, score)
VALUES
	(6, 'Anna', 'USA', NULL),
	(7, 'Sam', NULL, 100);

INSERT INTO customers
VALUES (8, 'Andreas', 'Germany', NULL);

INSERT INTO customers (id, first_name)
VALUES (9, 'Sahra');

INSERT INTO people(id, person_name, birth_date, phone)
SELECT id, first_name, NULL, 'Unknown' 
FROM customers;
-- INSERT END

-- UPDATE START
UPDATE customers
SET score = 0
WHERE id = 6;

UPDATE customers
SET	score = 0,
	country = 'UK'
WHERE id = 9;

UPDATE customers
SET score = 0
WHERE score IS NULL;
-- UPDATE END

-- DELETE START
SELECT * FROM customers;
SELECT * FROM people;

DELETE FROM customers
WHERE id > 5;

DELETE FROM people; -- This is slow
TRUNCATE TABLE people; -- This is faster
-- DELETE END