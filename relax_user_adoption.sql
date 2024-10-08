--Creating adopted feature to identify active users and addong that column to the takehome users table
WITH WeeklyVisits AS (
    SELECT user_id,
           SUM(visited) AS total_visits
    FROM takehome_user_engagement$
    GROUP BY user_id, DATEADD(WEEK, DATEDIFF(WEEK, 0, time_stamp), 0)
)
UPDATE takehome_users$
SET adopted = CASE
                WHEN EXISTS (
                    SELECT 1
                    FROM WeeklyVisits
                    WHERE WeeklyVisits.user_id = takehome_users$.object_id
                      AND WeeklyVisits.total_visits >= 3
                ) THEN 1
                ELSE 0
              END;

select * from takehome_users$
--Which creation sources have the highest adoption rate
use relax_user_analysis

select creation_source, count(*) as no_of_adopted from takehome_users$
where adopted = 1
group by creation_source
order by no_of_adopted desc

--Percentage of adopted users by creation_source
select distinct creation_source from takehome_users$
SELECT 
    creation_source,
    (SUM(CASE WHEN adopted = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS adoption_percentage
FROM 
    takehome_users$
GROUP BY 
    creation_source;

--Does last login effect user adoption

--Percentage that logged on less recently
WITH AvgTime AS (
    SELECT AVG(last_session_creation_time) AS average_last_session_created 
    FROM takehome_users$
),
TotalAboveAvg AS (
    SELECT COUNT(*) AS total_above_avg
    FROM takehome_users$
    WHERE last_session_creation_time > (SELECT average_last_session_created FROM AvgTime)
),
AdoptedAboveAvg AS (
    SELECT COUNT(*) AS adopted_above_average
    FROM takehome_users$
    WHERE adopted = 1 
    AND last_session_creation_time > (SELECT average_last_session_created FROM AvgTime)
)
SELECT
    (CAST(adopted_above_average AS FLOAT) / total_above_avg) * 100 AS percentage_adopted_above_avg
FROM
    TotalAboveAvg, AdoptedAboveAvg;


--Percentage that logged on more recently
WITH AvgTime AS (
    SELECT AVG(last_session_creation_time) AS average_last_session_created 
    FROM takehome_users$
),
TotalBelowAvg AS (
    SELECT COUNT(*) AS total_below_avg
    FROM takehome_users$
    WHERE last_session_creation_time < (SELECT average_last_session_created FROM AvgTime)
),
AdoptedBelowAvg AS (
    SELECT COUNT(*) AS adopted_below_average
    FROM takehome_users$
    WHERE adopted = 1 
    AND last_session_creation_time < (SELECT average_last_session_created FROM AvgTime)
)
SELECT
    (CAST(adopted_below_average AS FLOAT) / total_below_avg) * 100 AS percentage_adopted_below_avg
FROM
    TotalBelowAvg, AdoptedBelowAvg;


--Do certain businesses have higher adoption rates

--Identifying which organisations have highest rate of adoption
SELECT org_id, COUNT(*) AS adopted_count
FROM takehome_users$
WHERE adopted = 1
GROUP BY org_id
order by adopted_count desc;


--Inspecting if mailing lists impact adoption 
select opted_in_to_mailing_list, enabled_for_marketing_drip, adopted, count(*) as user_count 
from takehome_users$
group by opted_in_to_mailing_list, enabled_for_marketing_drip, adopted
order by adopted desc

--Does inviting users have an impact on adoption

--Comparison of adopted or not when not invited
with user_counts as (
	SELECT adopted, 
	COUNT(*) AS not_invited
	FROM takehome_users$
	WHERE invited_by_user_id IS NULL
	GROUP BY adopted
	)
select adopted, not_invited, 
(not_invited *100 / sum(not_invited) OVER ()) AS percentage_not_invited
FROM user_counts;

--Comparison of adopted users not when invited
with user_counts as (
	SELECT adopted, 
	COUNT(*)  AS invited_by_user
	FROM takehome_users$
	WHERE invited_by_user_id IS NOT NULL
	group by adopted
	)
select adopted, invited_by_user, 
(invited_by_user *100 / sum(invited_by_user) OVER ()) AS percentage_not_invited
FROM user_counts;






