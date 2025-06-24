/*

	Datentypen in SQL: 3 große Gruppen


	1. Numerische Datentypen
	tinyint = 8 Bit = 1 Byte = 255
	smallint = 16 Bit = 2 Byte = 32k
	int = 32 Bit = 4 Byte = 2,14Mrd
	bigint = 64 Bit = 8 Byte = 9,2 Trillion ca.

	bit = 1 oder 0 (1 = True; 0 = False)

	decimal(x, y) = x Ziffern insgesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Stellen insgesamt, davon sind 2 nach dem Komma
	money = 9,2 Trillion ca.
	smallmoney = ca. 214 Tausend

	float(n) = 53
	1-24 = 7 Stellen Präzise ab = 4 Byte
	25-53 = 15 Stellen Präzise ab = 8 Byte

	real = 4 Byte

	2. Charakter/String Datentypen
	char(10) = 'Hallo     ' = 10 Byte => UTF-8
	nchar(10) = pro Zeichen = 2 Byte => Zeichencodierung UTF-16 = 20 Byte

	varchar(10) = 'Hallo' = 5 Byte => UTF-8
	nvarchar(10) = pro Zeichen = 2 Byte => Zeichencodierung UTF-16 => 10 Byte

	varchar(8000) & nvarchar(4000)
	Legacy = text ==> mittlerweile VARCHAR(MAX) = bis zu 2GB


	3. Datum/Zeit Datentypen
	time = hh:mm:ss.nnnnnnn
	date = YYYY-MM-DD
	datetime = date + time in Millisekunden = YYYY-MM-DD hh:mm:ss.mmm
	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
	smalldatetime = präzise bis Sekunden = YYYY-MM-DD hh:mm:ss

	Andere: 
	XML
	JSON
	geometry
	geography
	
*/