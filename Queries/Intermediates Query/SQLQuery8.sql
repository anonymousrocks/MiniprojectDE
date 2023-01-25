CREATE VIEW dbo.OrderDetails 
AS 
SELECT OD.OrderID, OD.ProductID, P.ProductName, OD.UnitPrice, 
		OD.Quantity, OD.Discount, ((OD.UnitPrice * OD.Quantity)* (1-OD.Discount)) PriceAfterDiscount
FROM dbo."Order Details" OD
LEFT JOIN dbo.Products P on OD.ProductID = P.ProductID