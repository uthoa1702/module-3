CREATE DATABASE student_management;
USE student_management;
CREATE TABLE class (
    id INT PRIMARY KEY,
    `name` VARCHAR(50)
);
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
SELECT 
    *
FROM
    class;
SELECT 
    `name`
FROM
    class;
DROP TABLE class;
INSERT INTO class VALUES (1,"c01"), 
(2,"c02"), 
(3,"c03");
INSERT INTO teacher VALUE (1,"Hoa", 22, "Vie");
SELECT 
    *
FROM
    teacher;
