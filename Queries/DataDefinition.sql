CREATE TABLE people (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,
	CONSTRAINT pk_people PRIMARY KEY(id),
);

ALTER TABLE people
ADD email VARCHAR(50) NOT NULL;

ALTER TABLE people
DROP COLUMN phone;

DROP TABLE people;