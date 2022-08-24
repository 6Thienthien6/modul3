use quanlysinhvien;
select * from student;
select * from student where Statuss = true;
select * from subjects where Credit < 10;
select s.StudentId, s.StudentName, c.ClassName 
from student s join class.c on s.ClassId = c.ClassId;
select s.StudentId, s.StudentName, c.ClassName 
from student s join class c on s.ClassId = c.ClassId where c.ClassName = 'A1';
 select s.StudentId, s.StudentName, Sub.SubName,  m.Mark 
 from student s join Mark m on s.StudentId = m.StudentId join subjects sub on m.SubId = sub. SubId;
 select S.StudentId, S.StudentName, Sub.SubName, M.Mark 
 from Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId where sub.SubName = 'CF';