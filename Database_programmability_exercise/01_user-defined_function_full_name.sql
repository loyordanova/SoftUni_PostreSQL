CREATE OR REPLACE FUNCTION fn_full_name (
	first_name VARCHAR(50),
	last_name VARCHAR(50)
) RETURNS VARCHAR(101) 
AS
$$
DECLARE 
	full_name VARCHAR(101);
BEGIN
	full_name := INITCAP(first_name) || ' ' || INITCAP(last_name);
	RETURN full_name;
END;
$$
LANGUAGE plpgsql;


-- CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
-- RETURNS VARCHAR AS
-- $$
-- BEGIN
-- 	IF first_name IS NULL AND last_name IS NULL THEN
-- 		RETURN NULL;
-- 	END IF;

-- 	IF first_name IS NULL THEN
-- 		RETURN UPPER(last_name);
-- 	END IF;

-- 	IF last_name IS NULL THEN
-- 		RETURN UPPER(first_name);
-- 	END IF;

-- 	RETURN INITCAP(CONCAT_WS(' ', first_name, last_name));
	
-- END
-- $$
-- LANGUAGE plpgsql;