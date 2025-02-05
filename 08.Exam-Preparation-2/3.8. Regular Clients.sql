SSELECT 
	cl.full_name,
	COUNT(cou.id) AS count_of_cars,
	SUM(cou.bill) AS total_sum
FROM
	courses AS cou
JOIN
 	clients AS cl
ON 	
	cl.id = cou.client_id
WHERE
	cl.full_name LIKE '_a%'
GROUP BY
	cl.full_name
HAVING
	COUNT(cou.id) > 1
ORDER BY 
	cl.full_name
;
