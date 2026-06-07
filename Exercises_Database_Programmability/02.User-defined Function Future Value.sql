CREATE OR REPLACE FUNCTION fn_calculate_future_value(
IN initial_sum NUMERIC,
IN yearly_interest_rate NUMERIC,
IN number_of_years INT,
OUT future_value NUMERIC
)
AS
$$
	BEGIN
		future_value := TRUNC(initial_sum * POWER(1 + yearly_interest_rate, number_of_years), 4);
	END;
$$
LANGUAGE plpgsql;