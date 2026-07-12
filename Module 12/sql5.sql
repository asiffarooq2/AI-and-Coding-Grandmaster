-- ============================================================
-- SQL Aggregate Functions
-- Activity: Library Book Collection
-- ============================================================

-- ---- PART 1: Build and Explore the Table ----

CREATE TABLE IF NOT EXISTS library_books (
    book_id      INTEGER PRIMARY KEY,
    title        TEXT NOT NULL,
    category     TEXT NOT NULL,
    pages        INTEGER NOT NULL,
    price        REAL NOT NULL
);

INSERT INTO library_books VALUES (1, 'Harry Potter', 'Fantasy', 320, 450.00);
INSERT INTO library_books VALUES (2, 'The Alchemist', 'Fiction', 208, 350.00);
INSERT INTO library_books VALUES (3, 'Atomic Habits', 'Self Help', 280, 550.00);
INSERT INTO library_books VALUES (4, 'Wings of Fire', 'Biography', 180, 300.00);
INSERT INTO library_books VALUES (5, 'The Hobbit', 'Fantasy', 295, 500.00);
INSERT INTO library_books VALUES (6, 'Rich Dad Poor Dad', 'Finance', 336, 400.00);
INSERT INTO library_books VALUES (7, 'Think Like a Monk', 'Self Help', 352, 480.00);
INSERT INTO library_books VALUES (8, 'The Great Gatsby', 'Fiction', 200, 320.00);

-- Display all books
SELECT * FROM library_books;

-- ---- PART 2: SELECT DISTINCT ----

-- All categories including duplicates
SELECT category
FROM library_books;

-- Display unique categories
SELECT DISTINCT category
FROM library_books;

-- Count unique categories
SELECT COUNT(DISTINCT category) AS unique_categories
FROM library_books;

-- ---- PART 3: COUNT ----

-- Total number of books
SELECT COUNT(book_id) AS total_books
FROM library_books;

-- Count books with more than 300 pages
SELECT COUNT(book_id) AS books_above_300_pages
FROM library_books
WHERE pages > 300;

-- ---- PART 4: SUM and AVG ----

-- Total price of all books
SELECT SUM(price) AS total_book_price
FROM library_books;

-- Average number of pages
SELECT AVG(pages) AS average_pages
FROM library_books;

-- ---- PART 5: Combining Aggregate Functions ----

SELECT
    COUNT(book_id) AS total_books,
    COUNT(DISTINCT category) AS unique_categories,
    SUM(price) AS total_book_price,
    AVG(pages) AS average_pages
FROM library_books;