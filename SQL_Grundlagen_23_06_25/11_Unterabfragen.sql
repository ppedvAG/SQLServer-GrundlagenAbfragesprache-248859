USE Northwind

-- Unterabfragen

/*
	- Muessen eigenst�ndig ausf�hrbar sein
	- Koennen prinzipiell ueberall in eine Abfrage eingebaut werden (wenn es Sinn macht)
	- Abfragen werden "von innen nach au�en" der Reihe nach ausgefuehrt
*/

-- Zeige mir alle Orders, deren Freight Wert �ber dem Durchschnitt liegen
SELECT * FROM Orders
HAVING Freight > AVG(Freight)

-- L�sung: Unterabfrage
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders) -- 78,2442

-- Mehrere Werte aus einer Subquery im WHERE haben
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- 1. Schreiben Sie eine Abfrage, um eine Produktliste 
--(ID, Name, St�ckpreis) mit einem �berdurchschnittlichen Preis zu erhalten.
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
