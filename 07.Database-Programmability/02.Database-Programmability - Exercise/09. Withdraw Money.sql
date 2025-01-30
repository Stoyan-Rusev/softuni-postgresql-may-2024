CREATE OR REPLACE PROCEDURE sp_withdraw_money(
	account_id INTEGER,
	money_amount NUMERIC(4)
) AS
$$
DECLARE 
	current_amount NUMERIC;
BEGIN
	current_amount := (SELECT balance FROM accounts WHERE id = account_id);
	IF money_amount <= current_amount THEN
		UPDATE 
			accounts
		SET 
			balance = balance - money_amount
		WHERE
			id = account_id;
	ELSE 
		RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
	END IF;
END;
$$
LANGUAGE plpgsql;

-- SELECT balance FROM accounts WHERE id = 1;
-- CALL sp_withdraw_money(1, 1000);