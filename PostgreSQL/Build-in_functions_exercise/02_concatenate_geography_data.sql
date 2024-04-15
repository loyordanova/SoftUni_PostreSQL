CREATE VIEW view_continents_countries_currencies_details AS
SELECT 
    CONCAT(c.continent_name, ': ', c.continent_code) AS continent_details,
    CONCAT(ct.country_name, ' - ', ct.capital, ' - ', ct.area_in_sq_km, ' - ', 'km2') AS country_information,
    CONCAT(cur.description, ' (', cur.currency_code, ')') AS currencies
FROM 
    continents AS c
JOIN 
    countries AS ct ON c.continent_code = ct.continent_code
JOIN 
    currencies AS cur ON ct.currency_code = cur.currency_code
ORDER BY 
    country_information ASC, 
    currencies ASC;
