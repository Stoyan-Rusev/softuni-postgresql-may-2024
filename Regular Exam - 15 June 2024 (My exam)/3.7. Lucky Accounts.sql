SELECT 
	CONCAT(a.id, ' ', a.username) AS username,
	a.email
FROM
	photos AS p
JOIN 
	accounts_photos AS ap
	ON
	p.id = ap.photo_id
JOIN
	accounts AS a
	ON
	a.id = ap.account_id
WHERE
	a.id = p.id
ORDER BY
	a.id
;