CREATE OR REPLACE FUNCTION fn_creator_with_board_games(
	creator_first_name VARCHAR(30)
) RETURNS INT
AS
$$
DECLARE total_amount INT;
BEGIN
	SELECT
		COUNT(cbg.board_game_id) INTO total_amount
	FROM 
		board_games AS bg
	JOIN 
		creators_board_games AS cbg
	ON
		bg.id = cbg.board_game_id
	JOIN 
		creators AS cr
	ON 	
		cr.id = cbg.creator_id
	WHERE 
		cr.first_name = creator_first_name;
RETURN total_amount;
END;
$$
LANGUAGE plpgsql;

SELECT fn_creator_with_board_games('Bruno');
SELECT fn_creator_with_board_games('Alexander');