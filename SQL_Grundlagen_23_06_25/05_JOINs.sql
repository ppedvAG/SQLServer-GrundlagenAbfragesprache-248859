USE Northwind

SELECT * FROM Customers
SELECT * FROM Orders

/*
	JOIN Syntax:
	SELECT * FROM Tabelle A
	INNER JOIN Tabelle B ON A.KeySpalte = B.KeySpalte
*/

-- JOIN zwischen Customers und Orders
SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT Customers.CustomerID, Orders.CustomerID FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT Customers.CompanyName, Orders.* FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- JOIN mit Aliase
SELECT * FROM Customers AS cus
JOIN Orders as ord ON cus.CustomerID = ord.CustomerID

-- JOIN zwischen Customers, Orders & Order Details
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN [Order Details] ON [Order Details].OrderID  = Orders.OrderID


-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Tabellen: Employees - Orders - [Order Details] - Products
SELECT ProductName, LastName FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Leverling'

-- 2. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
-- Tabellen: [Order Details] - Products
SELECT TOP 1 ProductName, Quantity FROM Products 
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 3. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
--> Products - Categories Tables
SELECT ProductName FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- OUTER JOINS

-- LEFT Join = 830 Rows
-- Alle Datensätze aus der Linken Tabelle + passende Verknüpfungen
-- Bestellungen von keinem Kunden
SELECT * FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- Right JOIN = 832 Rows => Z.189 & Z.502
-- Alle Datensätze aus der Rechten Tabelle + passende Verknüpfungen
-- Kunden ohne Bestellungen
SELECT * FROM Orders 
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- Full Outer = Left + Right zusammen
SELECT * FROM Orders 
FULL OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- JOIN "invertieren" => Nur die leeren Werte rausholen
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL OR Customers.CustomerID IS NULL

-- CROSS JOIN: Erstellt ein Karthesisches Produkt zweier Tabellen = (A x B) = (91 x 830)
SELECT * FROM Orders CROSS JOIN Customers

-- SELF Join
SELECT E1.EmployeeID as MitarbeiterID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellte
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo

-- 1. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
--> Orders - Order Details - Products
SELECT * FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE Discontinued = 1

-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? (Anzahl OrderIDs bzw.
-- Anzahl Ergebniszeilen)
-- Tabellen: Customers - Orders
SELECT * FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'Argentina'