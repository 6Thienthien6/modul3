--  từ khóa use chỉ định tới database đang sử dụng.
use quanlysinhvien;

-- tạo bảng class
create table class
(
ClassId int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate Datetime not null,
Statuss Bit
);
-- Thêm thông tin vào bảng class.
INSERT INTO Class(ClassName, StartDate, Statuss)
VALUES ( 'A1', '2008-12-20', 1),

       ( 'A2', '2008-12-22', 1),

	( 'B3', current_date, 0);
    -- tạo bảng Student.
create table Student
(
StudentId int not null auto_increment primary key,
StudentName  varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Statuss Bit,
ClassId int not null,
 foreign key (ClassId) references class (ClassId)
);
insert into Student (StudentName, Address, Phone, Statuss, ClassId)
values ('Hung', 'Ha Noi', '0912113113', 1, 1),
       ('Hoa', 'Hai phong',5555555555, 1, 1),
       ('Manh', 'HCM', '0123123123', 0, 2);
create table Subjects
(
SubId int not null auto_increment primary key,
SubName varchar(30) not null,
Credit Tinyint not null default 1 check(credit>=1),
Statuss bit default 1
);
-- thêm thông tin vào bảng Subjects.
insert into Subjects (SubName, Credit, Statuss)
values ('CF', 5, 1),
	   ('C', 6, 1),
       ('HDJ', 5, 1),
	   ('RDBMS', 10, 1);
       
       create table Mark
       (
	MarkId    int not null auto_increment primary key,
    SubId     int not null,
    StudentId int not null,
    Mark      float default 0 check ( Mark between 0 and 10),
    ExamTimes tinyint default 1,
    unique (SubId, StudentId),
    foreign key (SubId) references Subjects (SubId),
    foreign key (StudentId) references Student (StudentId)
       );
	
       insert into Mark (SubId, StudentId, Mark, Examtimes)
       values(1, 1, 8, 1),
             (1, 2, 10, 2),
             (2, 1, 12, 1);