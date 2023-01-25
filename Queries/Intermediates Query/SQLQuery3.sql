SELECT TOP 5 ProductName
From dbo.Orders O
LEFT JOIN dbo."Order Details" OD on O.OrderID = OD.OrderID
LEFT JOIN dbo.Products P on OD.ProductId = P.ProductId
WHERE YEAR(O.OrderDate) = 1997 AND MONTH(O.OrderDate) =1
GROUP BY MONTH(O.OrderDate), ProductName
ORDER BY MONTH(O.OrderDate) ASC,  SUM(OD.Quantity) DESC

