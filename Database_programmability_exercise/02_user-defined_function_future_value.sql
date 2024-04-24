 CREATE OR REPLACE FUNCTION fn_calculate_future_value (
	initial_sum INT, 
	yearly_interest_rate DECIMAL, 
	number_of_years INT)
RETURNS DECIMAL AS
$$
DECLARE 
	result DECIMAL;
BEGIN
	result := initial_sum * POWER((1 + yearly_interest_rate), number_of_years);
	result := TRUNC(result, 4);
	RETURN result;
END
$$
LANGUAGE plpgsql;