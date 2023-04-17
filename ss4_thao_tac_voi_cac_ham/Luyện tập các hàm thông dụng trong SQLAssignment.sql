CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(45) NOT NULL,
    StartDate DATE NOT NULL,
    `Status` BIT
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(12),
    `Status` BIT,
    ClassID INT,
    FOREIGN KEY (ClassID)
        REFERENCES Class (ClassID)
);

CREATE TABLE `Subject` (
    SubID INT PRIMARY KEY,
    SubName VARCHAR(50) NOT NULL,
    Credit INT NOT NULL,
    `Status` BIT
);

CREATE TABLE Mark (
    MarkID INT PRIMARY KEY AUTO_INCREMENT,
    SubID INT,
    FOREIGN KEY (SubID)
        REFERENCES `Subject` (SubID),
    StudentID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student (StudentID),
    Mark INT,
    ExamTimes INT
);


INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);


INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);


INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
       
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       
       
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * 
FROM `subject`;

SELECT SubName, Credit
FROM `subject`
WHERE credit = (SELECT MAX(credit) FROM `subject`);

-- --------- Hiển thị các thông tin môn học có điểm thi lớn nhất.

SELECT s.subname, m.mark
FROM mark m
INNER JOIN `subject` s
ON m.subid = s.subid
WHERE m.mark = (SELECT max(m.mark) FROM mark m )
;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

SELECT s.studentid, studentname, avg(mark) AS diem_trung_binh
FROM student s
INNER JOIN mark m 
ON s.studentid = m.studentid
GROUP BY m.studentid
ORDER BY avg(mark) DESC, m.studentid;

 








