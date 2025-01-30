CREATE OR REPLACE PROCEDURE sp_transfer_money(
    sender_id INT, reciever_id INT, amount NUMERIC(4)
) AS
$$
DECLARE 
	current_balance INT;
BEGIN
	CALL sp_withdraw_money(sender_id, amount);
	CALL sp_deposit_money(reciever_id, amount);

	SELECT balance INTO current_balance FROM accounts WHERE id = sender_id;
	IF current_balance < 0 THEN
		ROLLBACK;
	END IF;
END;
$$
LANGUAGE plpgsql;

-- Using already created procedures from 08 and 09 tasks