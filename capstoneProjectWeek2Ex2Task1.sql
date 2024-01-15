use LittleLemonDB;

-- Task 1
CREATE PROCEDURE GetMaxQuantity()
SELECT Quantity AS 'Max Quantity in Order' FROM Orders WHERE Quantity = (SELECT MAX(Quantity) FROM Orders);

CALL GetMaxQuantity();


-- Task 2
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;


-- Task 3
SELECT * FROM Orders;
INSERT INTO Orders(OrderID, MenuID, Quantity, TotalCost, OrderDate, BookingID) VALUES (10, 1, 2, 30.00, '2023-12-03 01:10:11', 5);
CREATE PROCEDURE CancelOrder(IN id INT)
DELETE FROM Orders WHERE OrderID = id;
CALL CancelOrder(10);