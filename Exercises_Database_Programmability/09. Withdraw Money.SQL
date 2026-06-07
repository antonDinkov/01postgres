CREATE OR REPLACE PROCEDURE sp_withdraw_money(
    account_id INT,
	money_amount NUMERIC(19, 4)
)
AS
$$
DECLARE
	current_balance NUMERIC(19, 4);
BEGIN
	SELECT balance FROM accounts WHERE id = account_id INTO current_balance;
	IF current_balance < money_amount THEN RAISE NOTICE 'Insufficient balance!';
	ELSE
	UPDATE accounts
	SET balance = balance - money_amount
	WHERE id = account_id;

	COMMIT;
	END IF;
END;
$$
LANGUAGE plpgsql;