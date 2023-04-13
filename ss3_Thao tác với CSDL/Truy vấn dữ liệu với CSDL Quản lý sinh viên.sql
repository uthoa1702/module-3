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
       
       
-- ------------------Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’


SELECT * FROM Student;
SELECT * FROM Student WHERE StudentName LIKE 'H%';



-- ------------------Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.


SELECT * FROM Class;
SELECT * FROM Class WHERE StartDate LIKE '%-12-%';



-- ------------------Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.


SELECT * FROM `Subject`;
SELECT * FROM `Subject` WHERE Credit BETWEEN 3 AND 5;



-- ------------------Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.


SELECT * FROM Student;
SET SQL_SAFE_UPDATES = 0 ;
UPDATE Student 
SET 
    ClassID = 2
WHERE
    StudentName LIKE 'Hung';





-- -------------------Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.









