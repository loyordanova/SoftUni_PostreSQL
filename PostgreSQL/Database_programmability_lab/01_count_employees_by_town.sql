CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR) 
RETURNS INT AS
$$
	DECLARE 
		city_count INT;
	BEGIN
		SELECT COUNT(*) INTO city_count
		FROM employees AS e
		JOIN addresses USING(address_id)
		JOIN towns AS t USING(town_id)
		WHERE t.name = town_name;
		RETURN city_count;
	END;
$$
LANGUAGE plpgsql;

