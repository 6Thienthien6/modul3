delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_class`(
	IN size int,
    OUT message varchar(200)
)
begin
	declare v_counter int unsigned default 0;

	if(size < 10) then
		set message = 'size kich thuoc qua nho, khong thich nhap';
    end if;
    
    while v_counter < size do
		INSERT INTO `quanlysinhvien`.`class` (`ClassName`, `StartDate`, `Status`) VALUES (concat('D',v_counter), now(), b'1');
		set v_counter=v_counter+1;
	end while;
    
end;//
# Kiem tra so dien thoai co ton tai hay chua
select exists (select phone from student where phone = '0399578134');

## viet 1 store procdue
-- nhap vao cac thong tin: name, address, classid,, phone age. Kem 1 tham so out hien thi message
--  + Kiem tra xem so dien thoai chua ton tai moi duoc them
--  + Kiem tra classid da ton tai moi duoc them
--  + Sau khi kiem tra thanh cong thi moi duoc them
 
delimiter //
create procedure sp_insert_student_c5(
	IN sName varchar(200),
    IN sAddress varchar(200),
    IN sPhone varchar(11),
    IN sStatus boolean, 
    IN sClassId int,
    IN sAge int,
    OUT sMessage varchar(100)
)
begin
	if(exists (select phone from student where phone = sPhone)) then
		set sMessage = 'So dien thoai da ton tai';
        end if;
	if(not exists (select ClassID from class where ClassID = sClassId)) then
		set sMessage = 'Class id chua ton tai';
        end if;
end;//