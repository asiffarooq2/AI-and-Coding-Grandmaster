-- ================================
-- STUDENT DATABASE
-- ================================

-- Create the STUDENT table
CREATE TABLE IF NOT EXISTS STUDENT (
    ROLL_NO TEXT PRIMARY KEY,
    NAME TEXT NOT NULL,
    ADDRESS TEXT,
    PHONE TEXT,
    AGE INTEGER
);

-- Insert sample records
INSERT INTO STUDENT (ROLL_NO, NAME, ADDRESS, PHONE, AGE) VALUES
('101', 'AARAV', 'MUMBAI', '9876543210', 19),
('102', 'PRIYA', 'PUNE', '9876543211', 18),
('103', 'KABIR', 'MUMBAI', '9876543212', 20),
('104', 'ANANYA', 'DELHI', '9876543213', 19),
('105', 'ROHAN', 'BENGALURU', '9876543214', 18),
('106', 'MEERA', 'PUNE', '9876543215', 20);

-- Display all student records
SELECT * FROM STUDENT;

-- Students who are 19 years old and live in Mumbai
SELECT *
FROM STUDENT
WHERE AGE = 19
AND ADDRESS = 'MUMBAI';

-- Students who are 18 years old and named PRIYA
SELECT *
FROM STUDENT
WHERE AGE = 18
AND NAME = 'PRIYA';

-- Students named AARAV or MEERA
SELECT *
FROM STUDENT
WHERE NAME = 'AARAV'
OR NAME = 'MEERA';

-- Students named KABIR or aged 20
SELECT *
FROM STUDENT
WHERE NAME = 'KABIR'
OR AGE = 20;

-- Students aged 19 and named either AARAV or ANANYA
SELECT *
FROM STUDENT
WHERE AGE = 19
AND (NAME = 'AARAV' OR NAME = 'ANANYA');