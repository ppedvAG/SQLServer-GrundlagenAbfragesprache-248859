USE Northwind

-- Unterabfragen

/*
	- Muessen eigenständig ausführbar sein
	- Koennen prinzipiell ueberall in eine Abfrage eingebaut werden (wenn es Sinn macht)
	- Abfragen werden "von innen nach außen" der Reihe nach ausgefuehrt
*/

-- Zeige mir alle Orders, deren Freight Wert über dem Durchschnitt liegen
SELECT * FROM Orders
HAVING Freight > AVG(Freight)

-- Lösung: Unterabfrage
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders) -- 78,2442

-- Mehrere Werte aus einer Subquery im WHERE haben
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- 1. Schreiben Sie eine Abfrage, um eine Produktliste 
--(ID, Name, Stückpreis) mit einem überdurchschnittlichen Preis zu erhalten.
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
