-- Analytical queries for hospital quality, cost, and performance

-- Top 5 states by average overall hospital rating
-- Excludes hospitals without ratings.
SELECT State_FullName,
       AVG(Rating_Overall) AS Avg_Rating
FROM hospitals
WHERE Rating_Overall IS NOT NULL
GROUP BY State_FullName
ORDER BY Avg_Rating DESC
LIMIT 10;

-- State-wise average cost for pneumonia treatment
-- Helps identify cost disparities across regions.
SELECT Facility_State,
       State_FullName,
       AVG(Procedure_Pneumonia_Cost) AS Avg_PneumoniaCost
FROM hospitals
WHERE Procedure_Pneumonia_Cost IS NOT NULL
GROUP BY Facility_State, State_FullName
ORDER BY Avg_PneumoniaCost DESC;

-- Bottom 10 states by average overall rating
SELECT Facility_State, 
	   AVG(Rating_Overall) as Avg_Rating
FROM hospitals
WHERE Rating_Overall IS NOT NULL
GROUP BY Facility_State
ORDER BY Avg_Rating ASC
LIMIT 10;

-- Hip/Knee: average cost by state
SELECT Facility_State, State_FullName,
       AVG(Procedure_HipKnee_Cost) AS avg_hipknee_cost,
       COUNT(Procedure_HipKnee_Cost) AS hospitals_with_cost
FROM hospitals
WHERE Procedure_HipKnee_Cost IS NOT NULL
GROUP BY Facility_State, State_FullName
HAVING COUNT(Procedure_HipKnee_Cost) >= 20
ORDER BY avg_hipknee_cost DESC
LIMIT 10;

-- Outliers for Heart attack procedure
-- Example: High cost + worse quality hospitals
SELECT Facility_State,
	   Facility_City,
	   Facility_Name,
	   Procedure_HeartAttack_Cost,
       Procedure_HeartAttack_Quality,
       Procedure_HeartAtatck_Value
FROM hospitals
WHERE Procedure_HeartAttack_Cost IS NOT NULL
AND  Procedure_HeartAttack_Quality = 1
ORDER BY Procedure_HeartAttack_Cost DESC
LIMIT 30;

-- Overall Rating for Facility type
SELECT Facility_Type,
	   Avg(Rating_Overall) as Avg_Rating,
       COUNT(*) as hospitals_count
FROM hospitals
WHERE Rating_Overall IS NOT NULL
GROUP BY Facility_Type
ORDER BY Avg_Rating Desc;
