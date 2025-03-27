-- queries.sql
USE flight_booking;

-- 1. Show all flights
SELECT * FROM Flights;

-- 2. Show passengers on Flight FL101
SELECT p.name, p.passport_number 
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id
WHERE f.flight_number = 'FL101';

-- 3. Show total payments received
SELECT SUM(amount) AS total_revenue FROM Payments WHERE status = 'Completed';

-- 4. Sort flights by date (earliest first)
SELECT * FROM Flights ORDER BY date ASC;

-- 5. Limit to 2 flights
SELECT * FROM Flights LIMIT 2;