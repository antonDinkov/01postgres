CREATE OR REPLACE PROCEDURE sp_deposit_money(
    account_id INT,
	money_amount NUMERIC(19, 4)
)
AS
$$
BEGIN
	UPDATE accounts
	SET balance = balance + money_amount
	WHERE id = account_id;

	COMMIT;
END;
$$
LANGUAGE plpgsql;

CALL sp_deposit_money(1, 200);

SELECT
	a.id,
	ah.id,
	a.balance
FROM accounts as a
join account_holders as ah
	on ah.id = a.account_holder_id
WHERE a.id = 1;