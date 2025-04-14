CREATE DATABASE OLABODE_SQL;

-- Basic Analysis
-- (A)How many unique countries are represented in the dataset? 
SELECT COUNT(DISTINCT Country) AS unique_countries
FROM social_media_usage;

-- (B)What is the average employment rate across all countries?
SELECT AVG(Employment_Rate) AS avg_employment_rate
FROM social_media_usage;

-- SOCIAL TREND
-- (A)Which social media platform has the highest number of active users? 
SELECT  Platform, SUM(Active_Users) AS total_users
FROM social_media_usage
GROUP BY Platform
ORDER BY total_users DESC
LIMIT 10;

-- (B)Identify the country with the most active users on TikTok in 2023. 
SELECT Country, Active_Users
FROM social_media_usage
WHERE Platform = 'TikTok' AND Year = 2023
ORDER BY Active_Users DESC
LIMIT 1;

-- Employment vs. Social Media Usage
-- (A)Is there a correlation between employment rate and the number of active users? 
SELECT Employment_Rate, Active_Users
FROM social_media_usage;

-- (B)Find the country with the highest employment rate and check which social media platform is most popular there
-- Country with highest employment rate
SELECT Country, Employment_Rate
FROM Social_Media_Usage
ORDER BY Employment_Rate DESC
LIMIT 1;

-- Answer to (COUNTRY WITH HIGHEST EMPLOYMENT RATE & WHICH SOCIAL MEDIA IS COMMON IN THE SAID COUNTRY)
SELECT Country, Platform, Active_Users
FROM Social_Media_Usage
WHERE Country = (
    SELECT Country
    FROM Social_Media_Usage
    ORDER BY Employment_Rate DESC
    LIMIT 1
)
ORDER BY Active_Users DESC
LIMIT 1;

-- Time-Based Analysis
-- (A) How has social media usage changed over the years in India?
SELECT Year, SUM(Active_Users) AS total_users
FROM social_media_usage
WHERE Country = 'India'
GROUP BY Year
ORDER BY Year;

-- (B) What is the trend in employment rates for the USA from 2010 to 2025? 
SELECT Year, AVG(Employment_Rate) AS employment_rate
FROM social_media_usage
WHERE Country = 'USA' AND Year BETWEEN 2010 AND 2025
GROUP BY Year
ORDER BY Year;

-- Advanced Queries
-- (A) Group the data by country and calculate the total number of active users per country.
SELECT Country, SUM(Active_Users) AS total_users
FROM social_media_usage
GROUP BY Country
ORDER BY total_users DESC;

-- (B) Determine which country has the highest social media penetration rate (Active Users / Population). 
SELECT Country, SUM(Active_Users) / SUM(Population) AS penetration_rate
FROM social_media_usage
GROUP BY Country
ORDER BY penetration_rate DESC
LIMIT 1;




