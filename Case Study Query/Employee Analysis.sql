SELECT 
	CONCAT(FirstName, ' ', LastName) FullName,
	Title,
	DATEDIFF(Year, BirthDate, OrderDate) AGE,
	sum(((UnitPrice * Quantity) * (1-Discount))) TotalSalesAfterDc, 
	Count(Distinct O.OrderID) TotalOrder
FROM [Order Details] OD
LEFT JOIN Orders O ON OD.OrderID = O.OrderID
LEFT JOIN Employees E ON O.EmployeeID = E.EmployeeID
GROUP BY CONCAT(FirstName, ' ', LastName), Title, DATEDIFF(Year, BirthDate, OrderDate)

