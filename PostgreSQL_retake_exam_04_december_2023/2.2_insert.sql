CREATE TABLE gift_recipients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country_id INTEGER NOT NULL,
    gift_sent BOOLEAN DEFAULT 'False'
);

INSERT INTO gift_recipients (name, country_id, gift_sent)
SELECT 
	CONCAT_WS(' ', first_name, last_name) AS name, 
	country_id,
	CASE
		WHEN country_id IN (7,8,14,17,26) THEN TRUE
		ELSE FALSE
	END AS gift_sent
FROM customers;