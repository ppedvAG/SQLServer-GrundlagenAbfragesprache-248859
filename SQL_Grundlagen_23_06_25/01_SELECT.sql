-- USE Datenbankname wechselt die angesprochene Datenbank
-- Alternativ "oben links" per Drop-Down-Menü richtige DB anwählen
USE Northwind -- Ausführen => STRG + E

-- einzeiliger Kommentar

/*
	Mehrzeiliger
	Kommentarblock
*/

/*
	SELECT: wählt Spalten aus, die im Ergebnisfenster
	angezeigt werden soll
*/
SELECT * FROM Customers -- * = Alle Spalten der Tabelle

SELECT * FROM Customers

-- SQL ist nicht Case-sensitive, Formatierung spielt keine Rolle
SelEcT			CoUntrY,
			CoMpAnyNamE
FrOm		CuStOmErS

-- "Custom" Werte
SELECT 100, 200, 'Hallo'

-- Auch mathematische Operatoren sind möglich
SELECT 100 * 5

-- Selektiere mir nur bestimmte Spalten aus Customers
SELECT ContactName, CompanyName FROM Customers

-- ORDER BY => Sortieren
SELECT * FROM Customers
ORDER BY City ASC

/*
	Order by ist syntaktisch immer am ENde
	ASC = ascending = aufsteigend => A-Z
	DESC = descending = absteigend => Z-A
*/

SELECT * FROM Orders
ORDER BY OrderDate DESC

-- Bezieht sich auf die Sortierreihenfolge
SELECT OrderDate, Freight FROM Orders
ORDER BY 2 DESC


-- Auch mehrere Spalten sortieren
SELECT Country, City FROM Customers
ORDER BY City DESC, Country

------------------------------
-- TOP X gibt nur die ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch mit %
-- TOP X PERCENT
SELECT TOP 10 PERCENT * FROM Customers


SELECT * FROM Orders

-- Die 20 kleinsten Frachtwerte haben & die 20 größten Frachtwerte haben

-- 20 kleinsten
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

-- 20 größten
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

-- Duplikate "filtern" mit SELECT DISTINCT
SELECT DISTINCT * FROM Customers

SELECT DISTINCT Country FROM Customers

-- UNION führt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Spaltenanzahl muss gleich sein, Datentypen müssen kompatibel sein

SELECT * FROM Customers
UNION
SELECT * FROM Customers

-- mit UNION ALL wird KEIN DISTINCT ausgeführt

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers

SELECT * FROM Customers
UNION ALL
SELECT * FROM Orders

SELECT '100', 'Hallo', NULL
UNION
SELECT 'Hallo', '100', '100'

--------------------------------------------------
-- Spalten "umbennen" über Aliase bzw "as"
SELECT 100 as Zahl, 'Hallo' as 'Begrüßung, weil mir nix anderes einfällt'

SELECT OrderDate as Lieferungsdatum, Freight as Frachtkosten FROM Orders