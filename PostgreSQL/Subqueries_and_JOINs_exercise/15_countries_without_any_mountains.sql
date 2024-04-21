SELECT COUNT(*) AS countries_without_mountains
FROM(
	SELECT *
 	FROM countries
	LEFT JOIN mountains_countries
	USING(country_code)
	) AS without_mountains
WHERE mountain_id IS NULL

-- SELECT
-- 	COUNT(*) AS countries_without_mountains
-- FROM 
-- 	countries AS c
-- LEFT JOIN 
-- 	mountains_countries AS mc
-- USING 
-- 	(country_code)
-- WHERE
-- 	mc.mountain_id IS NULL;