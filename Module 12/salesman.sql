-- Create Salesman Table
CREATE TABLE IF NOT EXISTS Salesman (
    Salesman_id TEXT PRIMARY KEY,
    name TEXT,
    city TEXT,
    Comission REAL
);

-- Insert Data into Salesman
INSERT INTO Salesman (Salesman_id, name, city, Comission) VALUES
('5001', 'James Hoog', 'New York', 0.15),
('5002', 'Nail Knite', 'Paris', 0.13),
('5005', 'Pit Alex', 'London', 0.11),
('5006', 'Mc Lyon', 'Paris', 0.14),
('5007', 'Paul Adam', 'Rome', 0.13),
('5003', 'Lauson Hen', 'San Jose', 0.12);

-- Display Salesman Table
SELECT * FROM Salesman;

-- Create Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    ord_no TEXT PRIMARY KEY,
    purch_amt REAL,
    ord_date TEXT,
    customer_id TEXT,
    Salesman_id TEXT
);

-- Insert Data into Orders
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, Salesman_id) VALUES
('70001', 150.50, '2012-10-05', '3005', '5002'),
('70009', 270.65, '2012-09-10', '3001', '5001'),
('70002', 65.26, '2012-10-05', '3002', '5003'),
('70004', 110.50, '2012-08-17', '3009', '5007'),
('70007', 948.50, '2012-09-10', '3005', '5005'),
('70005', 2400.60, '2012-07-27', '3007', '5006');

-- Display Orders Table
SELECT * FROM Orders;

-- Display Salesman Name and Commission
SELECT name, Comission
FROM Salesman;