UPDATE
	coaches
SET 
	salary = salary * coach_level
WHERE
	id IN(
		SELECT 
			c.id
		FROM 
			coaches as c
		JOIN
			players_coaches AS pc
			ON 
			c.id = pc.coach_id
		WHERE
			c.first_name LIKE 'C%' 
				AND
			pc.player_id IS NOT NULL
	)
;