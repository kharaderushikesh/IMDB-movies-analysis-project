-- Queries for the project tasks (MySQL syntax)

-- a) Get all data about movies
SELECT * FROM movies;

-- b) Get all data about directors
SELECT * FROM directors;

-- c) Check how many movies are present in IMDB
SELECT COUNT(*) AS total_movies FROM movies;

-- d) Find these 3 directors: James Cameron, Luc Besson, John Woo
SELECT * FROM directors WHERE name IN ('James Cameron','Luc Besson','John Woo');

-- e) Find all directors with name starting with S
SELECT * FROM directors WHERE name LIKE 'S%';

-- f) Count female directors (assuming gender=1 is female)
SELECT COUNT(*) AS female_directors FROM directors WHERE gender = 1;

-- g) Find the name of the 10th first women directors (alphabetically by name)
SELECT name FROM directors WHERE gender = 1 ORDER BY name LIMIT 1 OFFSET 9;

-- h) What are the 3 most popular movies?
SELECT original_title, popularity FROM movies ORDER BY popularity DESC LIMIT 3;

-- i) What are the 3 most bankable movies?
SELECT original_title, revenue FROM movies ORDER BY revenue DESC LIMIT 3;

-- j) What is the most awarded average vote since January 1, 2000?
SELECT original_title, vote_average, release_date FROM movies WHERE release_date >= '2000-01-01' ORDER BY vote_average DESC LIMIT 3;

-- k) Which movie(s) were directed by Brenda Chapman?
SELECT m.* FROM movies m JOIN directors d ON m.director_id = d.director_id WHERE d.name = 'Brenda Chapman';

-- l) Which director made the most movies?
SELECT d.name, COUNT(m.movie_id) AS movie_count
FROM movies m JOIN directors d ON m.director_id = d.director_id
GROUP BY d.name ORDER BY movie_count DESC LIMIT 1;

-- m) Which director is the most bankable (by total revenue)?
SELECT d.name, SUM(m.revenue) AS total_revenue
FROM movies m JOIN directors d ON m.director_id = d.director_id
GROUP BY d.name ORDER BY total_revenue DESC LIMIT 5;

-- Optional: create a view joining movies with director info
CREATE OR REPLACE VIEW movie_director_view AS
SELECT m.movie_id, m.original_title, m.popularity, m.revenue, m.release_date, d.director_id, d.name AS director_name
FROM movies m JOIN directors d ON m.director_id = d.director_id;
