-- Find passengers who spent more than average on tickets for flights to London
SELECT p.name, p.email, SUM(t.price) AS total_spent
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id
WHERE f.arrival = 'London'
GROUP BY p.passenger_id
HAVING total_spent > (
    SELECT AVG(t2.price)
    FROM Tickets t2
    JOIN Flights f2 ON t2.flight_id = f2.flight_id
    WHERE f2.arrival = 'London'
)
ORDER BY total_spent DESC;