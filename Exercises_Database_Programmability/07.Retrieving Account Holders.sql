CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(
    searched_balance NUMERIC
)
AS
$$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT
            ah.first_name,
            ah.last_name,
            SUM(a.balance) AS total_balance
        FROM account_holders AS ah
        JOIN accounts AS a
            ON ah.id = a.account_holder_id
        GROUP BY ah.id, ah.first_name, ah.last_name
        HAVING SUM(a.balance) > searched_balance
        ORDER BY ah.first_name, ah.last_name
    LOOP
        RAISE NOTICE '% % - %',
            rec.first_name,
            rec.last_name,
            rec.total_balance;
    END LOOP;
END;
$$
LANGUAGE plpgsql;