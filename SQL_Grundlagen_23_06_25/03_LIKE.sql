USE Northwind

-- LIKE: Für ungenaue Filterung/Suche können wir LIKE verwenden
-- (statt Vergleichsoperatoren)

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE 'Manager'

-- Wildcards

-- %-Zeichen: Beliebige Symbole, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- _-Zeichen: EIN beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles was in den Klammern ist, ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0, 1, 2, 3, 4, 5, 6]%' -- Funktioniert auch ohne Komma

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[abc]%' -- Funktioniert auch ohne Komma

-- [a-z] => range bereich basteln
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-6]%'

-- gegenteil [^abc]%
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^1-3]%' -- Funktioniert in der Klammer

-- Wie kann ich nach Zahl & nach Zeichenketten suchen?
-- Postleitzahl gültig von 1 bis 5 und von a bis g
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-5 a-g]%'

-- Sonderfälle:
-- #
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- '
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

