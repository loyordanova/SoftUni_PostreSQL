SELECT
	ca.id AS car_id,
	ca.make,
	ca.mileage,
	COUNT(co.car_id) AS count_of_courses,
	ROUND(AVG(co.bill), 2)
FROM
	cars AS ca
LEFT JOIN
	courses AS co
ON 
	ca.id = co.car_id
GROUP BY 
	ca.id,
	ca.make,
	ca.mileage
HAVING 
	COUNT(*) <> 2
ORDER BY
	count_of_courses DESC,
	ca.id