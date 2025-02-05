SELECT
	t.id,
	t.name,
	COUNT(p.id) AS player_count,
	t.fan_base
FROM
	players AS p
RIGHT JOIN
	teams AS t
ON
	t.id = p.team_id
WHERE 
	t.fan_base > 30000
GROUP BY
	t.id
ORDER BY
	player_count DESC,
	t.fan_base DESC
;
