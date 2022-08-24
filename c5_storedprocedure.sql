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
#---------------------------------------

# store procedure nạp tiền
delimiter //
create procedure sp_deposit(
	IN sCustomerId int, 
    IN sMoney decimal(12,0),
    OUT sMessage varchar(200)
)
begin
	declare flag boolean;
    declare total decimal(12,0);
    set flag = true;
    
	if(not exists (select id from customers where id = sCustomerId)) then 
		set sMessage = 'Nguoi dung khong ton tai';
        set flag = false;
	end if;
    if(sMoney <= 0) then
		set sMessage = 'So tien nap phai lon hon khong';
        set flag = false;
    end if;
    
    if(flag = true) then
		INSERT INTO `c5_banking`.`deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) 
        VALUES (now(), 0, sCustomerId, sMoney);
        
        set total = (SELECT balance FROM c5_banking.customers where id = sCustomerId);
		set total = total + sMoney;
        UPDATE `c5_banking`.`customers` SET `balance` = total WHERE (`id` = sCustomerId);
	end if;
end;