use xuatnhaphang;
create table nhacungcap
(
cId int not null auto_increment primary key,
nccName varchar(70) ,
nccAdress varchar(50) ,
nccPhone int
);
create table dondh
(
dhId int not null auto_increment primary key,
dateDh datetime,
nId int not null,
cId int not null,
vId int not null,
foreign key(vId) references vattu(vId),
foreign key (cId) references nhacungcap (cId)
);
create table vattu
(
vId int not null primary key,
vName Varchar(30),
cId int not null,
foreign key (cId) references nhacungcap(cId)
);
create table phieunhap
(
nId int not null auto_increment primary key,
nDate datetime,
nDg double,
nSl int,
vId int not null,
foreign key (vId) references vattu(vId)
);
create table phieuxuat
(
pxId int not null auto_increment primary key,
pxDate datetime ,
pxDg double,
xSl int,
vId int not null,
foreign key(vId) references vattu(vId)
);
