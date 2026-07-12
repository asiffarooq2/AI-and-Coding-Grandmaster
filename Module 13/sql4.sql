# ============================================================
# DSCM11L2 — Basic SQL Statements
# Activity: Library Book Finder
# Grade 4–6 | Jr
# ============================================================

import sqlite3
import pandas as pd

conn = sqlite3.connect('library.db')
cursor = conn.cursor()

cursor.executescript("""
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Book_Loan;

CREATE TABLE Book (
    Book_Id          INTEGER PRIMARY KEY,
    Book_Title       TEXT,
    Author           TEXT,
    Category         TEXT,
    Pages            INTEGER,
    Copies_Available INTEGER
);

CREATE TABLE Member (
    Member_Id   INTEGER PRIMARY KEY,
    Member_Name TEXT
);

CREATE TABLE Book_Loan (
    Loan_Id   INTEGER PRIMARY KEY,
    Book_Id   INTEGER,
    Member_Id INTEGER
);

INSERT INTO Book VALUES
  (1, 'The Lost Treasure', 'Amit Verma', 'Adventure', 280, 5),
  (2, 'Fun with Numbers', 'Priya Sharma', 'Education', 160, 6),
  (3, 'The Solar System', 'Rohan Kapoor', 'Science', 210, 4),
  (4, 'World History', 'Anjali Gupta', 'History', 340, 3),
  (5, 'The Magic Forest', 'Sneha Patel', 'Fiction', 295, 7),
  (6, 'Easy Grammar', 'Meena Joshi', 'Education', 180, 5),
  (7, 'Animal Kingdom', 'Karan Singh', 'Science', 250, 2),
  (8, 'The Brave Knight', 'Rahul Mehta', 'Fiction', 320, 4);

INSERT INTO Member VALUES
  (1, 'Riya'),
  (2, 'Arjun'),
  (3, 'Ananya'),
  (4, 'Vivaan');

INSERT INTO Book_Loan VALUES
  (1, 2, 1),
  (2, 5, 2),
  (3, 8, 3),
  (4, 3, 4);
""")

conn.commit()

print("Library database ready!")

# ---- PART 2: See All Tables ----

tables = pd.read_sql("""
SELECT *
FROM sqlite_master
WHERE type='table';
""", conn)

print(tables)

books = pd.read_sql("""
SELECT *
FROM Book;
""", conn)

print(books)
print("Rows and Columns:", books.shape)

# ---- PART 3: SELECT ----

all_books = pd.read_sql("""
SELECT *
FROM Book;
""", conn)

print(all_books)

book_details = pd.read_sql("""
SELECT Book_Id, Book_Title, Author
FROM Book;
""", conn)

print(book_details)

loan_details = pd.read_sql("""
SELECT Book_Id, Member_Id
FROM Book_Loan;
""", conn)

print(loan_details)

# ---- PART 4: WHERE ----

science_books = pd.read_sql("""
SELECT *
FROM Book
WHERE Category = 'Science';
""", conn)

print(science_books)

available_books = pd.read_sql("""
SELECT *
FROM Book
WHERE Category IN ('Fiction', 'History')
AND Copies_Available > 0;
""", conn)

print(available_books)

# ---- PART 5: LIKE ----

the_books = pd.read_sql("""
SELECT *
FROM Book
WHERE Book_Title LIKE 'The%';
""", conn)

print(the_books)

book_titles = pd.read_sql("""
SELECT *
FROM Book
WHERE Book_Title LIKE '%Knight';
""", conn)

print(book_titles)

# ---- PART 6: MIN() and MAX() ----

page_range = pd.read_sql("""
SELECT MIN(Pages), MAX(Pages)
FROM Book;
""", conn)

print(page_range)

copy_range = pd.read_sql("""
SELECT MIN(Copies_Available), MAX(Copies_Available)
FROM Book;
""", conn)

print(copy_range)

conn.close()