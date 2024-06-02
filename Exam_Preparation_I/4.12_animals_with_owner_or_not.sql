
CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
	IN animal_name VARCHAR(30),
	OUT result VARCHAR(50)
)
LANGUAGE plpgsql
AS
$$
BEGIN
	SELECT
		CASE
			WHEN a.owner_id IS NULL THEN 'For adoption'
			ELSE o.name 
		END INTO result
	FROM
		animals AS a 
	LEFT JOIN 	
		owners AS o 
	ON
		a.owner_id = o.id
	WHERE
		a.name = animal_name;
END;
$$;