SELECT
	last_name as "Last Name",
	TO_CHAR(born, 'DD (Dy) Mon YYYY') as "Date of Birth"
FROM authors
;