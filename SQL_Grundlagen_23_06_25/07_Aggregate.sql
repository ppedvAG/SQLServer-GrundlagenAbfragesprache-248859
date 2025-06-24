USE Northwind

-- Aggregatfunktion: F�hrt eine Berechnung auf einer Menge von Werten durch und gibt
--					 ein einzigen Wert zur�ck
-- Ausnahme: COUNT(*) ignoriert keine NULL Werte, die restlichen
--			 Aggregatfunktionen schon

-- 5 grunds�tzliche Aggregatfunktionen

SELECT
SUM(Freight) as Summe,
MIN(Freight) as Minimum,
MAX(Freight) as Maximum,
AVG(Freight) as Durchschnitt,
COUNT(ShippedDate) as Z�hleSpalten, COUNT(*) as Z�hleAlles
FROM Orders

-- Computer sagt nein..
SELECT SUM(CustomerID) FROM Customers

SELECT CustomerID, SUM(Freight) FROM Orders

SELECT CustomerID, Freight FROM Orders
WHERE CustomerID = 'ALFKI'

-- L�sung: GROUP BY
SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID

-- Quantity Summe pro ProductName f�r Produkte der Kategory 1-4
SELECT ProductName, SUM(Quantity) as SummeStueckzahl from [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName
ORDER BY SummeStueckzahl DESC

-- Selbe Tabelle, blo� alle SummeStueckzahl �ber 1000
-- HAVING funktioniert 1zu1 wie WHERE, blo� filtert aggregierte/gruppierte Werte
-- nachtraeglich
SELECT ProductName, SUM(Quantity) as SummeStueckzahl from [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckzahl DESC

-- �bung:
-- 1.. Verkaufte Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
-- Products - Categories - Order Details
SELECT CategoryName, SUM(Quantity) FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName

-- 2. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
-- Tables: Employees - Orders
SELECT LastName, COUNT(OrderID) as Bestellungen, FirstName FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName, FirstName
ORDER BY Bestellungen DESC

-- 3. In welcher Stadt (City) waren �Wimmers gute Semmelkn�del� am beliebtesten (Quantity)?
SELECT TOP 1 City, SUM(Quantity) AS Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE ProductName = 'Wimmers gute Semmelkn�del'
GROUP BY City
ORDER BY Verkaufsmenge DESC
