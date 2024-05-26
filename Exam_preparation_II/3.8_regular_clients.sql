SELECT
	cl.full_name,
	COUNT(cou.car_id) AS count_of_cars,
	SUM(cou.bill) AS total_sum
FROM
	clients AS cl
JOIN 
	courses AS cou
ON 
	cl.id = cou.client_id
GROUP BY
	cl.full_name
HAVING
	COUNT(cou.car_id) > 1
		AND
	SUBSTRING(full_name, 2, 1) = 'a'
ORDER BY 
	full_name

