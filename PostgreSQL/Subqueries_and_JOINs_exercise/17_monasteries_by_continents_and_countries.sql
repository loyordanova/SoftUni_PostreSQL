UPDATE 
    countries 
SET 
    country_name = 'Burma'
WHERE 
    country_name = 'Myanmar';
	
INSERT INTO monasteries (monastery_name, country_code)
VALUES 
    ('Hanga Abbey', 'TZ');
  
SELECT 
  con.continent_name AS "Continent Name",
  cou.country_name AS "Country Name",
  COUNT(m.monastery_name) AS "Monasteries Count"
FROM 
    countries AS cou
LEFT JOIN 
    continents AS con 
USING (continent_code)
LEFT JOIN 
    monasteries AS m USING (country_code)
WHERE three_rivers = FALSE OR three_rivers IS NULL
GROUP BY 
    country_name, continent_name
ORDER BY 
    "Monasteries Count" DESC, 
    "Country Name" ASC;



"country_code" - column should be exactly two characters long. 
... add a new row to the "monasteries" table with 'Hanga Abbey' as the name and 'Tanzania' as the country code ...

Another row should also be inserted into the "monasteries" table with 'Myin-Tin-Daik' as the name and 'Myanmar' as the country code. - this should be ignored!