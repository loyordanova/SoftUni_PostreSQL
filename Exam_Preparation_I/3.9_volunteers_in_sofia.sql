SELECT
	name,
	phone_number,
	SUBSTRING(volunteers.address, POSITION('Sofia' in volunteers.address) + 7) AS address
FROM
	volunteers
JOIN
	volunteers_departments
ON
	volunteers.department_id = volunteers_departments.id
WHERE
	address LIKE '%Sofia%'
	AND
	volunteers_departments.department_name = 'Education program assistant'
ORDER BY
	name
