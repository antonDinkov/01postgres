CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name VARCHAR(50))
RETURNS TABLE (total_cash NUMERIC)
AS
$$
BEGIN
    RETURN QUERY
    SELECT ROUND(SUM(t.cash), 2)
    FROM (
        SELECT
            ug.cash,
            ROW_NUMBER() OVER (ORDER BY ug.cash DESC) AS rn
        FROM users_games AS ug
        JOIN games AS g
            ON ug.game_id = g.id
        WHERE g.name = game_name
    ) AS t
    WHERE t.rn % 2 = 1;
END;
$$
LANGUAGE plpgsql;