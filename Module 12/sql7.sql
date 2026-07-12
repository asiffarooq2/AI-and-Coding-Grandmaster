-- ============================================================
-- SQL Sorting & Filtering
-- Activity: Movie Collection
-- ============================================================

-- ---- PART 1: Build and Explore the Table ----

CREATE TABLE IF NOT EXISTS movie (
    movie_id   INTEGER PRIMARY KEY,
    title      TEXT NOT NULL,
    genre      TEXT NOT NULL,
    rating     REAL NOT NULL,
    duration   INTEGER NOT NULL,
    release_year INTEGER NOT NULL
);

INSERT INTO movie VALUES (1, 'The Last Hero',      'Action',    8.7, 145, 2021);
INSERT INTO movie VALUES (2, 'Galaxy Wars',        'Sci-Fi',    9.3, 160, 2020);
INSERT INTO movie VALUES (3, 'Love Forever',       'Romance',   7.8, 130, 2019);
INSERT INTO movie VALUES (4, 'Mystery House',      'Thriller',  8.5, 120, 2022);
INSERT INTO movie VALUES (5, 'Fast Wheels',        'Action',    9.0, 150, 2023);
INSERT INTO movie VALUES (6, 'Alien Planet',       'Sci-Fi',    8.2, 155, 2021);
INSERT INTO movie VALUES (7, 'Dream Wedding',      'Romance',   8.9, 125, 2022);
INSERT INTO movie VALUES (8, 'Shadow Hunter',      'Action',    8.4, 140, 2020);

-- Display all movies
SELECT * FROM movie;

-- ---- PART 2: ORDER BY ----

-- Movies sorted by rating (lowest to highest)
SELECT title, rating
FROM movie
ORDER BY rating ASC;

-- Movies sorted by rating (highest to lowest)
SELECT title, rating
FROM movie
ORDER BY rating DESC;

-- Sort by genre, then highest rating within each genre
SELECT title, genre, rating
FROM movie
ORDER BY genre ASC, rating DESC;

-- ---- PART 3: LIMIT ----

-- Top 3 highest-rated movies
SELECT title, rating
FROM movie
ORDER BY rating DESC
LIMIT 3;

-- 5 oldest movies
SELECT title, release_year
FROM movie
ORDER BY release_year ASC
LIMIT 5;

-- ---- PART 4: GROUP BY ----

-- Number of movies in each genre
SELECT genre, COUNT(*) AS movie_count
FROM movie
GROUP BY genre;

-- Total duration and average rating for each genre
SELECT genre,
       SUM(duration) AS total_duration,
       AVG(rating) AS average_rating
FROM movie
GROUP BY genre;

-- ---- PART 5: HAVING ----

-- Genres with more than 2 movies
SELECT genre, COUNT(*) AS movie_count
FROM movie
GROUP BY genre
HAVING COUNT(*) > 2;

-- Genres with an average rating of at least 8.5
SELECT genre,
       AVG(rating) AS average_rating
FROM movie
GROUP BY genre
HAVING AVG(rating) >= 8.5;