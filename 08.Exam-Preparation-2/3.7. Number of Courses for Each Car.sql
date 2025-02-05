SELECT 
	car.id,
	car.make,
	car.mileage,
	COUNT(cou.id) AS count_of_courses,
	ROUND(AVG(cou.bill), 2) AS average_bill
FROM
	cars AS car
LEFT JOIN 
	courses AS cou
ON 
	car.id = cou.car_id
GROUP BY
	car.id,
	car.make,
	car.mileage
HAVING
	COUNT(cou.id) <> 2
ORDER BY 
	count_of_courses DESC,
	car.id
