-- lab2_queries.sql
-- Flight Booking System Queries
-- Includes: JOINs, UPDATE, DELETE, Aggregations, and Subqueries

-- 1. INNER JOIN: Show passengers with their ticket and flight details
SELECT 
    p.name AS passenger_name,
    p.passport_number,
    t.seat,
    f.flight_number,
    f.departure,
    f.arrival,
    f.date AS flight_date
FROM 
    Passengers p
INNER JOIN 
    Tickets t ON p.passenger_id = t.passenger_id
INNER JOIN 
    Flights f ON t.flight_id = f.flight_id
ORDER BY 
    f.date;

-- 2. LEFT JOIN: Show all flights and their ticket sales (including flights with no tickets)
SELECT 
    f.flight_number,
    f.departure,
    f.arrival,
    COUNT(t.ticket_id) AS tickets_sold,
    IFNULL(SUM(t.price), 0) AS total_revenue
FROM 
    Flights f
LEFT JOIN 
    Tickets t ON f.flight_id = t.flight_id
GROUP BY 
    f.flight_id
ORDER BY 
    f.date;

-- 3. UPDATE: Increase ticket prices by 10% for flights to London
UPDATE Tickets t
JOIN Flights f ON t.flight_id = f.flight_id
SET t.price = t.price * 1.10
WHERE f.arrival = 'London';

-- 4. DELETE: Remove all cancelled payments (status = 'Failed')
DELETE FROM Payments
WHERE status = 'Failed';

-- 5. AGGREGATION with GROUP BY and HAVING: 
-- Show flights with average ticket price above $600
SELECT 
    f.flight_number,
    f.departure,
    f.arrival,
    COUNT(t.ticket_id) AS tickets_sold,
    AVG(t.price) AS avg_ticket_price
FROM 
    Flights f
JOIN 
    Tickets t ON f.flight_id = t.flight_id
GROUP BY 
    f.flight_id
HAVING 
    AVG(t.price) > 600
ORDER BY 
    avg_ticket_price DESC;

-- 6. SUBQUERY: Find passengers who spent more than average on tickets
SELECT 
    p.name,
    p.email,
    SUM(t.price) AS total_spent
FROM 
    Passengers p
JOIN 
    Tickets t ON p.passenger_id = t.passenger_id
GROUP BY 
    p.passenger_id
HAVING 
    total_spent > (SELECT AVG(price) FROM Tickets)
ORDER BY 
    total_spent DESC;