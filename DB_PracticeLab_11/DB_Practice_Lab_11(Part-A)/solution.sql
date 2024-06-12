use bankSchema;

-- task 1

select c.name, c.phoneNum from customer c join loanaccounts l on c.customer_id = l.customer_id where l.current_credit > 15000;

-- task 2
select c.name, c.address, l.max_credit from customer c join loanaccounts l on c.customer_id = l.customer_id where c.name = 'Imran Khan';

-- task 3
select c.name, c.phoneNum, l.current_credit from customer c left join loanaccounts l on c.customer_id = l.customer_id where l.current_credit is null;

-- task 4
select * from customer where customer_id in (
   select customer_id from loanaccounts where customer_id not in (
        select customer_id from savingaccounts
    )
);

-- task 5
select t.*, c.name as customer_name, e.name as salesman_name
from transaction t
join employee e on t.eid = e.eid
join branch b on e.branch_id = b.branch_id
join bank bk on b.bank_id = bk.bank_id
join savingaccounts sa on t.savingAccount_number = sa.account_number
join customer c on sa.customer_id = c.customer_id;

-- task 6
select *
from customer
where customer_id in (
    select customer_id
    from savingaccounts
);

-- task 7
select c.name as customer_name, c.address as customer_address, b.branch_address, bn.bank_name
from customer c
join savingaccounts sa on c.customer_id = sa.customer_id
join branch b on sa.branch_id = b.branch_id
join bank bn on b.bank_id = bn.bank_id;

-- task 8
select b.branch_id, b.branch_address
from branch b
where bank_id in (
    select bank_id
    from bank
    where bank_name = 'Allied Bank Limited'
);

-- task 9
select e.name as employee_name, e.designation, b.branch_address, bn.bank_name
from employee e
right join branch b on e.branch_id = b.branch_id
right join bank bn on b.bank_id = bn.bank_id;

-- task 10
select distinct branch_id
from branch
where branch_id in (
    select branch_id
    from loanaccounts
) and branch_id in (
    select branch_id
    from savingaccounts
);
