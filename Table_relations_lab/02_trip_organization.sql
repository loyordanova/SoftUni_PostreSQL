SELECT 
	v.driver_id,
	v.vehicle_type,
	CONCAT_WS(' ', c.first_name, c.last_name) AS driver_name
FROM
	campers AS c
JOIN
	vehicles AS v
ON
	c.id = v.driver_id;

