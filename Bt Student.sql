use quanlysinhvien;
create table Class 
( ClassId int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate Datetime not null,
Statuss BIT
);
create table Student
(
StudentId int not null auto_increment primary key,
StudentName  varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Statuss Bit,
ClassId int not null,
 FOREIGN KEY (ClassId) REFERENCES Class (ClassId)
);
create table Subjects
(
SubId int not null auto_increment primary key,
SubName varchar(30) not null,
Credit Tinyint not null default 1 check(credit>=1),
Statuss bit default 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
