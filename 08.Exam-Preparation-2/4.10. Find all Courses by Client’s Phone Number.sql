CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
AS
$$
DECLARE 
    courses_count INT := 0;
BEGIN
    SELECT 
        COUNT(cou.id) 
    INTO 
        courses_count
    FROM 
        clients AS cl
    JOIN 
        courses AS cou
    ON 
        cl.id = cou.client_id
    WHERE 
        cl.phone_number = phone_num;
        
    RETURN courses_count;
END;
$$
LANGUAGE plpgsql;