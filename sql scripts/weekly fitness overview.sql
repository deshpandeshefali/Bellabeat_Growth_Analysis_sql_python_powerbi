-- Data Preparation & Calculation Step 
-- Load data and convert ActivityDate/ActivityDay (done via the table structure)
-- Extract Day of the Week (using DAYOFWEEK() or DAYNAME())

UPDATE dailyActivity_merged 
SET ActivityDate = STR_TO_DATE(ActivityDate, '%m/%d/%Y');

UPDATE dailyIntensities_merged 
SET ActivityDay = STR_TO_DATE(ActivityDay, '%m/%d/%Y');

SELECT
    DAYNAME(ActivityDate) AS Day_of_Week,
    AVG(TotalSteps) AS Average_TotalSteps,
    AVG(Calories) AS Average_Calories
FROM
    dailyActivity_merged
GROUP BY
    Day_of_Week
ORDER BY
    MIN(DAYOFWEEK(ActivityDate)) 
LIMIT 0, 1000;

-- Total Active Minutes Calculation
SELECT
    DAYNAME(ActivityDay) AS Day_of_Week,
    -- Create the calculated field TotalActiveMinutes
    AVG(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes) AS Average_TotalActiveMinutes
FROM
    dailyIntensities_merged
GROUP BY
    Day_of_Week
ORDER BY
    MIN(DAYOFWEEK(ActivityDay));
    
    
-- Aggregation and Segmentation (Output: user_segmentation_by_avg_steps.csv)
WITH UserAvgSteps AS (
    -- Step 1: Group by unique user Id and calculate the average TotalSteps per user
    SELECT
        Id,
        AVG(TotalSteps) AS Avg_TotalSteps
    FROM
        dailyActivity_merged
    GROUP BY
        Id
)
SELECT
    -- Step 2 & 3: Apply segmentation logic and group/count users
    CASE
        WHEN Avg_TotalSteps > 10000 THEN 'Very Active' -- > 10000 steps 
        WHEN Avg_TotalSteps BETWEEN 7500 AND 9999 THEN 'Active' -- 7500 to 9999 steps 
        WHEN Avg_TotalSteps BETWEEN 5000 AND 7499 THEN 'Light Active' -- 5000 to 7499 steps 
        -- Note: The logic in the document is "Sedentary: 5000 steps", which is ambiguous. 
        -- Assuming it means less than 5000 steps to cover the remaining lower range.
        ELSE 'Sedentary' -- < 5000 steps (based on the provided logic gaps)
    END AS User_Segment,
    COUNT(Id) AS Count_of_Users
FROM
    UserAvgSteps
GROUP BY
    User_Segment
ORDER BY
    Count_of_Users DESC;
    
    
