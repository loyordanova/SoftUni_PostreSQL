SELECT
	CASE 
		WHEN age > 0 AND age <= 10 THEN '[1-10]'
        WHEN age > 10 AND age <= 20 THEN '[11-20]'
        WHEN age > 20 AND age <= 30 THEN '[21-30]'
        WHEN age > 30 AND age <= 40 THEN '[31-40]'
        WHEN age > 40 AND age <= 50 THEN '[41-50]'
        WHEN age > 50 AND age <= 60 THEN '[51-60]'
		ELSE '[61+]'
	END AS age_group,
	COUNT(*)
FROM 
    wizard_deposits
GROUP BY 
	age_group
ORDER BY 
	age_group
