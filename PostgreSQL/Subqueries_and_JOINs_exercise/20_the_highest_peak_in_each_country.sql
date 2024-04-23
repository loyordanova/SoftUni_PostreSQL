SELECT 
    country_name,
    highest_peak_name,
    highest_peak_elevation,
    mountain
FROM (
    SELECT 
        c.country_name,
        CASE 
          WHEN m.mountain_range IS NOT NULL AND p.peak_name IS NOT NULL AND p.elevation IS NOT NULL THEN p.peak_name 
          ELSE '(no highest peak)'
        END
        AS highest_peak_name,
        CASE 
          WHEN m.mountain_range IS NOT NULL AND p.peak_name IS NOT NULL AND p.elevation IS NOT NULL THEN p.elevation 
          ELSE 0
        END
        AS highest_peak_elevation,
        CASE 
          WHEN m.mountain_range IS NOT NULL AND p.peak_name IS NOT NULL AND p.elevation IS NOT NULL THEN m.mountain_range 
          ELSE '(no mountain)'
        END
        AS mountain,
        DENSE_RANK() OVER (PARTITION BY c.country_name ORDER BY p.elevation DESC) AS rank_within_country
    FROM  countries AS c
    LEFT JOIN mountains_countries AS mC ON  c.country_code = mc.country_code
    LEFT JOIN mountains AS m ON m.id = mc.mountain_id
    LEFT JOIN peaks AS p ON m.id = p.mountain_id
) AS ranked_peaks
WHERE rank_within_country = 1
ORDER BY country_name;