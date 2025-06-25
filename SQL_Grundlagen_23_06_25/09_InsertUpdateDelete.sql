USE Northwind

-- CREATE / ALTER / DROP -> DDL (Data Definition Language)

/*
	-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle
*/


-- Tabelle Erstellen
CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	ProductID INT NOT NULL
)

-- Aufrufen
SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrder und Products anlegen �ber ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzuf�gen, zur bestehenden Tabelle
ALTER TABLE PurchasingOrders
ADD TestDaten INT

-- Spalte nach Datentyp �ndern:
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten FLOAT 

-- Spalte l�schen
ALTER TABLE PurchasingOrders
DROP COLUMN TestDaten

-- INSERT -- Hinzuf�gen von Datens�tzen in bestehender Table

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES(GETDATE(), 5, 20)

SELECT * FROM PurchasingOrders

-- Explizit Spalten befuellen
INSERT INTO PurchasingOrders
(OrderDate, ProductID) VALUES (GETDATE(), 10)

-- Ergebnis einer SELECT-Abfrage direkt inserten
-- (Spaltenanzahl & Datentyp muss kompatibel sein)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 3, 15

-- DELETE  => L�schen von Datens�tzen in einer Bestehenden Tabelle
DELETE FROM PurchasingOrders

-- Aufpassen! Ohen WHERE l�schen wir alle Inhalte in der Tabelle
DELETE FROM PurchasingOrders
WHERE ID = 5

SELECT * FROM PurchasingOrders


DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE - �ndern von Spaltenwerten in einem Vorhandenen Datensatz
UPDATE PurchasingOrders
SET TestDaten = 10
WHERE ID = 2

-- Wert l�schen
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 2

-- Transactions

BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 10
WHERE ID = 2

COMMIT -- => �nderung �bernehmen offiziell
ROLLBACK -- => �nderung zur�cknehmen

SELECT * FROM PurchasingOrders
