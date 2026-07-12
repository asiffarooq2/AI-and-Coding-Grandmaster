# ============================================================
# SQL Constraints
# Activity: World Cities Database
# ============================================================

import sqlite3
import pandas as pd

conn = sqlite3.connect('cities.db')

conn.execute("DROP TABLE IF EXISTS City;")

conn.execute("""
CREATE TABLE City (
    City_Id    INTEGER PRIMARY KEY,
    City_Name  TEXT NOT NULL UNIQUE,
    Country    TEXT NOT NULL,
    Population INTEGER,
    Is_Capital TEXT DEFAULT 'No'
);
""")

conn.commit()
print("Table created successfully!")

# ---- PART 2: INSERT DATA ----

conn.execute("INSERT INTO City VALUES (1, 'Paris', 'France', 2148000, 'Yes');")
conn.execute("INSERT INTO City VALUES (2, 'Dubai', 'UAE', 3559000, 'No');")
conn.execute("INSERT INTO City VALUES (3, 'Beijing', 'China', 21540000, 'Yes');")
conn.execute("INSERT INTO City VALUES (4, 'Toronto', 'Canada', 2930000, 'No');")
conn.execute("INSERT INTO City VALUES (5, 'Rome', 'Italy', 2873000, 'Yes');")

# Is_Capital will use the DEFAULT value ('No')
conn.execute("""
INSERT INTO City (City_Id, City_Name, Country)
VALUES (6, 'Barcelona', 'Spain');
""")

conn.commit()
print("Rows inserted successfully!")

cities = pd.read_sql("""
SELECT *
FROM City;
""", conn)

print(cities)

# ---- PART 3: PRIMARY KEY ----

print("\n--- Testing PRIMARY KEY ---")

try:
    conn.execute("""
    INSERT INTO City
    VALUES (1, 'Athens', 'Greece', 3153000, 'Yes');
    """)
    conn.commit()

except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("City_Id 1 already belongs to Paris.")

# ---- PART 4: NOT NULL and UNIQUE ----

print("\n--- Testing NOT NULL ---")

try:
    conn.execute("""
    INSERT INTO City
    VALUES (7, 'Seoul', NULL, 9776000, 'Yes');
    """)
    conn.commit()

except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("Country cannot be NULL.")

print("\n--- Testing UNIQUE ---")

try:
    conn.execute("""
    INSERT INTO City
    VALUES (8, 'Paris', 'France', 2000000, 'No');
    """)
    conn.commit()

except Exception as e:
    conn.rollback()
    print("Rejected:", e)
    print("City_Name must be unique.")

# ---- PART 5: DEFAULT ----

print("\n--- DEFAULT Value Example ---")

barcelona = pd.read_sql("""
SELECT City_Name, Country, Is_Capital
FROM City
WHERE City_Name = 'Barcelona';
""", conn)

print(barcelona)

print("DEFAULT value 'No' was assigned automatically.")

# ---- PART 6: NULL VALUES ----

print("\n--- Population Data ---")

all_cities = pd.read_sql("""
SELECT City_Name, Country, Population
FROM City;
""", conn)

print(all_cities)

missing_population = pd.read_sql("""
SELECT City_Name
FROM City
WHERE Population IS NULL;
""", conn)

print("\nCities with no population data:")
print(missing_population)

available_population = pd.read_sql("""
SELECT City_Name, Population
FROM City
WHERE Population IS NOT NULL;
""", conn)

print("\nCities with population data:")
print(available_population)

conn.close()