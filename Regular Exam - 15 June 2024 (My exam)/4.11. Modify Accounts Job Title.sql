CREATE OR REPLACE PROCEDURE udp_modify_account(
	address_street VARCHAR(30), 
	address_town VARCHAR(30)
) AS
$$
BEGIN
	UPDATE
		accounts
	SET
		job_title = CONCAT('(Remote) ', job_title)
	WHERE
		id IN(
			SELECT
				acc.id
			FROM
				addresses AS ad
			JOIN 
				accounts AS acc
			ON 
				acc.id = ad.account_id
			WHERE
				ad.street = address_street
				AND
				ad.town = address_town
		);
END;
$$
LANGUAGE plpgsql;