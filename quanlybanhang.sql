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
cId int not null,
oDate datetime,
oTotalPrice decimal,
foreign key (cId) references Customer(cId)
);
create table Product
(
pId int not null auto_increment primary key,
pName varchar(40),
pPrice decimal
);
create table OrderDetail
(
oId int ,
pId int,
odQty int,
foreign key (oId) references Orderr(oID),
foreign key (pId) references Product(pId)
);


