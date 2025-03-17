CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT NOT NULL,
    grade VARCHAR(20) NOT NULL,
    enrollment_date DATE NOT NULL
    );
    
INSERT INTO students(first_name,last_name,email,age,grade,enrollment_date)
VALUES
('Aadhi','Rex','aadhi@gmail.com',18,'A+','2020-01-02'),
('Bakes','Kail','bakes@gmail.com',14,'A','2022-12-02'),
('Kevin','Laran','kevin@gmail.com',17,'O','2021-04-07'),
('Gail','Rock','gail@gmail.com',13,'A','2021-12-07'),
('Mathew','christ','mathew@gmail.com',21,'O','2023-05-12'),
('John','victor','john@gmail.com',22,'B+','2025-01-12');

select * from students;

/**To fetch all details of students whose age > 15**/
SELECT * from students
WHERE age > 15;

/**To fetch first_name,last_name of students whose age > 15**/
select first_name,last_name,age
FROM students
WHERE age > 15;

/**Update student**/
UPDATE students
SET grade ='A+'
WHERE id=3;

/**Delete Student**/
DELETE FROM students
where id=5;

/**To verify changes**/
select * from students;

/**Students enrolled in last 6 months**/
select * from students 
WHERE enrollment_date >= CURDATE() - INTERVAL 6 MONTH;

/**Students sorted by grade in descending order**/
select * from students ORDER BY grade DESC;
