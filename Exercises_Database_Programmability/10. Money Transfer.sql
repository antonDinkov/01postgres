CREATE OR REPLACE PROCEDURE sp_transfer_money(
    sender_id INT,
	receiver_id INT,
	amount NUMERIC(19, 4)
)
AS
$$
DECLARE
	current_balance NUMERIC(19, 4);
BEGIN
	CALL sp_withdraw_money(sender_id, amount);

	CALL sp_deposit_money(receiver_id, amount);

	COMMIT;
END;
$$
LANGUAGE plpgsql;