CREATE OR REPLACE FUNCTION fn_difficulty_level(level INTEGER)
RETURNS VARCHAR AS
$$
DECLARE
	difficulty_level TEXT;
BEGIN
	IF level <= 40 THEN 
	difficulty_level := 'Normal Difficulty';

	ELSIF level > 40 AND level < 61 THEN 
	difficulty_level := 'Nightmare Difficulty';

	ELSE 
	difficulty_level := 'Hell Difficulty';
	
	END IF;

	RETURN difficulty_level;
END
$$
LANGUAGE plpgsql;

SELECT 
	user_id,
	level,
	cash,
	fn_difficulty_level(level) as difficulty_level
FROM 
	users_games
ORDER BY 
	user_id ASC;