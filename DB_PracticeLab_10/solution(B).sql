-- Active: 1714671618165@@127.0.0.1@3306@bankschema
use bankSchema;
-- 1. display the customers' name and phone number along with their current credit which is greater than 15000 by using inner join.
select customer.name, customer.phonenum, loanaccounts.current_credit
from customer
inner join loanaccounts on customer.customer_id = loanaccounts.customer_id
where loanaccounts.current_credit > 15000;

-- 2. display customer's name and address along with the maximum credit of the customer whose name is imran khan.
select customer.name, customer.address, max(loanaccounts.max_credit) as max_credit
from customer
inner join loanaccounts on customer.customer_id = loanaccounts.customer_id
where customer.name = 'Imran Khan';

-- 3. display the names, phone numbers and current credit of those customers whose current credit is null by using left join.
select customer.name, customer.phonenum, loanaccounts.current_credit
from customer
left join loanaccounts on customer.customer_id = loanaccounts.customer_id
where loanaccounts.current_credit is null;

-- 4. display the complete data of those customers who have applied for loan but not for the saving accounts by using in and not commands.
select * from customer
where customer_id in (select customer_id from loanaccounts)
and customer_id not in (select customer_id from savingaccounts);

-- 5. display the complete record of the transaction made by the customer along with the customer name and the salesman name.
select transaction.*, customer.name as customer_name, employee.name as salesman_name
from transaction
left join loanaccounts on transaction.loanaccount_number = loanaccounts.account_number
left join savingaccounts on transaction.savingaccount_number = savingaccounts.account_number
left join customer on loanaccounts.customer_id = customer.customer_id or savingaccounts.customer_id = customer.customer_id
left join employee on transaction.eid = employee.eid;

-- 6. by using in command display the complete record of customers and the record of their saving accounts along with the branch id of the bank.
select customer.*, savingaccounts.*, savingaccounts.branch_id
from customer
inner join savingaccounts on customer.customer_id = savingaccounts.customer_id
where customer.customer_id in (select customer_id from savingaccounts);

-- 7. display the name and address of the customers along with their branch address and bank name.
select customer.name, customer.address, branch.branch_address, bank.bank_name
from customer
inner join loanaccounts on customer.customer_id = loanaccounts.customer_id
inner join branch on loanaccounts.branch_id = branch.branch_id
inner join bank on branch.bank_id = bank.bank_id;

-- 8. display the branch id and branch address of the allied bank limited by using in command.
select branch_id, branch_address
from branch
where bank_id in (select bank_id from bank where bank_name = 'Allied Bank Limited');

-- 9. display the names, designations of the employees along with their branch address and bank name by using multiple right joins.
select employee.name, employee.designation, branch.branch_address, bank.bank_name
from employee
right join branch on employee.branch_id = branch.branch_id
right join bank on branch.bank_id = bank.bank_id;

-- 10. display the branch id of those branches which have assigned loan accounts and saving accounts to the customers by using multiple in commands.
select branch_id
from branch
where branch_id in (select branch_id from loanaccounts)
and branch_id in (select branch_id from savingaccounts);
