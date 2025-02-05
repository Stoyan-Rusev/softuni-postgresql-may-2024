SELECT
	cr.last_name,
	CEIL(AVG(bg.rating)) AS average_rating,
	pb.name
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
JOIN
	publishers AS pb
ON 
	pb.id = bg.publisher_id
WHERE
	pb.name = 'Stonemaier Games'
GROUP BY
	cr.last_name,
	pb.name
ORDER BY
	average_rating DESC
;