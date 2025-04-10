-- Create index on frequently searched flight departure column
CREATE INDEX idx_flight_departure ON Flights(departure);

-- Create index on foreign key for better join performance
CREATE INDEX idx_ticket_passenger ON Tickets(passenger_id);

SHOW INDEX FROM Flights;
SHOW INDEX FROM Tickets;