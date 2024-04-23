CREATE VIEW continent_currency_usage AS
SELECT continent_code,
	currency_code,
	currency_usage
FROM (
    SELECT
        continent_code,
        currency_code,
        DENSE_RANK() OVER (PARTITION BY continent_code ORDER BY currency_usage DESC) AS currency_rank,
        currency_usage
    FROM (
        SELECT
            continents.continent_code,
            countries.currency_code,
            COUNT(*) AS currency_usage
        FROM
            countries
        JOIN
            continents USING (continent_code)
        GROUP BY
            continents.continent_code,
            countries.currency_code
        HAVING
            COUNT(*) > 1
    ) AS subquery
) AS ranked_currencies
WHERE
    currency_rank = 1
ORDER BY
    currency_usage DESC;