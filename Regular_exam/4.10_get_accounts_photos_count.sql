CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30)) 
RETURNS INTEGER AS
$$
DECLARE
	photos_count INT;
BEGIN
	SELECT COUNT(*) INTO photos_count
	FROM photos AS p
	JOIN accounts_photos AS ap
	ON p.id = ap.photo_id
	JOIN accounts AS a
	ON a.id = ap.account_id
	WHERE a.username = account_username;
	RETURN photos_count;
END;
$$
LANGUAGE plpgsql;