--1. Erstellen Sie einen Bericht, der die Gesamtzahl der 
--Bestellungen nach Kunde seit dem 31. Dezember 1996 anzeigt. 
--Der Bericht sollte nur Zeilen zurückgeben, 
--für die die Gesamtzahl der Aufträge größer als 15 ist (5 Zeilen)
--Tables: Orders
SELECT CustomerID, COUNT(OrderID) as AnzBestellung FROM Orders
--WHERE DATEPART(YEAR, OrderDate) >= 1997
WHERE OrderDate >= '31.12.1996 23:59:59.999'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY AnzBestellung DESC