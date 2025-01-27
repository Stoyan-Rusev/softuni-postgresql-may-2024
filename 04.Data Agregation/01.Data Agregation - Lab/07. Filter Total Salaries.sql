SELECT 
	department_id,
	SUM(salary)
FROM 
	employees
WHERE 
	salary IS NOT NULL
GROUP BY 
	department_id
HAVING 
	SUM(salary) < 4200
ORDER BY 
	department_id
;
