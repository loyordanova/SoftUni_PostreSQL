UPDATE 
	coaches
SET 
	salary = salary * coach_level
WHERE
	first_name LIKE 'C%' 
		AND
	id IN (SELECT coach_id FROM players_coaches)

-- UPDATE coaches
-- SET salary = salary * coach_level
-- WHERE id IN (
--     SELECT DISTINCT coach_id
--     FROM players_coaches
--     WHERE coach_id IS NOT NULL
-- )
-- AND first_name LIKE 'C%';