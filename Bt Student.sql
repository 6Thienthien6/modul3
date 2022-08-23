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
    FOREIGN KEY (SubId) REFERENCES Subjects (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
-- thêm thông tin vào bảng class.
-- INSERT INTO `quanlysinhvien`.`class` (`ClassId`, `ClassName`, `StartDate`, `Statuss`) VALUES ('2', 'AMT2 ', '2022-08-23', b'0');
-- thêm thông tin vào bảng student.
insert into `quanlysinhvien`.`student` ( `StudentName`, `Address`, `Phone`, `Statuss`, `ClassId`) values ('Khanh', 'HCM', '02938274923', b'0', b'1');
-- INSERT INTO `quanlysinhvien`.`student` (`StudentName`, `Address`, `Phone`, `Statuss`, `ClassId`) VALUES ('Hanh', 'HCM', '029392393', b'0', b'1');
insert into quanlysinhvien.student ( StudentName, Address, Phone, Statuss, ClassId) values('Helen', 'Ha Noi', '02959473824', b'1', b'1');
-- xóa thông tin hàng id thứ 3 của bảng student
UPDATE `quanlysinhvien`.`student` SET `StudentId` = '', `StudentName` = NULL, `Address` = NULL, `Phone` = NULL, `Statuss` = NULL, `ClassId` = NULL WHERE (`StudentId` = '3');
-- đẩy vị trí thông tin hàng thứ 4 lên nối tiếp số thứ tự trong danh sách ở bảng student 
UPDATE `quanlysinhvien`.`student` SET `StudentId` = '3' WHERE (`StudentId` = '4');
insert into Subjects values
(1, 'CF', 4 , 1),
(2, 'LM', 3, 1),
(3, 'TS', 6, 1),
(4, 'AT', 2, 1);
insert into Mark (SubId, StudentId, Mark, ExamTimes)
values
(1, 3, 8, 2),
(1, 2, 7, 1),
(1, 1, 6, 1);





