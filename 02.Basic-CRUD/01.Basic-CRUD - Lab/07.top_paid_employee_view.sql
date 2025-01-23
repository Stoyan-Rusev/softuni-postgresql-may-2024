CREATE VIEW most_paid AS
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1
;

SELECT * FROM most_paid
;