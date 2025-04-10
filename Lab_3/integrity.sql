-- Add NOT NULL constraint to passenger name
ALTER TABLE Passengers 
MODIFY name VARCHAR(100) NOT NULL;

-- Add CHECK constraint to ensure valid ticket prices
ALTER TABLE Tickets
ADD CONSTRAINT chk_price CHECK (price > 0);

-- Add UNIQUE constraint to flight numbers
ALTER TABLE Flights
ADD CONSTRAINT uniq_flight_number UNIQUE (flight_number);

SHOW CREATE TABLE Passangers;
SHOW CREATE TABLE Tickets;
SHOW CREATE TABLE Flights;

