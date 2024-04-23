SELECT
	user_id,
	AGE(starts_at, booked_at) AS early_birds

FROM
	bookings
WHERE 
	starts_at - booked_At >= '10 months';