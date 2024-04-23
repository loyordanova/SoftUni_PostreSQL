SELECT 
	start_point,
	end_point,
	leader_id,
	CONCAT_WS(' ', first_name, last_name) AS learder_name
	
FROM
	campers AS c
JOIN
	routes AS r
ON
	c.id = r.leader_id;


