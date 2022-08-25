-- Tạo bảng Products với các trường dữ liệu 
create table Products(
Id int ,
productCode int,
productName varchar(50),
productPrice float,
productAmount int,
productDescription varchar(50),
productStatus bit);
insert into products 
values (1,001,'NMXE', 15.2, 10, 'ui doi` oi', 1);

-- tao unique index
alter table products add index idx_productCode(productCode);
explain select * from products where productCode = 001;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table products add index idx_inFo(productName,productPrice);
explain select * from products where productName = 'NMXE';
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_views as
select productCode, productName, productPrice,productStatus from products;  
select * from product_views;


-- Sửa đổi view
create or replace view product_views as
select productCode, productName, productPrice,productStatus from products where id = 1;
select * from product_views;

-- Tao store procedure lay tat ca thong tin
delimiter //
create procedure sp_DisplayInfo ()
begin select * from products;
end //

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_AddNewProduct (
IN sId int ,
In sproductCode int,
IN sproductName varchar(50),
IN sproductPrice float,
IN sproductAmount int,
IN sproductDescription varchar(50),
IN sproductStatus bit) 
begin 
	insert into products (Id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
	values (sId,sproductCode,sproductName,sproductPrice,sproductAmount,sproductDescription,sproductStatus);
end //

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_updateInfo (
IN sId int ,
In sproductCode int,
IN sproductName varchar(50),
IN sproductPrice float,
IN sproductAmount int,
IN sproductDescription varchar(50),
IN sproductStatus bit,
OUT message varchar(50)
)
begin
	declare flag boolean;
    set flag = true;
    if ( not exists ( select Id from products where Id = sId )) then
		set message = 'Id khong ton tai';
        set flag = false;
        end if;
	if ( flag = true ) then 
		insert into products (Id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
	    values (sId,sproductCode,sproductName,sproductPrice,sproductAmount,sproductDescription,sproductStatus);
        end if;
end// 

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_DeleteProduct (
	IN sId int,
    OUT message varchar(50))
begin
	declare flag boolean;
    set flag = true;
    if ( not exists ( select Id from products where Id = sId )) then
		set message = 'id khong ton tai';
        set flag = flase;
	end if;
    if ( flag = true ) then
		delete from products;
        set message = 'xoa thanh cong';
	end if;
end// 


