-- FIRST WAY:
-- Adding the constraint additionally

CREATE TABLE mountains(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

ALTER TABLE peaks
ADD COLUMN 
	mountain_id INT;

ALTER TABLE peaks
ADD CONSTRAINT fk_peaks_mountains
	FOREIGN KEY (mountain_id)
		REFERENCES mountains(id)
;

SELECT * FROM peaks;

-- ----------------------------------------------

-- SECOND WAY:
-- Adding constraint while building

-- CREATE TABLE peaks(
-- 	id SERIAL PRIMARY KEY,
-- 	name VARCHAR(50)
--  mountain_id INT REFERENCES mountains(id)
-- );

-- ----------------------------------------------

-- THIRD WAY:
-- Adding constraint with a name while building

-- CREATE TABLE peaks(
-- 	id SERIAL PRIMARY KEY,
-- 	name VARCHAR(50)
--     mountain_id INT,
--     CONSTRAINT fk_peaks_mountains
--         FOREIGN KEY (mountain_id)
--             REFERENCES mountains(id)
-- );