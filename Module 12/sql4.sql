-- ================================
-- PART 1: Create and Explore the PRODUCT Table
-- ================================

DROP TABLE IF EXISTS PRODUCT;

CREATE TABLE PRODUCT (
    PRO_ID      TEXT PRIMARY KEY,
    PRO_NAME    TEXT NOT NULL,
    PRO_PRICE   INTEGER NOT NULL,
    PRO_BRAND   TEXT NOT NULL
);

-- Insert sample products
INSERT INTO PRODUCT (PRO_ID, PRO_NAME, PRO_PRICE, PRO_BRAND) VALUES
('201', 'LAPTOP',         45000, 'DELL'),
('202', 'SMARTPHONE',     25000, 'SAMSUNG'),
('203', 'TABLET',         18000, 'LENOVO'),
('204', 'HEADPHONES',      2500, 'SONY'),
('205', 'SMART WATCH',     8000, 'BOAT'),
('206', 'WEBCAM',          3200, 'LOGITECH'),
('207', 'MICROPHONE',      4500, 'BOYA'),
('208', 'POWER BANK',      1500, 'MI'),
('209', 'BLUETOOTH SPEAKER', 3500, 'JBL'),
('210', 'USB HUB',          900, 'HP');

-- Display all products
SELECT * FROM PRODUCT;

-- ================================
-- PART 2: AND and OR Clause
-- ================================

-- Products below ₹5000 AND made by LOGITECH
SELECT *
FROM PRODUCT
WHERE PRO_PRICE < 5000
AND PRO_BRAND = 'LOGITECH';

-- Products made by BOAT OR priced above ₹20000
SELECT *
FROM PRODUCT
WHERE PRO_BRAND = 'BOAT'
OR PRO_PRICE > 20000;

-- Products below ₹5000 that are either HP or JBL products
SELECT *
FROM PRODUCT
WHERE PRO_PRICE < 5000
AND (PRO_BRAND = 'HP' OR PRO_BRAND = 'JBL');

-- ================================
-- PART 3: LIKE Clause
-- ================================

-- Product names starting with S
SELECT *
FROM PRODUCT
WHERE PRO_NAME LIKE 'S%';

-- Product names ending with BANK
SELECT *
FROM PRODUCT
WHERE PRO_NAME LIKE '%BANK';

-- Product names containing PHONE
SELECT *
FROM PRODUCT
WHERE PRO_NAME LIKE '%PHONE%';

-- ================================
-- PART 4: MIN() and MAX()
-- ================================

-- Lowest-priced product
SELECT PRO_NAME, PRO_PRICE
FROM PRODUCT
WHERE PRO_PRICE = (
    SELECT MIN(PRO_PRICE)
    FROM PRODUCT
);

-- Highest-priced product
SELECT PRO_NAME, PRO_PRICE
FROM PRODUCT
WHERE PRO_PRICE = (
    SELECT MAX(PRO_PRICE)
    FROM PRODUCT
);

-- ================================
-- PART 5: UPDATE Query
-- ================================

-- Update the price of the Headphones
UPDATE PRODUCT
SET PRO_PRICE = 2800
WHERE PRO_ID = '204';

-- Display updated record
SELECT *
FROM PRODUCT
WHERE PRO_ID = '204';

-- ================================
-- PART 6: DELETE Query
-- ================================

-- Delete the Tablet
DELETE FROM PRODUCT
WHERE PRO_ID = '203';

-- Display remaining records
SELECT * FROM PRODUCT;