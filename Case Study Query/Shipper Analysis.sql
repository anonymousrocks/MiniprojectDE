SELECT 
	S.CompanyName, 
	O.ShipCountry, 
	O.ShipCity,
	Count(Distinct O.OrderID) TotalOrder,
	sum(O.Freight) Freight
	
FROM [Order Details] OD
LEFT JOIN Orders O ON OD.OrderID = O.OrderID
LEFT JOIN Shippers S ON O.ShipVia = S.ShipperID
Group BY S.CompanyName, O.ShipCountry, O.ShipCity

