-- joining with product dimension table to enhance the data with some geographic info

select * from dbo.customers
select * from dbo.geography

-- ***********************************************************************************************
SELECT 
	c.CustomerID,
	c.CustomerName,
	c.Email,
	c.Gender,
	c.GeographyID,
	g.Country,
	g.City

FROM 
	dbo.customers as c 
LEFT JOIN
--RIGHT JOIN,
--INNER JOIN,
--FULL OUTER JOIN,
	dbo.geography as g

ON
	c.GeographyID = g.GeographyID;