-- MySQL DDL for Project Movie Database
-- Adjust types if your CSV has different column names; this matches common columns found in the uploaded files.

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS directors;

CREATE TABLE directors (
  director_id INT PRIMARY KEY,
  name VARCHAR(255),
  gender INT,
  department VARCHAR(100)
);

CREATE TABLE movies (
  movie_id INT PRIMARY KEY,
  original_title VARCHAR(400),
  title VARCHAR(400),
  popularity DOUBLE,
  budget BIGINT,
  revenue BIGINT,
  original_language VARCHAR(20),
  release_date DATE,
  vote_average DOUBLE,
  vote_count INT,
  overview TEXT,
  tagline VARCHAR(400),
  uid INT,
  director_id INT,
  FOREIGN KEY (director_id) REFERENCES directors(director_id)
);
