-- display the customers' name and phone number along with their current credit of loan account which is greater than 15000 by using inner join
select c.name, c.phonenum, la.current_credit
from customer c
join loanaccounts la on c.customer_id = la.customer_id
where la.current_credit > 15000;

-- display customer's name and address along with the credit of loan account of the customer whose name is imran khan
select c.name, c.address, la.current_credit
from customer c
join loanaccounts la on c.customer_id = la.customer_id
where c.name = 'imran khan';

-- display the names, phone numbers and current credit of those customers whose current credit of saving account is NULL by using left join
select c.name, c.phonenum, sa.current_balance
from customer c
left join savingaccounts sa on c.customer_id = sa.customer_id
where sa.current_balance is null;

-- display the complete data of those customers who have applied for loan but not for the saving accounts by using in and not commands
select *
from customer
where customer_id in (
    select customer_id
    from loanaccounts
) and customer_id not in (
    select customer_id
    from savingaccounts
);

-- by using in command display the complete record of customers and the record of their saving accounts along with the branch id of the bank
select *
from customer
where customer_id in (
    select customer_id
    from savingaccounts
);

-- display the branch id and branch address of the allied bank limited by using in command
select b.branch_id, b.branch_address
from branch b
where bank_id in (
    select bank_id
    from bank
    where bank_name = 'allied bank limited'
);

-- display the names, designations of the employees along with their branch address and bank name by using multiple right joins
select e.name, e.designation, b.branch_address, bk.bank_name
from employee e
right join branch b on e.branch_id = b.branch_id
right join bank bk on b.bank_id = bk.bank_id;

-- display the branch id of those branches which have assigned loan accounts and saving accounts to the customers by using multiple in commands
select distinct branch_id
from branch
where branch_id in (
    select branch_id
    from loanaccounts
) and branch_id in (
    select branch_id
    from savingaccounts
);
