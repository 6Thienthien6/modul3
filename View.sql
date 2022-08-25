-- Tạo View có tên customer_views truy vấn dữ liệu từ bảng customers để lấy các dữ liệu: customerNumber, customerName, phone bằng câu lệnh SELECT:
create view customer_views as
 select customerNumber, customerName, phone
from  customers;
-- lấy dữ liệu  từ bảng ảo  view này :
select * from customer_views;
-- cập nhật view
create or  replace view  customer_views AS

select customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers where city = 'Nantes';
-- xóa view khi không cần sử dụng nó nữa
drop view customer_views;