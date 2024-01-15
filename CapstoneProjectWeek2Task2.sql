use LittleLemonDB;


DESCRIBE Orders;
DESCRIBE Bookings;
INSERT INTO CustomerDetails(CustomerID, FirstName, SecondName, Address, PhoneNumber) VALUES (1, 'Rei', 'Tanaka', 'AnAddress', '12345678890'), (2, 'Carla', 'Osian', 'ABdress', '12345678890'), (3, 'Rainer', 'Vorlaeufer', 'ACdress', '12345678890');
INSERT INTO Bookings(BookingID, BookingDate, CustomerID, TableNr) VALUES (4, '2023-12-01 19:00:00', 1, 2), (5, '2023-12-02 20:00:00', 2, 2), (6, '2023-12-02 20:00:00', 3, 3);
INSERT INTO Menus(MenuID, Name, Cuisine) VALUES (1, 'Athenai', 'Greek'), (2, 'Creta', 'Greek'), (3, 'Istanbul', 'Turkish');
INSERT INTO Orders(OrderID, MenuID, Quantity, TotalCost, OrderDate, BookingID) VALUES (5, 1, 10, 150.00, '2023-12-01', 4), (6,3,11, 220.00, '2023-12-02',5), (7,2,3,65.00,'2023-12-02',6);
INSERT INTO Orders(OrderID, MenuID, Quantity, TotalCost, OrderDate, BookingID) VALUES (8, 1, 20, 300.00, '2023-12-02', 6);
INSERT INTO MenuItems(MenuItemID, MenuID, ItemName, CourseType) VALUES (1, 1, 'greek salad', 'side dish'), (2, 2, 'moussaka', 'main'), (3, 3, 'ice cream', 'dessert');


SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.SecondName) AS FullName, o.OrderID, o.TotalCost AS Cost, 
(SELECT m.Name FROM Menus AS m WHERE m.MenuID = o.MenuID) AS MenuName,
(SELECT i.ItemName FROM MenuItems AS i WHERE i.MenuID = o.MenuID) AS CourseName 
FROM CustomerDetails AS c 
INNER JOIN Bookings as b ON c.CustomerID = b.CustomerID 
INNER JOIN Orders as o ON (o.BookingID = b.BookingID AND o.TotalCost >150.00) ORDER BY o.TotalCost;
