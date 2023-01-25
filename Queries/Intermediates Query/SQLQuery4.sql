SELECT Distinct(CompanyName)
FROM dbo.Orders O
LEFT JOIN dbo.Customers C on O.CustomerID =  C.CustomerID
LEFT JOIN dbo."Order Details" OD on O.OrderID = OD.OrderID
LEFT JOIN dbo.Products P on OD.ProductID = P.ProductID
WHERE P.ProductName = 'Chai' AND YEAR(O.OrderDate) = 1997
