USE Northwind
/*

	CASE - unterscheiden wir definierte Fälle, die die Ausgabe

*/

-- Wenn ein Fall gefunden wird, dann wird XYZ in die Zelle geschrieben, wenn nicht
-- dann folgt NULL

SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Die Menge Passt'
END as Ueberpruefung
FROM Products

-- Alternativ mit ELSE einen "Notausgang" definieren:
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Die Menge Passt'
	ELSE 'Fehler bei der Überprüfung, es wurde kein Wert gefunden'
END as Ueberpruefung
FROM Products

-- Funktioniert auch mit Update
UPDATE Customers
SET City =
CASE 
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
END


-- Auch im GROUP BY
SELECT SUM(UnitsInStock),
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Die Menge Passt'
	ELSE 'Fehler bei der Überprüfung, es wurde kein Wert gefunden'
END as Pruefung
FROM Products
GROUP BY 
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Die Menge Passt'
	ELSE 'Fehler bei der Überprüfung, es wurde kein Wert gefunden'
END