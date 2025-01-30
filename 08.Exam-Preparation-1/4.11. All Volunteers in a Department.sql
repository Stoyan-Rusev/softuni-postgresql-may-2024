CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department varchar(30))
RETURNS INT
AS
$$
DECLARE volunteers_count INT;
BEGIN
	SELECT  
		COUNT(*) 
	INTO 
		volunteers_count
	FROM 
		volunteers
	WHERE 
		department_id = (
			SELECT
				id
			FROM
				volunteers_departments
			WHERE
				department_name = searched_volunteers_department
	);
	RETURN volunteers_count;
END;
$$
LANGUAGE plpgsql;