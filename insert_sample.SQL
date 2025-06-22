-- Insert into customers
INSERT INTO customers VALUES
(1, 35, 'admin.', 'married', 'tertiary', 'cellular'),
(2, 42, 'technician', 'single', 'secondary', 'cellular'),
(3, 29, 'blue-collar', 'married', 'primary', 'telephone'),
(4, 50, 'retired', 'divorced', 'tertiary', 'cellular'),
(5, 38, 'management', 'single', 'tertiary', 'unknown');

-- Insert into products
INSERT INTO products VALUES
(1, 'Term Deposit', 'deposit'),
(2, 'Housing Loan', 'loan'),
(3, 'Personal Loan', 'loan'),
(4, 'Credit Card', 'credit'),
(5, 'Insurance', 'policy');

-- Insert into campaigns
INSERT INTO campaigns VALUES
(101, 1, '2023-06-12', 180, 'Monday', 'June', 'cellular', 1),
(102, 2, '2023-06-15', 90, 'Thursday', 'June', 'telephone', 2),
(103, 3, '2023-06-18', 240, 'Sunday', 'June', 'cellular', 1),
(104, 4, '2023-06-20', 300, 'Tuesday', 'June', 'cellular', 3),
(105, 5, '2023-06-25', 60, 'Saturday', 'June', 'unknown', 4);

-- Insert into responses
INSERT INTO responses VALUES
(1001, 101, 'yes'),
(1002, 102, 'no'),
(1003, 103, 'yes'),
(1004, 104, 'no'),
(1005, 105, 'yes');
