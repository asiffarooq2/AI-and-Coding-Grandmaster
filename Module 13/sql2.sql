# ==========================================
# IMPORT SQLITE DATABASE
# ==========================================

# Step 1: Upload the database file
from google.colab import files

uploaded_file = files.upload()

# Step 2: Import required libraries
import sqlite3
import pandas as pd

# Step 3: Connect to the SQLite database
db_file = "database.sqlite"

connection = sqlite3.connect(db_file)
print("Database connected successfully!")

# Step 4: Display all tables in the database
query = """
SELECT *
FROM sqlite_master
WHERE type = 'table';
"""

table_list = pd.read_sql(query, connection)

# Display the tables
table_list