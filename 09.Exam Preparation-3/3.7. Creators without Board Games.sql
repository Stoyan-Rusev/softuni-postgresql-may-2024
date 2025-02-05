SELECT 
	id,
	CONCAT(first_name, ' ', last_name) AS creator_name,
	email
FROM
	creators
WHERE
	id NOT IN (
		SELECT
			cr.id
		FROM
			board_games AS bg
		JOIN
			creators_board_games AS crbg
		ON
			bg.id = crbg.board_game_id
		JOIN
			creators AS cr
		ON
			cr.id = crbg.creator_id
		)
;