CREATE PROCEDURE Invoice
	@CustomerID VARCHAR(5)
AS
SELECT O.CustomerID, C.CompanyName, O.OrderID, O.OrderDate, O.RequiredDate, O.ShippedDate 
FROM dbo.Orders O
LEFT JOIN dbo.Customers C ON O.CustomerID = C.CustomerID
WHERE O.CustomerID = @CustomerID
