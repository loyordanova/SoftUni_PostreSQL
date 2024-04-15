CREATE TABLE bookings_calculation
	AS
SELECT
	booked_for,
	CAST(booked_for AS NUMERIC) * 50 AS multiplication,
	CAST(booked_for AS NUMERIC) % 50 AS modulo
	
FROM bookings
WHERE 
	apartment_id = 93;