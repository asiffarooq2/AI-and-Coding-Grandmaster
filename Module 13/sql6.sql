# ============================================================
# DSCM11L3 — SQL Statements Part 2
# Activity: Wildlife Park Records Analyzer
# ============================================================

import sqlite3
import pandas as pd

conn = sqlite3.connect('wildlife_park.db')
cursor = conn.cursor()

cursor.executescript("""
DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Keeper;
DROP TABLE IF EXISTS Animal_Keeper;

CREATE TABLE Animal (
    Animal_Id     INTEGER PRIMARY KEY,
    Animal_Name   TEXT,
    Animal_Type   TEXT,
    Habitat       TEXT,
    Age           INTEGER,
    Food_Kg       REAL
);

CREATE TABLE Keeper (
    Keeper_Id     INTEGER PRIMARY KEY,
    Keeper_Name   TEXT,
    Country       TEXT
);

CREATE TABLE Animal_Keeper (
    Animal_Id  INTEGER,
    Keeper_Id  INTEGER
);

INSERT INTO Animal VALUES
  (1,'Rocky','Mammal','Mountain',9,6.5),
  (2,'Lily','Bird','Forest',4,1.3),
  (3,'Coco','Reptile','Desert',7,2.4),
  (4,'Bruno','Mammal','Grassland',6,5.2),
  (5,'Sky','Bird','Wetland',3,1.0),
  (6,'Ruby','Mammal','Forest',5,4.8),
  (7,'Spike','Reptile','Swamp',8,2.8),
  (8,'Bella','Bird','Mountain',2,1.1),
  (9,'Oscar','Mammal','Grassland',10,7.2),
  (10,'Nova','Bird','Wetland',5,1.6),
  (11,'Shadow','Reptile','Desert',11,3.0),
  (12,'Daisy','Mammal','Forest',4,4.0);

INSERT INTO Keeper VALUES
  (1,'Rahul','India'),
  (2,'Emily','Australia'),
  (3,'John','USA'),
  (4,'Fatima','UAE'),
  (5,'Carlos','Brazil');

INSERT INTO Animal_Keeper VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,1),
  (5,2),
  (6,4),
  (7,5),
  (8,2),
  (9,1),
  (10,4);
""")

conn.commit()
print("Wildlife park database ready!")

# ---- PART 2: DISTINCT ----

animal_types = pd.read_sql("""
SELECT DISTINCT(Animal_Type)
FROM Animal;
""", conn)

print(animal_types)

habitats = pd.read_sql("""
SELECT DISTINCT(Habitat)
FROM Animal;
""", conn)

print(habitats)

# ---- PART 3: ORDER BY ----

oldest_animals = pd.read_sql("""
SELECT Animal_Name, Animal_Type, Age
FROM Animal
ORDER BY Age DESC;
""", conn)

print(oldest_animals)

food_order = pd.read_sql("""
SELECT Animal_Name, Food_Kg
FROM Animal
ORDER BY Food_Kg;
""", conn)

print(food_order)

keeper_names = pd.read_sql("""
SELECT Keeper_Name, Country
FROM Keeper
ORDER BY Keeper_Name;
""", conn)

print(keeper_names)

# ---- PART 4: COUNT and SUM ----

mammal_count = pd.read_sql("""
SELECT COUNT(Animal_Id)
FROM Animal
WHERE Animal_Type = 'Mammal';
""", conn)

print(mammal_count)

bird_food = pd.read_sql("""
SELECT SUM(Food_Kg)
FROM Animal
WHERE Animal_Type = 'Bird';
""", conn)

print(bird_food)

# ---- PART 5: AVG ----

average_age = pd.read_sql("""
SELECT AVG(Age)
FROM Animal;
""", conn)

print(average_age)

average_mammal_food = pd.read_sql("""
SELECT AVG(Food_Kg)
FROM Animal
WHERE Animal_Type = 'Mammal';
""", conn)

print(average_mammal_food)

# ---- PART 6: GROUP BY ----

animals_per_habitat = pd.read_sql("""
SELECT Habitat, COUNT(Animal_Id)
FROM Animal
GROUP BY Habitat;
""", conn)

print(animals_per_habitat)

average_age_per_habitat = pd.read_sql("""
SELECT Habitat, AVG(Age)
FROM Animal
GROUP BY Habitat
ORDER BY AVG(Age) DESC;
""", conn)

print(average_age_per_habitat)

conn.close()