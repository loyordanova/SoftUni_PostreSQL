CREATE OR REPLACE PROCEDURE sp_deposit_money(
	account_id INTEGER,
	money_amount NUMERIC
) AS
$$
BEGIN
	UPDATE accounts 
	SET balance = balance + money_amount
	WHERE account_id = id;
END;
$$
LANGUAGE plpgsql;

CALL sp_deposit_money(1, 100)