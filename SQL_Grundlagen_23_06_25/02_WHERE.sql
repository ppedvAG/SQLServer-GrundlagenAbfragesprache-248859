USE Northwind

-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = wird nach exakten Treffern gefiltert
SELECT * FROM Orders
WHERE Freight = 100

-- alle boolschen Vergleichsoperatoren
-- (>, <, >=, <=, != bzw. <>)

SELECT * FROM Orders
WHERE Freight < 500

SELECT * FROM Orders
WHERE Freight > 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren von WHERE Ausdrücken mit AND oder OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND  City ='Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR  City ='Berlin'

-- AND = "Beide" Bedingungen müssen wahr sein (true oder 1)
-- OR = Ein Ausdruck muss wahr sein
-- Können beliebig viele kombiniert werden

-- Vorsicht bei Kombination aus AND und OR
SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND "ist stärker bindent" als OR; Notfalls klammern setzen

SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- ALternative mit BETWEEN, Randwerte sind mit dabei
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'France'

-- IN verbindet mehrere OR Bedingungen die sich auf die selbe Spalte beziehen

-- Alternative IN (Wert1, Wert2, Wert3)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France') OR City IN ('Berlin', 'France')

---------------------------------------------------------
-- Übungen:

-- 1. Alle ContactNames die als Title "Owner" haben
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details die ProductID 43 bestellt haben
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Berlin, Madrid und Brasilien
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'

-- "Bonus/Problem": Alle Kunden die eine Fax Nummer haben
SELECT * FROM Customers
WHERE Fax != 'NULL'

SELECT * FROM Customers
WHERE Fax IS NOT NULL
