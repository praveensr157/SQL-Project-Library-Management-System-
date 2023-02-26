create database Library_Management_System;

use Library_Management_System;

CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  author TEXT NOT NULL,
  year INTEGER NOT NULL,
  quantity INTEGER NOT NULL
);

CREATE TABLE members (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  membership_type TEXT NOT NULL
);

CREATE TABLE loans (
  id INTEGER PRIMARY KEY,
  book_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  loan_date DATE NOT NULL,
  return_date DATE NOT NULL,
  FOREIGN KEY (book_id) REFERENCES books (id),
  FOREIGN KEY (member_id) REFERENCES members (id)
);
INSERT INTO books (id, title, author, year, quantity)
VALUES
  (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 10),
  (2, 'Pride and Prejudice', 'Jane Austen', 1813, 5),
  (3, 'To Kill a Mockingbird', 'Harper Lee', 1960, 7),
  (4, 'The Catcher in the Rye', 'J.D. Salinger', 1951, 3),
  (5, 'The Alchemist', 'Paulo Coelho', 1988, 1),
  (6, 'Moby-Dick', 'Herman Melville', 1851, 2),
  (7, 'Wuthering Heights', 'Emily Brontë', 1847, 4),
  (8, 'The Picture of Dorian Gray', 'Oscar Wilde', 1890, 6);

INSERT INTO members (id, name, email, phone, membership_type)
VALUES
  (1, 'Alice Smith', 'alice@example.com', '123-456-7890', 'Basic'),
  (2, 'Bob Johnson', 'bob@example.com', '234-567-8901', 'Premium'),
  (3, 'Charlie Williams', 'charlie@example.com', '345-678-9012', 'Basic'),
  (4, 'Diane Brown', 'diane@example.com', '456-789-0123', 'Premium'),
  (5, 'Eve Davis', 'eve@example.com', '567-890-1234', 'Basic'),
  (6, 'Frank Rodriguez', 'frank@example.com', '678-901-2345', 'Basic'),
  (7, 'Grace Thompson', 'grace@example.com', '789-012-3456', 'Premium'),
  (8, 'Henry Moore', 'henry@example.com', '890-123-4567', 'Basic');

INSERT INTO loans (id, book_id, member_id, loan_date, return_date)
VALUES
  (1, 1, 1, '2022-01-01', '2022-01-07'),
  (2, 2, 2, '2022-01-01', '2022-01-07'),
  (3, 3, 3, '2022-01-01', '2022-01-07'),
  (4, 4, 4, '2022-01-01', '2022-01-07'),
  (5, 5, 5, '2022-01-01', '2022-01-07'),
  (6, 6, 6, '2022-01-01', '2022-01-07'),
  (7, 7, 7, '2022-01-01', '2022-01-07'),
  (8, 8, 8, '2022-01-01', '2022-01-07');
  
DELETE FROM loans WHERE book_id = 6 AND member_id = 6;

Select * from loans;



SELECT SUM(DATEDIFF(CURRENT_DATE, return_date)) as fine_due
FROM loans
WHERE member_id = 3 AND return_date < CURRENT_DATE;



SELECT 'mysql' dbms,t.TABLE_SCHEMA,t.TABLE_NAME,c.COLUMN_NAME,c.ORDINAL_POSITION,c.DATA_TYPE,c.CHARACTER_MAXIMUM_LENGTH,n.CONSTRAINT_TYPE,k.REFERENCED_TABLE_SCHEMA,k.REFERENCED_TABLE_NAME,k.REFERENCED_COLUMN_NAME FROM INFORMATION_SCHEMA.TABLES t LEFT JOIN INFORMATION_SCHEMA.COLUMNS c ON t.TABLE_SCHEMA=c.TABLE_SCHEMA AND t.TABLE_NAME=c.TABLE_NAME LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE k ON c.TABLE_SCHEMA=k.TABLE_SCHEMA AND c.TABLE_NAME=k.TABLE_NAME AND c.COLUMN_NAME=k.COLUMN_NAME LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS n ON k.CONSTRAINT_SCHEMA=n.CONSTRAINT_SCHEMA AND k.CONSTRAINT_NAME=n.CONSTRAINT_NAME AND k.TABLE_SCHEMA=n.TABLE_SCHEMA AND k.TABLE_NAME=n.TABLE_NAME WHERE t.TABLE_TYPE='BASE TABLE' AND t.TABLE_SCHEMA NOT IN('INFORMATION_SCHEMA','mysql','performance_schema');