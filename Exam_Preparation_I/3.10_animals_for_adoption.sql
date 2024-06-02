SELECT	
	a.name,
	EXTRACT(YEAR FROM a.birthdate) AS birth_year,
	at.animal_type
FROM
	animals AS a
JOIN	
	animal_types AS at
ON 
	at.id = a.animal_type_id
WHERE
	a.owner_id IS NULL
AND 
	EXTRACT(YEAR FROM a.birthdate) BETWEEN 2017 AND 2022
AND 
	at.animal_type <> 'Birds'
ORDER BY
	a.name
	

	