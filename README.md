🎬 PRSQ-02 IMDB Movies Analysis (SQL Project)
📘 Overview

This project explores IMDb movie data using SQL to uncover insights about directors, movies, and industry trends.
It connects to a remote SQL database, merges the Directors and Movies tables, and performs analytical queries to answer key business questions such as:

Who are the most popular and bankable directors?

Which movies earned the most revenue or received the best ratings?

How many female directors are there in the IMDb dataset?

🧩 Dataset Description
🎥 Table 1: Movies
| Column Name    | Description                    |
| -------------- | ------------------------------ |
| ID             | Unique Movie ID                |
| Original_title | Official name of the movie     |
| Budget         | Total production budget        |
| Popularity     | IMDb popularity score          |
| Release_date   | Release date                   |
| Revenue        | Total revenue generated        |
| Title          | Initial working title          |
| Vote_average   | Average IMDb user rating       |
| Vote_count     | Total votes received           |
| Overview       | Short description of the movie |
| Tagline        | Promotional tagline            |
| UID            | Unique internal movie ID       |
| Director_ID    | Director ID (foreign key)      |

🎬 Table 2: Directors
| Column Name | Description                                          |
| ----------- | ---------------------------------------------------- |
| ID          | Unique Director ID                                   |
| Name        | Full name of the director                            |
| Gender      | Gender of the director (0/2 = Male, 1 = Female)      |
| Department  | Department or division (e.g., Directing, Production) |

🔗 Table Merging

We merge the tables using the Director_ID key:

SELECT 
    m.Original_title,
    m.Title,
    m.Budget,
    m.Revenue,
    m.Popularity,
    m.Vote_average,
    m.Vote_count,
    m.Release_date,
    d.Name AS Director_Name,
    d.Gender,
    d.Department
FROM movies m
JOIN directors d
ON m.Director_ID = d.ID;

🧠 SQL Problem Queries
-- Get all data about movies
SELECT * FROM movies;

-- Get all data about directors
SELECT * FROM directors;

-- Count total number of movies in IMDb
SELECT COUNT(*) AS Total_Movies FROM movies;

-- Find these 3 directors: James Cameron, Luc Besson, John Woo
SELECT * FROM directors WHERE Name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- Find all directors with names starting with ‘S’
SELECT * FROM directors WHERE Name LIKE 'S%';

-- Count female directors
SELECT COUNT(*) AS Female_Directors FROM directors WHERE Gender = 1;

-- Find the name of the 10th first women directors
SELECT Name FROM directors WHERE Gender = 1 ORDER BY Name LIMIT 1 OFFSET 9;

-- Top 3 most popular movies
SELECT Original_title, Popularity FROM movies ORDER BY Popularity DESC LIMIT 3;

-- Top 3 most bankable movies (highest revenue)
SELECT Original_title, Revenue FROM movies ORDER BY Revenue DESC LIMIT 3;

-- Highest average vote since Jan 1, 2000
SELECT Original_title, Vote_average, Release_date
FROM movies WHERE Release_date >= '2000-01-01'
ORDER BY Vote_average DESC LIMIT 1;

-- Movies directed by Brenda Chapman
SELECT Original_title, Release_date
FROM movies m JOIN directors d ON m.Director_ID = d.ID
WHERE d.Name = 'Brenda Chapman';

-- Director who made the most movies
SELECT d.Name, COUNT(m.ID) AS Total_Movies
FROM movies m JOIN directors d ON m.Director_ID = d.ID
GROUP BY d.Name
ORDER BY Total_Movies DESC LIMIT 1;

-- Most bankable director (highest total revenue)
SELECT d.Name, SUM(m.Revenue) AS Total_Revenue
FROM movies m JOIN directors d ON m.Director_ID = d.ID
GROUP BY d.Name
ORDER BY Total_Revenue DESC LIMIT 1;

📊 Insights & Findings
Metric	Insight
🎬 Total Movies	Shows the total number of records in IMDb dataset
👩‍🎬 Female Directors	Measures gender diversity in film direction
💸 Most Bankable Movie	Reveals highest-grossing films
🏆 Highest Rated Movie	Highlights the top-rated movies after 2000
🎥 Director with Most Movies	Identifies the most prolific filmmaker
💰 Most Bankable Director	Indicates directors generating highest revenue
📈 Visualization Ideas

Use Power BI or Tableau to visualize:

Top 10 Directors by Revenue

Gender Distribution of Directors

Movie Ratings vs Revenue

Popularity vs Vote Average

Yearly Movie Releases Trend

⚙️ Tools Used

🗄️ MySQL / SQL Workbench — for query execution

📊 Power BI / Tableau — for data visualization

💻 GitHub — for project documentation and version control


🏁 Conclusion

This SQL project demonstrates the use of data exploration and analysis techniques to extract insights from IMDb movie data.
By merging and analyzing the Movies and Directors datasets, it identifies the most successful directors, popular movies, and key metrics such as gender distribution and audience ratings.


🏷️ Tags

#SQL #IMDb #DataAnalytics #Movies #PowerBI #Datamites #DataScience #Project
