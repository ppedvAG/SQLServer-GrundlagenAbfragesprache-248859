USE Northwind

-- String Funktionen bzw. Text-Datentypen manipulationen

-- LEN gibt die laenge eines Strings zurück (Anzahl an Symbole) als int
SELECT CompanyName, LEN(CompanyName), LEN(Country) FROM Customers

-- LEFT/RIGHT geben die "linken"/"rechten" x Zeichen eines Strings zurück
SELECT CompanyName, LEFT(CompanyName, 5), RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zur Position x in einem String und gibt y Zeichen zurück
SELECT SUBSTRING(CompanyName, 5, 5), CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x mit replace Wert
-- Telefonnummer zensur
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXX') FROM Customers
SELECT STUFF(Phone, 1, 5, 'XXXX') FROM Customers

-- PATINDEX sucht nach "schema" (wie Like) in einem String und gibt deren Position aus
SELECT PATINDEX('%m%', CompanyName), CompanyName FROM Customers

-- CONCAT fügt mehrere Strings einfach zusammen
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees


-- Datumsfunktionen
SELECT GETDATE() -- aktuelle Systemzeit mit Zeitstempel

SELECT YEAR(OrderDate) as Jahr,
MONTH(OrderDate) as Monat, DAY(OrderDate) as Tag,
OrderDate FROM Orders

-- Gewünschtes Intervall aus einem Datum ziehen
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as Kalenderwoche,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders


-- Intervall Namen aus Datum ziehen
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate),
DATEPART(WEEKDAY,OrderDate), OrderDate FROM Orders

-- Datum addieren/subtrahieren
-- 1. Parameter: Was addieren wir? Tage, Monate etc..
-- 2. Parameter: Wie viele davon?
-- 3. Parameter: Zu welchem Datum addieren/subtrahieren wir das?
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz zwischen 2 Datum
SELECT DATEDIFF(YEAR, '13.02.2005', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()) FROM Orders

-- Übung:
-- 1. Alle Bestellungen (Orders) aus Quartal 2 in 1997
SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate) = 2

-- Oder
SELECT * FROM Orders
WHERE YEAR(OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate) = 2

-- Oder
SELECT * FROM Orders
WHERE OrderDate BETWEEN '01.04.1997' AND '30.06.1997'

-- Übungsaufgaben

-- 1. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997 aufgegeben wurden
-- (OrderDate in Orders)
--> Customers - Orders
SELECT * FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID 
WHERE DATEPART(YEAR,OrderDate) = 1997 AND Country = 'USA'

-- 2. Welches Produkt (ProductName) hatte die groeßte Bestellmenge 
-- (Quantity in OrderDetails) im Februar 1998?
-- Products - Order Details - Orders
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998 AND MONTH(OrderDate) = 2
ORDER BY Quantity DESC

/**********************************/

-- CAST oder CONVERT, wandeln Datentypen in der Ausgabe um
SELECT CONCAT(DAY(OrderDate), '.', MONTH(OrderDate), '.', YEAR(OrderDate)) FROM Orders

SELECT CAST(OrderDate as date) FROM Orders
SELECT CONVERT(date, OrderDate) FROM Orders

-- Format: Formatierungsarten
DECLARE @d AS DATE = GETDATE()

SELECT FORMAT(@d, 'd', 'en-US') AS 'US English',
       FORMAT(@d, 'd', 'en-gb') AS 'British English',
       FORMAT(@d, 'd', 'de-de') AS 'German',
       FORMAT(@d, 'd', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT FORMAT(@d, 'D', 'en-US') AS 'US English',
       FORMAT(@d, 'D', 'en-gb') AS 'British English',
       FORMAT(@d, 'D', 'de-de') AS 'German',
       FORMAT(@d, 'D', 'zh-cn') AS 'Chinese Simplified (PRC)';

SELECT TOP 5 OrderDate,
FORMAT(OrderDate, 'd', 'de-de') as Blabla
FROM Orders

SELECT TOP 5 Freight, 
	FORMAT(Freight, 'N', 'de-de'),
	FORMAT(Freight, 'G', 'de-de'),
	FORMAT(Freight, 'C', 'de-de')
FROM Orders

-- ISNULL prüft auf NULL Werte und ersetzt diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax from Customers

-- REPLACE(x, y, z) => "y" sucht in "x" den String um Ihn mit "z" zu ersetzen
SELECT REPLACE('Hallo Welt!', 'Welt!', 'und Willkommen!')
SELECT REPLACE(Country, 'Argentina', 'Argentinien') as NeueSpalte FROM Customers
WHERE Country = 'Argentina'

-- REPLICATE(x, y) => Setze "y" mal die "x" vor der Spalte
SELECT REPLICATE('+49', 1) + Phone FROM Customers

-- Reverse(Spaltenname) => z.B "Hallo" wird zu "ollaH"
SELECT CompanyName, REVERSE(CompanyName) From Customers
SELECT OrderDate, REVERSE(CONVERT(date, OrderDate)) FROM Orders

-- UPPER(Spaltenname) => alles in Großbuchstaben
SELECT CompanyName, UPPER(CompanyName) FROM Customers

-- LOWER(Spaltenname) => alles in Kleinbuchstaben
SELECT CompanyName, LOWER(CompanyName) FROM Customers

-- TRANSLATE(inputString, chars, replace)
-- => Gebe deinen InputString an, wählen wir die Zeichen aus, die mit replace ersetzt werden sollen
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()')