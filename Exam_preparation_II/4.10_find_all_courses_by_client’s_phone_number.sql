CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT AS
$$
DECLARE
	number_of_courses INT;
BEGIN
	SELECT COUNT(*) INTO number_of_courses
	FROM courses
	JOIN clients
	ON courses.client_id = clients.id
	WHERE clients.phone_number = phone_num;
	RETURN number_of_courses;
END;
$$
LANGUAGE plpgsql;