---categorizing products based on price

SELECT
	ProductID,
	ProductName,
	Price,

	CASE 
		WHEN Price < 50 THEN 'Low Range'
		WHEN Price BETWEEN 50 and 200 THEN 'Medium Range'
		ELSE 'Higher Range'
	END AS Price_Range
		
FROM 
	dbo.products

