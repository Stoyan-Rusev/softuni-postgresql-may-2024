CREATE OR REPLACE FUNCTION udf_accounts_photos_count(
	accounts__username VARCHAR(30)
) RETURNS INT AS
$$
DECLARE photos_count INT;
BEGIN
	SELECT 
		COUNT(p.id) INTO photos_count
	FROM 
		accounts_photos AS ap
	JOIN 
		photos AS p
		ON
		ap.photo_id = p.id
	JOIN 
		accounts AS a
		ON
		ap.account_id = a.id
	WHERE 
		a.username = accounts__username;
	RETURN photos_count;
END;
$$
LANGUAGE plpgsql;