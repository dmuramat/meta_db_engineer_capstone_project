-- Solutions to Exercise: Create SQL queries to add and update bookings

use LittleLemonDB;

-- create procedure to add a booking. Booking does not che ck validity, as in the previous exercise 
-- with procedure `AddValidBooking'
DELIMITER //
CREATE PROCEDURE AddBooking(IN BookingIDIn INT, IN CustomerIDIn INT, IN BookingDateIN DATE, IN TableNrIn INT)
BEGIN
	INSERT INTO Bookings(BookingID, BookingDate, CustomerID, TableNr) VALUES (BookingIDIn, BookingDateIn, CustomerIDIn, TableNrIn);
	SELECT "New booking added" AS Confirmation;
END //
DELIMITER ;

-- check procedure:
SELECT * FROM Bookings;
CALL AddBooking(12, 4, '2022-11-14', 2);
SELECT * FROM Bookings;


-- create procedure to update booking
-- this procedure also does not check whether booking is valid.
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BookingIDIn INT, IN CustomerIDIn INT, IN BookingDateIN DATE, IN TableNrIn INT)
BEGIN
	UPDATE Bookings SET CustomerID = CustomerIDIn, BookingDate = BookingDateIn, TableNr = TableNrIn WHERE BookingID = BookingIDIn;
	SELECT CONCAT("Booking ", BookingIdIn, " updated") AS Confirmation;
END//
DELIMITER ;

-- check procedure:
SELECT * FROM Bookings;
CALL UpdateBooking(12, 4, '2022-11-14', 3);
SELECT * FROM Bookings;


-- create procedure to cancel booking
DELIMITER // 
CREATE PROCEDURE CancelBooking(IN BookingIdIn INT)
BEGIN
	DELETE FROM Bookings WHERE BookingID = BookingIdIn;
    SELECT CONCAT("Booking ", BookingIdIn, " is canceled");
END//
DELIMITER ;

-- check procedure:
SELECT * FROM Bookings;
CALL CancelBooking(12);
SELECT * FROM Bookings;
