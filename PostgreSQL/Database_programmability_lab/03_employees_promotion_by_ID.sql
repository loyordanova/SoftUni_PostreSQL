CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INT)
AS
$$
BEGIN
	IF 
	(SELECT employee_id FROM employees WHERE employee_id = id) IS NULL THEN
	RETURN;
	
	ELSE
	UPDATE employees
	SET salary = salary + salary * 0.05 WHERE employee_id = id;

	END IF;
	COMMIT;
END
$$
LANGUAGE plpgsql;

-- CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(e_id INT) 
-- AS
-- $$
--   BEGIN
--     UPDATE employees
--     SET salary = salary * 1.05 WHERE employee_id = e_id;
--   END
-- $$
-- LANGUAGE plpgsql;