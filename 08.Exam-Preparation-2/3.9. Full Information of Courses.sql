SELECT 
	ad."name" AS address,
	CASE
        WHEN EXTRACT(HOUR FROM cou.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
	cou.bill,
	cl.full_name,
	car.make,
	car.model,
	cat.name
FROM
	clients AS cl
JOIN
	courses AS cou
ON
	cou.client_id = cl.id
JOIN
	cars AS car
ON 
	cou.car_id = car.id
JOIN 
	addresses AS ad
ON 
	cou.from_address_id = ad.id
JOIN 
	categories AS cat
ON 
	car.category_id = cat.id
;