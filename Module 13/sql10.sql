# ============================================================
# Joins in SQL
# Activity: Travel Destination Explorer
# ============================================================

import sqlite3
import pandas as pd

# ---- PART 1: What is a JOIN - Build and Explore the Tables ----

# Create an in-memory database.
conn = sqlite3.connect(':memory:')

# Create destination table.
conn.execute("""
CREATE TABLE destination (
    destination_id   INTEGER PRIMARY KEY,
    destination_name TEXT NOT NULL UNIQUE,
    country          TEXT NOT NULL
)
""")

# Create attraction table.
conn.execute("""
CREATE TABLE attraction (
    attraction_id   INTEGER PRIMARY KEY,
    attraction_name TEXT NOT NULL,
    destination_id  INTEGER
)
""")

# Insert destination records.
conn.executemany("INSERT INTO destination VALUES (?, ?, ?)", [
    (1, 'London', 'United Kingdom'),
    (2, 'New York', 'USA'),
    (3, 'Singapore', 'Singapore'),
    (4, 'Cape Town', 'South Africa'),
    (5, 'Bangkok', 'Thailand'),
    (6, 'Barcelona', 'Spain'),
])

# Insert attraction records.
conn.executemany("INSERT INTO attraction VALUES (?, ?, ?)", [
    (1, 'Big Ben', 1),
    (2, 'London Eye', 1),
    (3, 'Statue of Liberty', 2),
    (4, 'Central Park', 2),
    (5, 'Marina Bay Sands', 3),
    (6, 'Table Mountain', 4),
    (7, 'Grand Palace', 5),
])

conn.commit()

# Display both tables.
destinations = pd.read_sql("SELECT * FROM destination", conn)
attractions = pd.read_sql("SELECT * FROM attraction", conn)

print("Destination Table:")
print(destinations)
print()

print("Attraction Table:")
print(attractions)
print()

# ---- PART 2: INNER JOIN ----

inner = pd.read_sql("""
SELECT destination.destination_name,
       destination.country,
       attraction.attraction_name
FROM destination
INNER JOIN attraction
ON destination.destination_id = attraction.destination_id;
""", conn)

print("INNER JOIN - Destinations with Attractions")
print(inner)
print()

# ---- PART 3: LEFT JOIN ----

left = pd.read_sql("""
SELECT destination.destination_name,
       destination.country,
       attraction.attraction_name
FROM destination
LEFT JOIN attraction
ON destination.destination_id = attraction.destination_id;
""", conn)

print("LEFT JOIN - All Destinations")
print(left)
print()

# ---- PART 4: CROSS JOIN ----

cross = pd.read_sql("""
SELECT destination.destination_name,
       attraction.attraction_name
FROM destination
CROSS JOIN attraction
WHERE destination.destination_id <= 2;
""", conn)

print("CROSS JOIN - First Two Destinations with Every Attraction")
print(cross)
print()

# ---- PART 5: UNION ----

union = pd.read_sql("""
SELECT destination_name AS name,
       'Destination' AS type
FROM destination

UNION

SELECT attraction_name AS name,
       'Attraction' AS type
FROM attraction;
""", conn)

print("UNION - Destinations and Attractions")
print(union)

conn.close()