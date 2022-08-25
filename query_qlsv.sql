-- hiển thị tất cả sinh viên có tên bắt đầu bằng kí tự 'h'
select * from student where StudentName like 'h%';
-- hiển thị  tất cả các lớp học bắt đầu vào tháng 12
select * from class where StartDate Like '_____12%';
# StartDate BETWEEN '2008-12-01' AND '2008-12-31';
-- hiển thị thông tin môn học có Credit trong khoảng 3 - 5
select * from subjects where Credit between 3 and 5;
-- thay đổi mã học viên của Hùng là 2 
SET SQL_SAFE_UPDATES = 0;
update  student set classId =2  where studentName = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.StudentId , s.StudentName, sub.subName, m.Mark from student s 
join Mark m on  s.StudentId = m.StudentId 
join subjects sub on sub.SubId = m.subId 
order by M.mark DESC, s.studentName ASC;

-- hiển thị số lượng sinh viên ở từng nơi
select Address, count(StudentId) as 'Số lượng học viên'from Student
group by Address;


-- tính điểm trung bình các môn học của mỗi học viên
select  s.studentId, s.studentName, avg(Mark)
from student s join mark m on s.studentId = m.StudentId
group by s.StudentId, s.StudentName;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15 Đầu tiên hiển thị điểm trung bình các môn học của mỗi học viên
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;
-- Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15
select s.StudentId, s.StudentName, avg(mark)
from student s join mark m on s.StudentId = m.StudentId
group by s.StudentId, s.StudentName
having avg(mark)> 15;
-- Hiển thị danh sách điểm trung bình của các học viên
select s.studentId, s.studentName, avg(mark)
from student s join mark m on s.StudentId = m.StudentId
group by s.StudentId, s.StudentName;
-- Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất
select s.studentId, s.studentName, avg(mark)
from student s join mark m on s.StudentId = m.StudentId
group by s.StudentId, s.StudentName
having avg(mark)>= all (select avg(mark) from mark group by mark.StudentId)


## Hiển thị tất cả các thông tin môn học có credit lớn nhất
select SubId, subName, max(Credit)
from subjects
group by subId, subName
having max(Credit)>= all(select max(Credit) from subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from mark 
group by mark
having mark >= all(select Mark from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select* , avg(mark)
from student s join mark m on s.StudentId = m.StudentId
group by s.StudentId, s.StudentName order by mark desc;