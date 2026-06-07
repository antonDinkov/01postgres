CREATE OR REPLACE FUNCTION fn_full_name(IN first_name VARCHAR(20), IN last_name VARCHAR(20), OUT full_name VARCHAR(40))
AS
$$
	BEGIN
		SELECT CONCAT(INITCAP(first_name), ' ', INITCAP(last_name)) INTO full_name;
	END;
$$
LANGUAGE plpgsql;

-- ИЛИ

CREATE OR REPLACE FUNCTION fn_full_name(IN first_name VARCHAR(20), IN last_name VARCHAR(20), OUT full_name VARCHAR(40))
AS
$$
	BEGIN
		full_name := CONCAT(INITCAP(first_name), ' ', INITCAP(last_name));
	END;
$$
LANGUAGE plpgsql;

SELECT
	fn_full_name(e.first_name, e.last_name) AS "Output"
FROM employees AS e;