-- Step 1: Convert the string data to a proper date format
-- Use '%r' (which handles the hh:mm:ss AM/PM)
UPDATE sleepDay_merged
SET SleepDay = STR_TO_DATE(SleepDay, '%m/%d/%Y %r');

-- Step 2: Change the column's data type to DATE
ALTER TABLE sleepDay_merged
MODIFY COLUMN SleepDay DATETIME;

-- Apply the fix for weightLogInfo_merged
UPDATE weightLogInfo_merged
SET Date = STR_TO_DATE(Date, '%m/%d/%Y %r');

ALTER TABLE weightLogInfo_merged
MODIFY COLUMN Date DATETIME;

select * from sleepDay_merged;
select * from weightLogInfo_merged;

-- Time Awake In Bed Calculation (For visualization: Stacked Bar Chart)
-- Note: You would likely need to import the 'sleepDay_merged.csv' into a table first.

SELECT
    DAYNAME(SleepDay) AS Day_Name,
    -- Calculated Field: TotalTimeInBed - TotalMinutesAsleep 
    SUM(TotalTimeInBed - TotalMinutesAsleep) AS Total_Time_Awake_In_Bed
FROM
    sleepDay_merged
GROUP BY
    Day_Name
ORDER BY
    MIN(DAYOFWEEK(SleepDay));
    
-- Health Status Categorization 
-- Note: You would need to import the 'weightLogInfo_merged.csv' into a table with a 'BMI' column.

SELECT
    Id,
    BMI,
    CASE
        WHEN BMI < 18.5 THEN 'Underweight' -- BMI < 18.5 
        WHEN BMI >= 18.5 AND BMI < 25 THEN 'Normal' -- 18.5 <= BMI < 25 
        WHEN BMI >= 25 AND BMI < 30 THEN 'Overweight' -- 25 <= BMI < 30 
        WHEN BMI > 30 THEN 'Obese' -- BMI > 30 
        ELSE 'Unclassified'
    END AS Health_Status
FROM
    weightLogInfo_merged;

-- To get the counts for visualization:
SELECT
    Health_Status,
    COUNT(DISTINCT Id) AS Count_of_Users
FROM (
    -- Subquery to categorize each BMI record
    SELECT
        Id,
        CASE
            WHEN BMI < 18.5 THEN 'Underweight'
            WHEN BMI >= 18.5 AND BMI < 25 THEN 'Normal'
            WHEN BMI >= 25 AND BMI < 30 THEN 'Overweight'
            WHEN BMI > 30 THEN 'Obese'
            ELSE 'Unclassified'
        END AS Health_Status
    FROM
        weightLogInfo_merged
) AS Categorized_BMI
GROUP BY
    Health_Status;
    