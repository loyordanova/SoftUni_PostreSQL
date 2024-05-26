
CREATE TABLE search_results(
	id SERIAL PRIMARY KEY,
	address_name VARCHAR(50),
	full_name VARCHAR(100),
	level_of_bill VARCHAR(20),
	make VARCHAR(30),
	condition CHAR(1),
	category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
	IN address_name VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN
	TRUNCATE TABLE search_results;
	INSERT INTO search_results(
		address_name,
		full_name,
		level_of_bill,
		make,
		condition,
		category_name
	)
	SELECT
		addresses.name,
		clients.full_name,
		CASE
			WHEN courses.bill <= 20 THEN 'Low'
			WHEN courses.bill <= 30 THEN 'Medium'
			ELSE 'High'
		END,
		cars.make,
		cars.condition,
		categories.name
	FROM 
		courses
	JOIN
		clients
	ON 
		courses.client_id = clients.id 
	JOIN 
		addresses
	ON
		courses.from_address_id = addresses.id
	JOIN 
		cars
	ON
		cars.id = courses.car_id
	JOIN
		categories
	ON
		categories.id = cars.category_id
	WHERE 
		addresses.name = address_name
	ORDER BY
		cars.make,
		clients.full_name;
END;
$$;
