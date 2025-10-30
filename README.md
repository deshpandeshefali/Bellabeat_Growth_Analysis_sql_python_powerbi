# Bellabeat Smart Device Usage Analysis: High-Level Marketing Strategy Recommendations

**A data-driven analysis of public smart device usage data to uncover trends in activity, sleep, and health, providing actionable marketing recommendations for Bellabeat, a health-focused company for women.**

<a href = "#overview">Overview</a><br>
<a href = "#problem-statement">Problem Statement</a><br>
<a href = "#dataset">Dataset</a><br>
<a href = "#key-data-files-used">Key data files used</a><br>
<a href = "#tools-and-technologies">Tools and Technologies</a><br>
<a href = "#project-structure">Project Structure</a><br>
<a href = "#data-cleaning-and-preparation">Data cleaning and preparation</a><br>
<a href = "#eda">EDA</a><br>
<a href = "#questions-findings">Questions and Findings</a><br>
<a href = "#dashboard">Dashboard</a><br>
<a href = "#recommendations">Recommendations</a><br>
<a href = "#author-contact">Author and Contact</a><br>

<h2><a class="anchor" id="overview"></a>Overview</h2>

- This project was initiated by Bellabeat, a high-tech manufacturer of health-focused smart products for women.
- The goal was to leverage publicly available consumer usage data for smart devices (specifically, the Fitbit dataset) to gain strategic insights into user behavior.
- The findings will directly inform and optimize Bellabeat’s marketing strategy and product development tailored for its female consumer base.

<h2><a class="anchor" id="problem-statement"></a>Problem Statement</h2>

- The primary business problem is to understand how consumers are currently using their smart devices regarding activity, sleep, and overall health tracking.
- By identifying critical gaps, trends, and opportunities in the existing data, the company aims to produce high-level recommendations that Bellabeat can use to enhance its competitive position and drive targeted marketing campaigns.

<h2><a class="anchor" id="dataset"></a>Dataset</h2>

- multiple csv files located in "FitBit Fitness Tracker Data"

<h2><a class="anchor" id="key-data-files-used"></a>Key data files used</h2>

- dailyActivity_merged.csv
- dailyIntensities_merged.csv
- sleepDay_merged.csv
- weightLogInfo_merged.csv
- heartrate_seconds_merged.csv
- minuteStepsNarrow_merged.csv
- hourlyIntensities_merged.csv
- minuteMETsNarrow_merged.csv

Time Frame: April 2016 to May 2016

<h2><a class="anchor" id="tools-and-technologies"></a>Tools and Technologies</h2>

### Data Processing : Python (Pandas)

- Cleaning, transformation, merging, and preliminary analysis.

### Statistical Analysis

- SQL, MySQL

### Data aggregation, categorization (e.g., BMI, Heart Rate), and grouping for final metrics.

- Visualization : **Python (Matplotlib, Seaborn), Generating exploratory charts.**
- Dashboarding : **Power BI**
- Creating the final, interactive reporting dashboard.

<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

- The analysis was divided into four main pages/sections, mirroring a comprehensive BI dashboard structure:

- Weekly Fitness Overview: Analysis of average daily activity, steps, calories, and user segmentation.

- Heart Rate and Activity Intensity Analysis: Categorization and visualization of heart rate zones and Metabolic Equivalent (MET) levels.

- Hourly and Daily Activity Patterns: Identification of peak usage hours for steps, calories, and intensity.

- Sleep and Health Status Analysis: Examination of sleep quality metrics and Body Mass Index (BMI) categorization.

<h2><a class="anchor" id="data-cleaning"></a>Data cleaning and preparation</h2>

- The primary steps taken to ensure data integrity included:

- Date/Time Conversion: All date and timestamp columns (ActivityDate, SleepDay, ActivityMinute, etc.) were converted from string/object format (MM/DD/YYYY or MM/DD/YYYY HH:MM:SS AM/PM) into proper DATETIME format for accurate temporal analysis (as shown in both Python and SQL steps).

- Day of the Week: A DayOfWeek column was extracted from date fields for time-based aggregation.

- Total Active Minutes: Calculated by summing VeryActiveMinutes, FairlyActiveMinutes, and LightlyActiveMinutes.

- Time Awake In Bed: Calculated as TotalTimeInBed - TotalMinutesAsleep.

- Data Consistency: Checked for unique user IDs and ensured consistency between daily and minute-level data tables where possible.

<h2><a class="anchor" id="eda"></a>EDA</h2>

### Key findings from the exploration phase include:

### User Segmentation (Activity Level)

- The analysis categorized users based on their average daily step count:

**Very Active: > 10,000 steps**
**Active: 7,500 to 9,999 steps**
**Light Active: 5,000 to 7,499 steps**
**Sedentary: < 5,000 steps**

**Finding: The user base is quite evenly distributed across Active (approx. 27.3%), Light Active (approx. 27.3%), and Sedentary (approx. 24.2%) categories, indicating a need for products and marketing tailored to lower activity users, not just fitness enthusiasts**

## Weekly Trends

**Steps and Calories: Average steps and calories generally dip sharply on Sunday and peak on Tuesdays and Saturdays.**

**Active Minutes: The breakdown of active minutes (Very, Fairly, Lightly) is consistent throughout the week, with Lightly Active Minutes dominating, reinforcing that most users are not engaging in high-intensity, sustained activity.**

## Hourly Patterns

**Peak Activity: Both steps and calorie expenditure show a clear hourly trend, with a gradual increase starting around 5:00 AM and distinct peaks in the late afternoon/early evening between 5:00 PM and 7:00 PM (17h-19h). \* Low Usage: Activity is minimal during the overnight hours (12:00 AM to 4:00 AM).**

<h2><a class="anchor" id="questions-findings"></a>Questions and Findings</h2>

**Research Question**

**Key Finding & Insight**

1. When are users most active?

- Peak activity occurs from 5:00 PM to 7:00 PM (after work hours). Insight: Marketing campaigns should target this evening window, focusing on recovery, wind-down routines, and post-work exercise.

2. How many users are meeting recommended step goals?

- Less than 22% of users are categorized as "Very Active" (>10k steps), suggesting the majority are sedentary or lightly active. Insight: Bellabeat should introduce gamification and targeted challenges (e.g., "Get to 7,500 steps") to motivate the Light Active and Sedentary segments.

3. What is the quality of users' sleep?

- Users spend the most time awake in bed on Sundays (over 50 minutes on average), followed by Fridays. Insight: There is a strong need for better sleep/relaxation content and products (e.g., Bellabeat's Leaf, soundscapes) pitched specifically for stress management and weekend wind-down.

4. How does heart rate usage vary?

- The vast majority of heart rate readings fall into the Normal range (60-120 BPM), suggesting most users are not consistently performing moderate to vigorous exercise. Insight: Products should emphasize tracking and improving time spent in the 'Active' heart rate zone.

<h2><a class="anchor" id="dashboard"></a>Dashboard</h2>

**A comprehensive dashboard presents the aggregated data through several visualizations:**

1. Average Total Steps by Day of Week: Line Chart
2. Count of Users by User Segment (Steps): Donut Chart
3. Average Active Minutes Breakdown by Day: Stacked Bar Chart
4. Total Calories Burned by Day of the Week: Area Chart
5. Hourly Average Calorie Expenditure Trend: Line Chart
6. Average Time Awake In Bed by Day of the Week (Minutes): Bar Chart
7. User Count by BMI Health Status: Bar/Column Chart (showing distribution across Underweight, Normal, Overweight, Obese)

<h2><a class="anchor" id="recommendations"></a>Recommendations</h2>

**Based on the analysis, the following high-level recommendations are provided to the Bellabeat co-founders and marketing team:**

**A. Focus on Motivation and Habit Building for Low-Activity Users**

- Action: Market features that encourage users to break up sedentary time (e.g., hourly vibration reminders) and set achievable goals (e.g., 5,000 steps).

**B. Target the "Post-Work Wind-Down" Window**

- Action: Launch push notifications, in-app content, and social media campaigns tailored to this time slot, such as "30-Minute Post-Work Stress Relief Workouts" or "Review Your Day's Accomplishments."

**C. Enhance Sleep and Stress Management Product Messaging**

- Action: Run marketing campaigns explicitly linking Bellabeat devices to stress reduction and improved weekend sleep. Offer specialized content for managing Sunday Scaries or recovery protocols for better Monday starts.

**D. Create Feature-Specific Challenges Around Intensity**

- Action: Promote monthly challenges focused on accumulating "Very Active Minutes" or "Time in Active Heart Rate Zone," offering in-app badges or rewards to transition users from Light Active to Fairly/Very Active segments.

<h2><a class="anchor" id="author-contact"></a>Author and Contact</h2>

**Shefali Deshpande**
Aspiring Data Analyst
Email : dshef20@gmail.com <br>
[LinkedIn][https://www.linkedin.com/in/shefali-deshpande/] <br>
[Portfolio][https://github.com/deshpandeshefali] 
