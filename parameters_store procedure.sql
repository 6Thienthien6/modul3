
-- truyền tham số loại IN vào procedure
delimiter //
create procedure getCusById
(IN cusNum int(11))
begin
select * from customers where customerNumber = cusNum;
end;//
delimiter ;

-- gọi procedure
call getCusById (175);

-- truyền tham số loại Out
delimiter //
create procedure GetCustomersCountByCity(
IN in_city varchar(50),
Out total int)
begin
select count (customerNumber)
into total
from customers where  city =  in_city;
end;//
delimiter ;

-- gọi procedure
call GetCustomersCountByCity('Lyon',@total);

select @total;

-- truyền tham số loại INOUT
delimiter //

create procedure SetCounter(

    inout counter int,

    in inc int

)

begin

    set counter = counter + inc;

end;//

delimiter ;

-- gọi procedure ra
set @counter = 1;
call SetCounter(@counter, 1 );
CALL SetCounter(@counter,1); 

CALL SetCounter(@counter,5); 

SELECT @counter; 

