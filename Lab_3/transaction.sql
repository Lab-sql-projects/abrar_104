START TRANSACTION;

-- Insert new passenger
INSERT INTO Passengers (passenger_id, name, email, phone, passport_number)
VALUES (100, 'New Passenger', 'new@email.com', '+123456789', 'N12345678');

-- View the new passenger
SELECT * FROM Passengers WHERE passenger_id = 100;

-- Book a ticket
INSERT INTO Tickets (ticket_id, passenger_id, flight_id, seat, price)
VALUES (1000, 100, 1, 'A10', 500.00);

-- View the new ticket
SELECT * FROM Tickets WHERE ticket_id = 1000;

-- Make payment
INSERT INTO Payments (payment_id, ticket_id, amount, status)
VALUES (1000, 1000, 500.00, 'Completed');

-- View the new payment
SELECT * FROM Payments WHERE payment_id = 1000;

-- Verify all changes together
SELECT 
    p.passenger_id, p.name, 
    t.ticket_id, t.seat, t.price,
    py.amount, py.status
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Payments py ON t.ticket_id = py.ticket_id
WHERE p.passenger_id = 100;

-- Test the transaction (uncomment one):
 COMMIT; -- To save changes
-- ROLLBACK; -- To undo changes