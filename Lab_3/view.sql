-- Creates a view that shows passenger info without sensitive data
CREATE VIEW passenger_public_info AS
SELECT passenger_id, name, phone 
FROM Passengers;

SELECT * FROM passenger_public_info;
-- Should show only passenger_id, name, phone (no email or passport)