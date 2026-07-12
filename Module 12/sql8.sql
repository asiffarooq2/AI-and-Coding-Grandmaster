-- ============================================================
-- SQL Sorting & Filtering
-- Activity: Restaurant Menu Explorer
-- ============================================================

-- ---- PART 1: Build and Explore the Table ----

CREATE TABLE IF NOT EXISTS restaurant_menu (
    item_id      INTEGER PRIMARY KEY,
    item_name    TEXT NOT NULL,
    category     TEXT NOT NULL,
    price        REAL NOT NULL,
    orders       INTEGER NOT NULL,
    prep_time    INTEGER NOT NULL
);

INSERT INTO restaurant_menu VALUES (1, 'Veg Burger',      'Fast Food', 120, 45, 15);
INSERT INTO restaurant_menu VALUES (2, 'Chicken Pizza',   'Fast Food', 350, 60, 25);
INSERT INTO restaurant_menu VALUES (3, 'Pasta Alfredo',   'Italian',   280, 30, 20);
INSERT INTO restaurant_menu VALUES (4, 'Caesar Salad',    'Healthy',   180, 22, 10);
INSERT INTO restaurant_menu VALUES (5, 'Paneer Tikka',    'Indian',    260, 55, 18);
INSERT INTO restaurant_menu VALUES (6, 'Butter Chicken',  'Indian',    420, 70, 30);
INSERT INTO restaurant_menu VALUES (7, 'Chocolate Cake',  'Dessert',   150, 40, 12);
INSERT INTO restaurant_menu VALUES (8, 'Ice Cream Sundae','Dessert',   140, 35, 8);
INSERT INTO restaurant_menu VALUES (9, 'Garlic Bread',    'Italian',   160, 28, 10);

-- Display all menu items
SELECT * FROM restaurant_menu;

-- ============================================================
-- PART 2: ORDER BY
-- ============================================================

-- Sort menu items by number of orders (lowest first)
SELECT item_name, orders
FROM restaurant_menu
ORDER BY orders ASC;

-- Sort menu items by number of orders (highest first)
SELECT item_name, orders
FROM restaurant_menu
ORDER BY orders DESC;

-- Sort by category, then highest orders first
SELECT item_name, category, orders
FROM restaurant_menu
ORDER BY category ASC, orders DESC;

-- ============================================================
-- PART 3: LIMIT
-- ============================================================

-- Top 3 most ordered items
SELECT item_name, orders
FROM restaurant_menu
ORDER BY orders DESC
LIMIT 3;

-- 5 quickest items to prepare
SELECT item_name, prep_time
FROM restaurant_menu
ORDER BY prep_time ASC
LIMIT 5;

-- ============================================================
-- PART 4: GROUP BY
-- ============================================================

-- Number of items in each category
SELECT category, COUNT(*) AS item_count
FROM restaurant_menu
GROUP BY category;

-- Total orders and average preparation time for each category
SELECT category,
       SUM(orders) AS total_orders,
       AVG(prep_time) AS average_prep_time
FROM restaurant_menu
GROUP BY category;

-- ============================================================
-- PART 5: HAVING
-- ============================================================

-- Categories with more than one menu item
SELECT category, COUNT(*) AS item_count
FROM restaurant_menu
GROUP BY category
HAVING COUNT(*) > 1;

-- Categories with an average of at least 40 orders
SELECT category,
       AVG(orders) AS average_orders
FROM restaurant_menu
GROUP BY category
HAVING AVG(orders) >= 40;