-- Use '%r' (which covers hh:mm:ss AM/PM) to correctly parse the time
UPDATE minuteCaloriesNarrow_merged
SET ActivityMinute = STR_TO_DATE(ActivityMinute, '%m/%d/%Y %r');

ALTER TABLE minuteCaloriesNarrow_merged
MODIFY COLUMN ActivityMinute DATETIME;

UPDATE minuteStepsNarrow_merged
SET ActivityMinute = STR_TO_DATE(ActivityMinute, '%m/%d/%Y %r');

ALTER TABLE minuteStepsNarrow_merged
MODIFY COLUMN ActivityMinute DATETIME;

select * from minutecaloriesnarrow_merged;
select * from minuteStepsNarrow_merged;


-- Hourly calorie expenditure trend (Line Chart: Calories, Hour)
SELECT
    HOUR(ActivityMinute) AS Hour_of_Day,
    AVG(Calories) AS Average_Calories
FROM
    minuteCaloriesNarrow_merged
GROUP BY
    Hour_of_Day
ORDER BY
    Hour_of_Day;

-- Average activity intensity per hour (Area Chart: Avg Intensity, Hour)
-- Assuming 'Intensity' is a calculated average from the four intensity minute columns. 
-- If 'hourly Intensities_merged' has an 'AverageIntensity' column, use that:
-- SELECT HOUR(ActivityHour) AS Hour_of_Day, AVG(AverageIntensity) FROM hourlyIntensities_merged GROUP BY Hour_of_Day;

-- Total steps recorded per day of the week (Area Chart: Day Name, Steps)
SELECT
    DAYNAME(ActivityMinute) AS Day_Name,
    SUM(Steps) AS Total_Steps
FROM
    minuteStepsNarrow_merged
GROUP BY
    Day_Name
ORDER BY
    MIN(DAYOFWEEK(ActivityMinute));

-- Hourly step count trend (Line Chart: Steps, Hour)
SELECT
    HOUR(ActivityMinute) AS Hour_of_Day,
    AVG(Steps) AS Average_Steps
FROM
    minuteStepsNarrow_merged
GROUP BY
    Hour_of_Day
ORDER BY
    Hour_of_Day;