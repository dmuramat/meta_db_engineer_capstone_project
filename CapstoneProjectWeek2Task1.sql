use LittleLemonDB;


DESCRIBE Orders;
DESCRIBE Bookings;
INSERT INTO CustomerDetails(CustomerID, FirstName, SecondName, Address, PhoneNumber) VALUES (1, 'Rei', 'Tanaka', 'AnAddress', '12345678890'), (2, 'Carla', 'Osian', 'ABdress', '12345678890'), (3, 'Rainer', 'Vorlaeufer', 'ACdress', '12345678890');
INSERT INTO Bookings(BookingID, BookingDate, CustomerID, TableNr) VALUES (1, '2023-12-01 19:00:00', 1, 1), (2, '2023-12-02 20:00:00', 2, 3), (3, '2023-12-02 20:00:00', 3, 1);
INSERT INTO Menus(MenuID, Name, Cuisine) VALUES (1, 'Athenai', 'Greek'), (2, 'Creta', 'Greek'), (3, 'Istanbul', 'Turkish');
INSERT INTO Orders(OrderID, MenuID, Quantity, TotalCost, OrderDate, BookingID) VALUES (1, 1, 2, 30.00, '2023-11-24', 1), (2,3,1, 20.00, '2023-11-25',2), (3,2,3,65.00,'2023-11-25',3);
INSERT INTO Orders(OrderID, MenuID, Quantity, TotalCost, OrderDate, BookingID) VALUES (4, 1, 5, 120.00, '2023-11-25', 3);


SELECT * FROM Orders;
CREATE VIEW OrdersView AS SELECT  OrderID, Quantity, TotalCost FROM Orders WHERE Quantity > 2;
SELECT * FROM OrdersView;
