-- SQL CHALLENGES

-- SQL SELECT DISTINCT
SELECT DISTINCT City FROM Person.Address

-- SQL SELECT TOP
SELECT TOP 10 * FROM Production.Product

-- SQL MIN/MAX
-- SQL min, Selects the lowest
SELECT MIN(TransactionID) AS TransactionID
FROM Production.TransactionHistory

-- SQL max, Selects the largest
SELECT MAX(TransactionID) AS TransactionID
FROM Production.TransactionHistory

-- SQL LIKE
SELECT FirstName
FROM Person.Person
Where FirstName LIKE 'R%'
-- Returns first names from column FirstName which starts with R

-- SQL WILDCARD
SELECT LastName
FROM Person.Person
WHERE LastName LIKE 'R[oa]%' 
-- Returns the last names from column LastName which starts with R and is followed by either an o or a

-- SQL BETWEEN
SELECT * FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice BETWEEN 30 AND 50;
-- Selects only the info from the Purchasing.PurchaseOrderDetail table with a UnitPrice between 30 and 50

