CREATE OR REPLACE FUNCTION fn_creator_with_board_games(creator_name VARCHAR(30)) 
RETURNS INT AS
$$
DECLARE 
	total_number INT;
BEGIN
	SELECT COUNT(*) INTO total_number
	FROM board_games AS bg
	JOIN creators_board_games AS cbg
	ON bg.id=cbg.board_game_id
	JOIN creators AS c 
	ON cbg.creator_id=c.id 
	WHERE c.first_name = creator_name;
	RETURN total_number;
END;
$$
LANGUAGE plpgsql;