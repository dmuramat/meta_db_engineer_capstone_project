-- Solutions to Exercise: Create SQL queries to check available bookings based on user input

use LittleLemonDB;

-- Setup
INSERT INTO CustomerDetails(CustomerID, FirstName, SecondName, Address, PhoneNumber) VALUES
(4, 'Charlotte', 'Bonchance', 'ADdress', '1234567890'),
(5, 'Gwendoline', 'Sheepbone', 'ASdress', '1234567890');

-- Task 1
INSERT INTO Bookings(BookingID, BookingDate, CustomerID, TableNr) VALUES 
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);

select * from Bookings;


-- Task 2
DELIMITER // 
CREATE PROCEDURE CheckBooking(IN BookingDateIn DATE, IN TableNumberIn INT)
BEGIN 
	SELECT (CASE 
    WHEN EXISTS(SELECT BookingID FROM Bookings WHERE (BookingDate = BookingDateIn) AND (TableNr = TableNumberIn)) 
		THEN CONCAT('Table ', TableNumberIn, ' is already booked')
	ELSE 
		CONCAT('Table ', TableNumberIn, ' is free')
    END) 
    AS 'Booking status';
END //
DELIMITER ; 

CALL CheckBooking('2022-10-10', 1);

-- Task 3
-- procedure must have three input parameters, as CustomerID must also be put in.

DELIMITER // 
CREATE PROCEDURE AddValidBooking(IN BookingDateIn DATE, IN CustomerIDIn INT, IN TableNumberIn INT)
BEGIN
	DECLARE NumberOfSimultaneousBookings INT;
    DECLARE MaxBookingID INT;
    START TRANSACTION;
    
    -- get max booking id
    SELECT MAX(BookingID) INTO MaxBookingID FROM Bookings;
    
    -- insert new booking
    -- did not put autoincrement to BookingID, so need to do it by hand:
    INSERT INTO Bookings(BookingID, BookingDate, CustomerID, TableNr) VALUES 
    (MaxBookingID + 1, BookingDateIn, CustomerIDIn, TableNumberIn);
    
    -- get number of simultaneous bookings
    SELECT COUNT(BookingID) INTO NumberOfSimultaneousBookings FROM Bookings WHERE (BookingDate = BookingDateIn) AND (TableNr = TableNumberIn);
    
    IF NumberOfSimultaneousBookings > 1 THEN 
        ROLLBACK;
		SELECT CONCAT('Table ', TableNumberIn, ' is already booked, canceled booking.') AS "Booking status";
	ELSE 
        COMMIT;
		SELECT "Booked table." AS "Booking status";
	END IF;
    
    
END //
DELIMITER ; 

DELETE FROM Bookings WHERE BookingID > 10;
CALL AddValidBooking("2022-10-13 00:00:00", 3, 1);
SELECT * FROM Bookings;


