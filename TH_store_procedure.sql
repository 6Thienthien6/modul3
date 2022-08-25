delimiter //
create procedure findAllCustomers()
begin
select * from customers;
end;//
delimiter ;
-- delimiter // dùng để phân tách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới.
-- create procedure findAllCustomers() dùng để tạo một procedure mới, trong đó findAllCustomers chính là tên thủ tục còn hai từ đầu là từ khóa.
-- begin và end;// dùng để khai báo bắt đầu  và kết thúc procedure
-- delimiter ; để đóng lại ô lưu trữ.


#----------------------------------------------
 -- gọi đến procedure
  call  findAllCustomers() ;
delimiter //
-- xóa procedure thì dùng drop.
-- drop procedure  if exists findAllCustomers ;
-- tạo lại procedure
create procedure findAllCustomers()
begin

select * from customers where customerNumber = 175;
end;//
delimiter ;