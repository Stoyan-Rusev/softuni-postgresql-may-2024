SELECT 
	v.name,
	v.phone_number,
	TRIM(
        CASE 
            WHEN address LIKE '%Sofia,%' THEN REPLACE(address, 'Sofia,', '')
            WHEN address LIKE '%Sofia ,%' THEN REPLACE(address, 'Sofia ,', '')
            ELSE address
        END
    ) AS address
FROM 
	volunteers AS v
JOIN
	volunteers_departments AS vd
ON
	vd.id = v.department_id
WHERE 
	v.address LIKE '%Sofia%'
	AND
	vd.department_name = 'Education program assistant'
ORDER BY
	v.name
;