SELECT MIN(average_area)
FROM(
	SELECT
	AVG(area_in_sq_km) AS average_area
	FROM countries 
	GROUP BY continent_code) 
AS average
