-- CREATE SCHEMA `quanlybanhang` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
-- tạo database vài cài đặt utf8 để có thể sử dụng tiếng Việt như như trên ..
-- create schema `quanlybanhang` default character set utf8 collate utf8_unicode_ci;
use quanlybanhang;
create table Customer
(
cId int not null auto_increment primary key,
cName varchar(40),
cAge int 
);
create table Orderr
(
oId int not null auto_increment primary key,
cId int ,
oDate datetime,
oTotalPrice decimal,
foreign key (cId) references Customer(cId)
);
create table Product
(
pId int not null auto_increment primary key,
pName varchar(40),
pPrice int
);
create table OrderDetail
(
oId int ,
pId int,
odQty int,
foreign key (oId) references Orderr(oID),
foreign key (pId) references Product(pId)
);
use quanlybanhang;
insert into quanlybanhang.customer( cName, cAge) 
values('Minh Quan', 10),
      ('Ngoc Oanh', 20),
      ('Hong Ha', 50);
-- insert into orderr ( cId, oDate, oTotalPrice)
-- values ( 1, '2006/3/21'),
--        ( 2, '3/23/2006'),
--        ( 1, '3/16/2006');
       insert into oder(oID, cID, oDate)
values(1,1,'3/21/2006'),
	(2,2,'3/23/2006'),
    (3,1,'3/16/2006');
    insert into Product(pName, pPrice)
    values('May Giat', 3),
          ('Tu Lanh', 5),
          ('Dieu Hoa', 7),
          ('Quat', 1),
          ('Bep Dien', 2);
          insert into OrderDetail(oId, pId, odQty)
          values(1, 1, 3),
				(1, 3, 7),
                (1, 4, 2),
                (2, 1, 1),
                (3, 1, 8),
                (2, 5, 4),
                (2, 3, 3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
		select oId, oDate, oTotalPrice from Orderr;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select o.oId, C.cId, c.cName, p.pId, p.pName from Orderr o 
join Orderdetail od on O.oId =od.oId
join Customer c on o.oId = C.cId
join Product p on od.pId = P.pId

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from Customer c, Orderr o where o.cId <> c.cId;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
select orderr.oId, orderr.oDate, Orderdetail.odQTy*Product.pPrice as Total from Orderr 
join Orderdetail on orderr.oId = Orderdetail.oId 
join Product on Orderdetail.pId = product.pId;
-- tính tổng hóa đơn theo id
select Orderr.oId,orderr.oDate,sum(Orderdetail.odQTy*Product.pPrice) as sumTotalByoId
from Orderr join Orderdetail on Orderr.oId = Orderdetail.oId join Product on Orderdetail.pId = Product.pId
group by Orderr.oId,Orderr.oDate;
-- hiển thị từ ngày 20 trở lên
select Orderr.oId,Orderr.oDate,sum(orderdetail.odQTy*product.pPrice) as sumTotalByoId
from Orderr join Orderdetail on Orderr.oId = Orderdetail.oId join Product on Orderdetail.pId = Product.pId
group by Orderr.oId,Orderr.oDate
having oDate > '2006-03-20';




