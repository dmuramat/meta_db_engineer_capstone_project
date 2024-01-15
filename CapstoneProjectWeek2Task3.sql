use LittleLemonDB;

SELECT o.Quantity, m.Name FROM Orders AS o INNER JOIN Menus AS m ON (o.MenuID = m.MenuID AND o.Quantity > 2);

-- without quantity:
SELECT m.Name FROM Orders AS o INNER JOIN Menus AS m ON (o.MenuID = m.MenuID AND o.Quantity > 2);