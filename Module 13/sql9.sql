# ============================================================
# Joins in SQL
# Activity: Book Library Explorer
# ============================================================

import sqlite3
import pandas as pd

# ---- PART 1: What is a JOIN - Build and Explore the Tables ----

conn = sqlite3.connect(':memory:')

conn.execute("""
CREATE TABLE author (
    author_id   INTEGER PRIMARY KEY,
    author_name TEXT NOT NULL UNIQUE
)
""")

conn.execute("""
CREATE TABLE book (
    book_id    INTEGER PRIMARY KEY,
    book_title TEXT NOT NULL,
    author_id  INTEGER
)
""")

conn.executemany("INSERT INTO author VALUES (?, ?)", [
    (1, 'Ruskin Bond'),
    (2, 'R.K. Narayan'),
    (3, 'Sudha Murty'),
    (4, 'Chetan Bhagat'),
    (5, 'Amish Tripathi'),
    (6, 'Arundhati Roy'),
])

conn.executemany("INSERT INTO book VALUES (?, ?, ?)", [
    (1, 'The Blue Umbrella', 1),
    (2, 'The Room on the Roof', 1),
    (3, 'Malgudi Days', 2),
    (4, 'Swami and Friends', 2),
    (5, 'Grandmas Bag of Stories', 3),
    (6, 'Wise and Otherwise', 3),
    (7, 'Five Point Someone', 4),
])

conn.commit()

authors = pd.read_sql("SELECT * FROM author", conn)
books = pd.read_sql("SELECT * FROM book", conn)

print("Author Table:")
print(authors)
print()

print("Book Table:")
print(books)
print()

# ---- PART 2: INNER JOIN ----

inner = pd.read_sql("""
SELECT author.author_name, book.book_title
FROM author
INNER JOIN book
ON author.author_id = book.author_id;
""", conn)

print("INNER JOIN - Authors and Their Books")
print(inner)
print()

# ---- PART 3: LEFT JOIN ----

left = pd.read_sql("""
SELECT author.author_name, book.book_title
FROM author
LEFT JOIN book
ON author.author_id = book.author_id;
""", conn)

print("LEFT JOIN - All Authors")
print(left)
print()

# ---- PART 4: CROSS JOIN ----

cross = pd.read_sql("""
SELECT author.author_name, book.book_title
FROM author
CROSS JOIN book
WHERE author.author_id <= 2;
""", conn)

print("CROSS JOIN - First Two Authors with Every Book")
print(cross)
print()

# ---- PART 5: UNION ----

union = pd.read_sql("""
SELECT author_name AS name, 'Author' AS type
FROM author

UNION

SELECT book_title AS name, 'Book' AS type
FROM book;
""", conn)

print("UNION - Authors and Book Titles")
print(union)

conn.close()