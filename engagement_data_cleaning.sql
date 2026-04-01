-- query to clean and normalise the engagement data table
select * from dbo.engagement_data

SELECT 
	EngagementID, -- identifier for each engagement record
	ContentID, --identifier for each piece of content
	CampaignID, --identifier for each marketing campaign
	ProductID,
	UPPER(REPLACE(ContentType, 'Socialmedia', 'Social Media')) AS ContentType,
	LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
	RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,
	Likes,
	FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') as EngagementDate
FROM 
	dbo.engagement_data
WHERE
	ContentType != 'Newsletter' -- because this isnt relevant to our analysis