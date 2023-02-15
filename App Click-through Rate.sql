# Link ## https://datalemur.com/questions/click-through-rate
#This is the same question as problem #1 in the SQL Chapter of Ace the Data Science Interview!
#Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. Output the results in percentages rounded to 2 decimal places.
#Notes:
#Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
#To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

#events Table:
#Column Name	Type
#app_id	integer
#event_type	string
#timestamp	datetime
#events Example Input:
#app_id	event_type	timestamp
#123	impression	07/18/2022 11:36:12
#123	impression	07/18/2022 11:37:12
#123	click	07/18/2022 11:37:42
#234	impression	07/18/2022 14:15:12
#234	click	07/18/2022 14:16:12
#Example Output:
#app_id	ctr
#123	50.00
#234	100.00


SELECT 
app_id,
ROUND((
COUNT(event_type) FILTER (WHERE event_type='click')*100.0 /
COUNT(event_type) FILTER (WHERE event_type='impression')),2) as ctr
FROM events
WHERE extract(Year from timestamp )='2022'
GROUP BY app_id;