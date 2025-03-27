-- insert.sql
USE flight_booking;

-- Insert Passengers
INSERT INTO Passengers (name, email, phone, passport_number) VALUES
('Alice Smith', 'alice@example.com', '+123456789', 'A12345678'),
('Bob Johnson', 'bob@example.com', '+987654321', 'B87654321'),
('Charlie Brown', 'charlie@example.com', '+112233445', 'C11223344');

-- Insert Flights
INSERT INTO Flights (flight_number, departure, arrival, date, capacity) VALUES
('FL101', 'New York', 'London', '2023-12-01 08:00:00', 200),
('FL202', 'Tokyo', 'Sydney', '2023-12-02 10:30:00', 150),
('FL303', 'Paris', 'Berlin', '2023-12-03 14:15:00', 180);

-- Insert Tickets
INSERT INTO Tickets (passenger_id, flight_id, seat, price) VALUES
(1, 1, 'A1', 500.00),
(2, 2, 'B3', 750.00),
(3, 3, 'C2', 600.00);

-- Insert Payments
INSERT INTO Payments (ticket_id, amount, status) VALUES
(1, 500.00, 'Completed'),
(2, 750.00, 'Pending'),
(3, 600.00, 'Completed');