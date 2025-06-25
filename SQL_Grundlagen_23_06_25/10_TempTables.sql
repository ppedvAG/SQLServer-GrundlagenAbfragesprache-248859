USE Northwind

/*
	-- Temporäre Tabellen

	- Ergebnisse werden nur einmal generiert --> TempTables sind sehr schnell, aber nicht aktuell
	- SELECT INTO #TabelName => Ergebnisse in einer Temporären Tabelle geschrieben
	- werden in SystemDB => tempDB => Temporäre Tabellen
	- existiert nur innerhalb der Session (Skriptfenster / Abfragefenster)
	- mit einem # = 'lokal'
	- mit zwei ## = 'global'
*/

-- Erstellen
SELECT *
INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Aufrufen
SELECT * FROM #TempTable

-- manuell löschen
DROP TABLE #TempTable

-- globale Temp Table
SELECT *
INTO ##TempTable12
FROM Customers
WHERE Country = 'Germany'

--1. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
--„Seafood“ (Categories) verkauft?
--Wenn ja, wieviel Lieferkosten sind 
--dabei insgesamt entstanden (Freight)?
--Das ganze mit Temporaere Tabellen machen
-- Employees - Orders - Order Details - Products - Categories
SELECT SUM(Freight) as Lieferkosten
INTO #TempFreight
FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' AND Categories.CategoryName = 'Seafood'

SELECT * FROM #TempFreight

