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
select s.StudentId , s.StudentName, sub.subName, m.Mark 
from student s 
join Mark m on  s.StudentId = m.StudentId 
join subjects sub on sub.SubId = m.subId 
order by M.mark DESC, s.studentName ASC;