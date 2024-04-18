-- DROP TABLE mountains CASCADE;
-- DROP TABLE peaks CASCADE;

CREATE TABLE mountain (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE peaks(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INT,
	CONSTRAINT fk_mountain_id
		FOREIGN KEY (mountain_id) REFERENCES mountain (id) 
		ON DELETE CASCADE
);
