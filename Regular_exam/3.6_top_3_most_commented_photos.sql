SELECT 
	p.id AS photo_id,
	p.capture_date,
	p.description,
	COUNT(c.id) AS comments_count
FROM
	photos AS p
JOIN
	comments AS c
ON 
	p.id = c.photo_id
GROUP BY
	p.id
HAVING
	p.description <> ''
ORDER BY
	COUNT(c.id) DESC,
	p.id ASC
LIMIT 3