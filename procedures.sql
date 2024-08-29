

create procedure get_customers(in c_id int)
begin
    select * from classicmodels.customers where `customerNumber` = c_id; 
end ;
drop procedure get_customers;
call get_customers(1);


