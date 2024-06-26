CREATE OR REPLACE PROCEDURE sp_transfer_money(
	sender_id INTEGER,
	receiver_id INTEGER,
	amount NUMERIC(10,4)
)AS
$$
DECLARE
	current_balance NUMERIC;
BEGIN
	CALL sp_withdraw_money(sender_id, amount);
	CALL sp_deposit_money(receiver_id, amount);

	SELECT balance INTO current_balance FROM accounts WHERE sender_id = id;

	IF current_balance < 0 THEN
	ROLLBACK;

    END IF;
END
$$
LANGUAGE plpgsql;