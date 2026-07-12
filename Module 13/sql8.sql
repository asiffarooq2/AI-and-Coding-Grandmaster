# ============================================================
# SQL Constraints
# Activity: Sports Team Player Database
# ============================================================

import sqlite3
import pandas as pd

conn = sqlite3.connect('sports_team.db')

conn.execute("DROP TABLE IF EXISTS Player;")

conn.execute("""
CREATE TABLE Player (
    Player_Id     INTEGER PRIMARY KEY,
    Player_Name   TEXT NOT NULL UNIQUE,
    Team_Name     TEXT NOT NULL,
    Jersey_Number INTEGER,
    Is_Captain    TEXT DEFAULT 'No'
);
""")

conn.commit()
print("Table created successfully!")

# ---- PART 2: INSERT DATA ----

conn.execute("INSERT INTO Player VALUES (1, 'Rahul', 'Warriors', 9, 'Yes');")
conn.execute("INSERT INTO Player VALUES (2, 'Sneha', 'Warriors', 14, 'No');")
conn.execute("INSERT INTO Player VALUES (3, 'Karan', 'Titans', 10, 'Yes');")
conn.execute("INSERT INTO Player VALUES (4, 'Pooja', 'Titans', 5, 'No');")
conn.execute("INSERT INTO Player VALUES (5, 'Vikram', 'Falcons', 18, 'No');")

# Is_Captain will use the DEFAULT value ('No')
conn.execute("""
INSERT INTO Player (Player_Id, Player_Name, Team_Name)
VALUES (6, 'Nisha', 'Falcons');
""")

conn.commit()
print("Rows inserted successfully!")

players = pd.read_sql("""
SELECT *
FROM Player;
""", conn)

print(players)

# ---- PART 3: PRIMARY KEY ----

print("\n--- Testing PRIMARY KEY ---")

try:
    conn.execute("""
    INSERT INTO Player
    VALUES (1, 'Rohit', 'Panthers', 8, 'No');
    """)
    conn.commit()

except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("Player_Id 1 already belongs to Rahul.")

# ---- PART 4: NOT NULL and UNIQUE ----

print("\n--- Testing NOT NULL ---")

try:
    conn.execute("""
    INSERT INTO Player
    VALUES (7, 'Aditi', NULL, 6, 'No');
    """)
    conn.commit()

except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("Team_Name cannot be NULL.")

print("\n--- Testing UNIQUE ---")

try:
    conn.execute("""
    INSERT INTO Player
    VALUES (8, 'Rahul', 'Panthers', 12, 'No');
    """)
    conn.commit()

except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("Player_Name must be unique.")

# ---- PART 5: DEFAULT ----

print("\n--- DEFAULT Value Example ---")

nisha = pd.read_sql("""
SELECT Player_Name, Team_Name, Is_Captain
FROM Player
WHERE Player_Name = 'Nisha';
""", conn)

print(nisha)

print("DEFAULT value 'No' was assigned automatically.")

# ---- PART 6: NULL VALUES ----

print("\n--- Jersey Number Data ---")

all_players = pd.read_sql("""
SELECT Player_Name, Team_Name, Jersey_Number
FROM Player;
""", conn)

print(all_players)

missing = pd.read_sql("""
SELECT Player_Name
FROM Player
WHERE Jersey_Number IS NULL;
""", conn)

print("\nPlayers with no jersey number:")
print(missing)

available = pd.read_sql("""
SELECT Player_Name, Jersey_Number
FROM Player
WHERE Jersey_Number IS NOT NULL;
""", conn)

print("\nPlayers with jersey numbers:")
print(available)

conn.close()