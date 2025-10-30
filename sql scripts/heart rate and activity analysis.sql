-- Heart Rate Categorization (For visualization, e.g., 'Count of user IDs by Heart Rate Category')
SELECT
    Id,
    CASE
        WHEN Value < 60 THEN 'Rest' -- Value < 60 [cite: 26]
        WHEN Value > 120 THEN 'Active' -- Value > 120 [cite: 31]
        WHEN Value >= 60 AND Value <= 120 THEN 'Normal' -- 60 <= Value <= 120 [cite: 32]
        ELSE 'Unclassified'
    END AS Heart_Rate_Category
FROM
    heartrate_seconds_merged;

-- To get the counts for the visualization:
SELECT
    Heart_Rate_Category,
    COUNT(DISTINCT Id) AS Count_of_Users
FROM (
    -- Subquery to categorize each heart rate record
    SELECT
        Id,
        CASE
            WHEN Value < 60 THEN 'Rest' 
            WHEN Value > 120 THEN 'Active' 
            WHEN Value >= 60 AND Value <= 120 THEN 'Normal' 
            ELSE 'Unclassified'
        END AS Heart_Rate_Category
    FROM
        heartrate_seconds_merged
) AS Categorized_HR
GROUP BY
    Heart_Rate_Category;
    
-- MET Categorization (For visualization, e.g., 'Count of user IDs by MET Category')
SELECT
    Id,
    CASE
        WHEN METs < 40 THEN 'Sedentary' -- METs < 40 [cite: 36]
        WHEN METs >= 10 AND METs < 80 THEN 'Light' -- 10 <= METs < 80 [cite: 37]
        WHEN METs >= 80 AND METs <= 120 THEN 'Moderate' -- 80 <= METs <= 120 [cite: 38]
        WHEN METs > 130 THEN 'Vigorous' -- METs > 130 [cite: 39]
        ELSE 'Unclassified/Gap' -- Default for remaining values [cite: 40, 41]
    END AS MET_Category
FROM
    minuteMETsNarrow_merged;

-- To get the counts for the visualization:
SELECT
    MET_Category,
    COUNT(DISTINCT Id) AS Count_of_Users
FROM (
    -- Subquery to categorize each MET record
    SELECT
        Id,
        CASE
            WHEN METs < 40 THEN 'Sedentary'
            WHEN METs >= 10 AND METs < 80 THEN 'Light'
            WHEN METs >= 80 AND METs <= 120 THEN 'Moderate'
            WHEN METs > 130 THEN 'Vigorous'
            ELSE 'Unclassified/Gap'
        END AS MET_Category
    FROM
        minuteMETsNarrow_merged
) AS Categorized_METs
GROUP BY
    MET_Category;