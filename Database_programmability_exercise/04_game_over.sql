
CREATE OR REPLACE FUNCTION fn_is_game_over(is_game_over BOOLEAN)
RETURNS TABLE(
	name VARCHAR,
	game_type_id INTEGER,
	is_finished BOOLEAN)
AS
$$
BEGIN
	RETURN QUERY
		SELECT 
			g.name,
			g.game_type_id,
			g.is_finished
		FROM 
			games AS g
		WHERE g.is_finished = is_game_over;
END
$$
LANGUAGE plpgsql;

SELECT name, game_type_id, is_finished FROM fn_is_game_over(true)