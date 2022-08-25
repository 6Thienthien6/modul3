-- tìm thông tin khách hàng trong bảng customers
 select * from customers where customerName = 'Lan of Toys Inc.';
 
 -- them explain vào trước select để tăng tốc độ truy vấn
 explain select * from customers where customerName = 'Lan of Toys Inc.';	
 
 -- thêm index cho bảng customers
 alter table customers add index idx_customerName(customerName);

-- thêm index theo cặp  contactFirstName và contactLastName.
alter table customers add index idx_full_name(contactFirstName, contactLastName);

-- truy vấn nhanh đối với index trên
explain select * from customers where contactFirstName = 'Jean' or contactFirstName = 'King';

-- xóa index trong bảng	
alter table customers drop index idx_full_name;

