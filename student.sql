SELECT * FROM my_database.student;
alter table `my_database`.`student`
change column `id` `id` int not null auto_increment;
insert into `my_database`.`student`(`name`, `age`, `country`, `email`) values('Nami','19','Japan','nekomamushi@gmail.com');
