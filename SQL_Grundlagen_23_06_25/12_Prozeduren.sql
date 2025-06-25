USE Northwind
GO

/*
	Gespeicherte Prozeduren / stored Procedure

	- Sind gespeicherte SQL Abfragen (nicht nur SELECT, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Praktisch zum automatisieren von Code
	- Prozeduren ihren Ausführungsplan immer wieder verwenden

*/

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Germany'
GO

CREATE PROCEDURE spOrderID @OrderID INT
AS
SELECT * FROM Orders
WHERE OrderID = @OrderID
GO

-- Prozedur ausführen
EXEC spOrderID 10253
GO

-- Prozedur zum einfügen von neuen Kunden
CREATE PROCEDURE spNewCustomer
@CustomerID char(5), @CompanyName varchar(30),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer 'PPEDV', 'PPEDV AG', 'Germany', 'Burghausen'
EXEC spNewCustomer aldis, aldigmbh, deutschland, muenchen

SELECT * FROM Customers
GO

-- Default Werte:
CREATE PROCEDURE spKundenCity 
@Country varchar(50) = 'Germany', @City varchar(50) = 'Berlin'
AS
SELECT * FROM Customers
WHERE Country = @Country AND City = @City
GO

EXEC spKundenCity DEFAULT, München
EXEC spKundenCity 
EXEC spKundenCity France, Paris

-- 1. Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
-- Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden 
-- SUM(Quantity * UnitPrice + Freight) AS RechnungsSumme.

GO

CREATE PROCEDURE spOrderIDSuche
@OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) as RechnungsSumme FROM Orders
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Orders.OrderID = @OrderID
GROUP BY Orders.OrderID
GO

EXEC spOrderIDSuche 10250