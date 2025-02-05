SELECT
	CONCAT(cr.first_name, ' ', cr.last_name) AS full_name,
	cr.email,
	MAX(bg.rating)
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
	cr.email LIKE '%.com'
GROUP BY
	full_name,
	cr.email
ORDER BY 
	full_name
;