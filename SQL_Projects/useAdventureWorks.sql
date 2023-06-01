-- Use AdventureWorks 2017 and create a procedure from person.Address.
USE AdventureWorks2017
GO
CREATE PROC dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO
EXEC dbo.uspGetAddress