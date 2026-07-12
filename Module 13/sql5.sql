# ============================================================
# DSCM11L3 — SQL Statements Part 2
# Activity: Movie Database Explorer
# ============================================================

import sqlite3
import pandas as pd

conn = sqlite3.connect('movies.db')
cursor = conn.cursor()

cursor.executescript("""
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Actor;
DROP TABLE IF EXISTS Movie_Actor;

CREATE TABLE Movie (
    Movie_Id  INTEGER PRIMARY KEY,
    Title     TEXT,
    Genre     TEXT,
    Year      INTEGER,
    Rating    REAL,
    Duration  INTEGER
);

CREATE TABLE Actor (
    Actor_Id    INTEGER PRIMARY KEY,
    Actor_Name  TEXT,
    Birth_Year  INTEGER,
    Country     TEXT
);

CREATE TABLE Movie_Actor (
    Movie_Id  INTEGER,
    Actor_Id  INTEGER
);

INSERT INTO Movie VALUES
  (1,'Finding Nemo','Animation',2003,8.2,100),
  (2,'Cars','Animation',2006,7.1,117),
  (3,'Encanto','Animation',2021,7.3,102),
  (4,'The Incredibles','Animation',2004,8.0,115),
  (5,'Iron Man','Action',2008,7.9,126),
  (6,'Doctor Strange','Action',2016,7.5,115),
  (7,'Thor Ragnarok','Action',2017,7.9,130),
  (8,'The Pursuit of Happyness','Drama',2006,8.0,117),
  (9,'Night at the Museum','Comedy',2006,6.5,108),
  (10,'Jumanji','Comedy',2017,6.9,119),
  (11,'Soul','Animation',2020,8.1,100),
  (12,'The Martian','Drama',2015,8.0,144);

INSERT INTO Actor VALUES
  (1,'Chris Evans',1981,'USA'),
  (2,'Emma Watson',1990,'UK'),
  (3,'Robert Downey Jr.',1965,'USA'),
  (4,'Benedict Cumberbatch',1976,'UK'),
  (5,'Robin Williams',1951,'USA'),
  (6,'Ryan Reynolds',1976,'Canada'),
  (7,'Jennifer Lawrence',1990,'USA'),
  (8,'Tom Holland',1996,'UK'),
  (9,'Deepika Padukone',1986,'India'),
  (10,'Donnie Yen',1963,'China');

INSERT INTO Movie_Actor VALUES
  (1,2),
  (2,5),
  (5,3),
  (6,4),
  (7,8),
  (8,6),
  (9,5),
  (10,7),
  (11,2),
  (12,1);
""")

conn.commit()
print("Database ready!")

# ---- PART 2: DISTINCT ----

genres = pd.read_sql("""
SELECT DISTINCT(Genre)
FROM Movie;
""", conn)

print(genres)

countries = pd.read_sql("""
SELECT DISTINCT(Country)
FROM Actor;
""", conn)

print(countries)

# ---- PART 3: ORDER BY ----

top_movies = pd.read_sql("""
SELECT Title, Genre, Rating
FROM Movie
ORDER BY Rating DESC;
""", conn)

print(top_movies)

oldest_first = pd.read_sql("""
SELECT Title, Year
FROM Movie
ORDER BY Year;
""", conn)

print(oldest_first)

youngest_actors = pd.read_sql("""
SELECT Actor_Name, Birth_Year, Country
FROM Actor
ORDER BY Birth_Year DESC;
""", conn)

print(youngest_actors)

# ---- PART 4: COUNT and SUM ----

action_count = pd.read_sql("""
SELECT COUNT(Movie_Id)
FROM Movie
WHERE Genre = 'Action';
""", conn)

print(action_count)

animation_duration = pd.read_sql("""
SELECT SUM(Duration)
FROM Movie
WHERE Genre = 'Animation';
""", conn)

print(animation_duration)

# ---- PART 5: AVG ----

average_rating = pd.read_sql("""
SELECT AVG(Rating)
FROM Movie;
""", conn)

print(average_rating)

average_action_duration = pd.read_sql("""
SELECT AVG(Duration)
FROM Movie
WHERE Genre = 'Action';
""", conn)

print(average_action_duration)

# ---- PART 6: GROUP BY ----

movies_per_genre = pd.read_sql("""
SELECT Genre, COUNT(Movie_Id)
FROM Movie
GROUP BY Genre;
""", conn)

print(movies_per_genre)

average_genre_rating = pd.read_sql("""
SELECT Genre, AVG(Rating)
FROM Movie
GROUP BY Genre
ORDER BY AVG(Rating) DESC;
""", conn)

print(average_genre_rating)

conn.close()