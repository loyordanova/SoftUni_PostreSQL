CREATE OR REPLACE PROCEDURE sp_withdraw_money(
	account_id INTEGER,
	money_amount NUMERIC
)AS
$$
DECLARE
	current_balance NUMERIC;
BEGIN
	SELECT balance INTO current_balance
	FROM accounts
	WHERE id = account_id;
	
	IF current_balance < money_amount THEN
	RAISE NOTICE 'Insufficient balance to withdraw %.4f', money_amount;
	RETURN;

	ELSE
	UPDATE accounts
	SET balance = balance - money_amount
	WHERE id = account_id;
	COMMIT;
	
	END IF;
END;
$$
LANGUAGE plpgsql;

CALL sp_withdraw_money(1, 10000)