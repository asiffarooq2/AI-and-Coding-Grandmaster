# ============================================================
# DSCM11L2 — Basic SQL Statements
# Activity: Football Data Explorer
# ============================================================

import sqlite3
import pandas as pd

# ---- PART 1: Build the Database ----

conn = sqlite3.connect("football.db")
cursor = conn.cursor()

cursor.executescript("""
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS Match_Result;
DROP TABLE IF EXISTS Player_Record;

CREATE TABLE Club (
    Club_Id INTEGER PRIMARY KEY,
    Club_Name TEXT
);

CREATE TABLE Match_Result (
    Match_Id INTEGER PRIMARY KEY,
    League_Season INTEGER,
    Winning_Club INTEGER,
    Goal_Difference INTEGER
);

CREATE TABLE Player_Record (
    Match_Id INTEGER,
    Player_Id INTEGER
);

INSERT INTO Club VALUES
(1,'Manchester United'),
(2,'Liverpool'),
(3,'Chelsea'),
(4,'Arsenal'),
(5,'Manchester City'),
(6,'Tottenham'),
(7,'Barcelona'),
(8,'Real Madrid');

INSERT INTO Match_Result VALUES
(1,2021,5,3),
(2,2021,2,1),
(3,2022,5,4),
(4,2022,1,2),
(5,2022,7,5),
(6,2022,8,2),
(7,2023,5,1),
(8,2023,4,2),
(9,2023,5,3),
(10,2023,2,4),
(11,2023,7,2),
(12,2023,8,1);

INSERT INTO Player_Record VALUES
(1,201),
(1,202),
(2,203),
(3,204),
(4,205),
(5,206);
""")

conn.commit()
print("Database Created Successfully!")

# ---- PART 2: View Tables ----

tables = pd.read_sql("""
SELECT *
FROM sqlite_master
WHERE type='table';
""", conn)

print(tables)

# Display Match_Result table
matches = pd.read_sql("""
SELECT *
FROM Match_Result;
""", conn)

print(matches)
print("Rows and Columns:", matches.shape)

# ---- PART 3: SELECT Statement ----

clubs = pd.read_sql("""
SELECT *
FROM Club;
""", conn)

print(clubs)

club_names = pd.read_sql("""
SELECT Club_Id, Club_Name
FROM Club;
""", conn)

print(club_names)

player_records = pd.read_sql("""
SELECT Match_Id, Player_Id
FROM Player_Record;
""", conn)

print(player_records)

# ---- PART 4: WHERE Clause ----

# Matches won by Manchester City (Club_Id = 5)
city_wins = pd.read_sql("""
SELECT *
FROM Match_Result
WHERE Winning_Club = 5;
""", conn)

print(city_wins)

# Manchester City wins in seasons 2022 and 2023
recent_city = pd.read_sql("""
SELECT *
FROM Match_Result
WHERE Winning_Club = 5
AND League_Season IN (2022, 2023);
""", conn)

print(recent_city)

# ---- PART 5: LIKE Clause ----

# Clubs starting with 'Man'
man_clubs = pd.read_sql("""
SELECT *
FROM Club
WHERE Club_Name LIKE 'Man%';
""", conn)

print(man_clubs)

# Clubs ending with 'Madrid'
madrid_clubs = pd.read_sql("""
SELECT *
FROM Club
WHERE Club_Name LIKE '%Madrid';
""", conn)

print(madrid_clubs)

# ---- PART 6: MIN() and MAX() ----

goal_difference = pd.read_sql("""
SELECT MIN(Goal_Difference), MAX(Goal_Difference)
FROM Match_Result;
""", conn)

print(goal_difference)

season_range = pd.read_sql("""
SELECT MIN(League_Season), MAX(League_Season)
FROM Match_Result;
""", conn)

print(season_range)

conn.close()