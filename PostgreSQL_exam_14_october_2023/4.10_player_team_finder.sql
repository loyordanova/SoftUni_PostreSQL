CREATE OR REPLACE PROCEDURE sp_players_team_name(
	IN player_name VARCHAR(50),
	OUT player_team VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
	SELECT
		 t.name INTO player_team
	FROM 
		teams AS t 
	JOIN 
		players AS p 
	ON 
		t.id = p.team_id
	WHERE
		CONCAT_WS(' ', p.first_name, p.last_name) = player_name;

	IF player_team IS NULL THEN
        player_team := 'The player currently has no team';
    END IF;
END;
$$



-- CREATE OR REPLACE PROCEDURE sp_players_team_name(
--     IN player_name VARCHAR(50),
--     OUT team_name VARCHAR(45)
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     SELECT 
--         COALESCE(t."name", 'The player currently has no team') 
--     INTO 
--         team_name
--     FROM 
--         players AS p
--     LEFT JOIN 
--         teams AS t 
--         ON p.team_id = t."id"
--     WHERE 
--         CONCAT_WS(' ', p."first_name", p."last_name") = player_name;
-- END;
-- $$;