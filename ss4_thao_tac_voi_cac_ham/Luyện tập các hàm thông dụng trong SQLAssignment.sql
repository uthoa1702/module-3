USE quanlysinhvien;
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

SELECT studentname, avg(mark)
FROM student s
INNER JOIN mark m 
ON s.studentid = m.studentid
GROUP BY markid;













