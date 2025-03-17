CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books(
	book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
    );

INSERT INTO books (title, author, published_year, genre, price) 
VALUES
('The Space', 'Paul', 1988, 'Fiction', 499.99),
('Atomic Habits', 'James Clear', 2018, 'Self-help', 799.50),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Classic', 599.00),
('The Silent Patient', 'Alex Michaelides', 2019, 'Thriller', 699.75),
('Rich Dad Poor Dad', 'Robert Kiyosaki', 1997, 'Finance', 399.25);

select * from books;

SELECT * FROM books
WHERE price > 500;

UPDATE books
SET price = 800
WHERE published_year=2019;

DELETE FROM books
WHERE genre='Thriller';