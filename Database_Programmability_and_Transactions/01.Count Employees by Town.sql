CREATE OR REPLACE FUNCTION fn_count_employees_by_town(IN town_name VARCHAR(20), OUT count_employees INT)
AS
$$
	BEGIN
		SELECT
			COUNT(*)
		INTO count_employees
		FROM employees AS e
		JOIN addresses AS a
			USING(address_id)
		JOIN towns AS t
			USING(town_id)
		WHERE t.name = town_name;
	END;
$$
LANGUAGE plpgsql;