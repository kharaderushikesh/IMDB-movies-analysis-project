-- MySQL data import instructions (replace file path with your server's file path)
-- Option 1: LOAD DATA INFILE (requires the CSV files to be accessible by MySQL server)
-- Example (ensure secure-file-priv is set appropriately or place files in the server's import directory):

LOAD DATA INFILE 'directors.csv'
INTO TABLE directors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(director_id, name, gender, department);

LOAD DATA INFILE 'movies.csv'
INTO TABLE movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(movie_id, original_title, title, popularity, budget, revenue, original_language, release_date, vote_average, vote_count, overview, tagline, uid, director_id);

-- Option 2: Use MySQL client or MySQL Workbench to import CSVs via GUI.
-- Option 3: Use a Python script with mysql-connector or SQLAlchemy to read CSV and insert rows.
