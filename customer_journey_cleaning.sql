-- querying CTEs to identify and tag duplicate records and dealing with NULL records

select * from dbo.customer_journey

WITH Duplicate_Records AS(
	SELECT 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action,
		Duration,
		ROW_NUMBER() OVER (
			-- PARTITION BY groups rows bbased on specified columns that should be unique
			PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
			ORDER BY JourneyID
			) AS row_num
		FROM 
			dbo.customer_journey
		)


SELECT * 
FROM Duplicate_Records
ORDER BY JourneyID

SELECT
	JourneyID,
	CustomerID,
	ProductID,
	VisitDate,
	Stage,
	Action,
	COALESCE(Duration, avg_duration) AS Duration
FROM 
	(
		--subquery to process and clean data
		SELECT
			JourneyID,
			CustomerID,
			ProductID,
			VisitDate,
			UPPER(Stage) AS Stage,
			Action,
			Duration,
			AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration,
			ROW_NUMBER() OVER (
				PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action
				ORDER BY JourneyID
			) AS row_num
	FROM 
		dbo.customer_journey
	) as subquery
	WHERE row_num = 1;