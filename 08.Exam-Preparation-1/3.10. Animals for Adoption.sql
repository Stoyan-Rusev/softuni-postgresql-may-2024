SELECT
	a.name,
	EXTRACT(YEAR FROM a.birthdate) AS birth_date,
	at.animal_type
FROM
	animals AS a
JOIN 
	animal_types AS at
ON
	a.animal_type_id = at.id
WHERE 
	at.animal_type <> 'Birds'
	AND
	a.birthdate >= '01/01/2017'
	AND
	a.owner_id IS NULL
ORDER BY
	a.name
;