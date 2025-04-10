-- Create a read-only role
CREATE ROLE read_only;

-- Grant SELECT on view and tables
GRANT SELECT ON passenger_public_info TO read_only;
GRANT SELECT ON Flights TO read_only;

-- Create a user and assign role
CREATE USER 'reporter'@'localhost' IDENTIFIED BY 'securepassword';
GRANT read_only TO 'reporter'@'localhost';
SET DEFAULT ROLE 'read_only' TO 'reporter'@'localhost';


SHOW GRANTS FOR 'reporter'@'localhost';