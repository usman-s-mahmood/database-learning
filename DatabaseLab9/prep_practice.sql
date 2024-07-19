show databases;

use classicmodels;

-- task 1
select * from employees;
select * from customers;
select * from employees e left join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber` ;

-- task 2
select * from employees;
select * from customers;

select * from employees e right join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber`;

-- task 3

select * from orders;
select * from customers;

select * from customers c left join orders o on c.`customerNumber` = o.`customerNumber`;

-- task 4
select * from orderdetails;
select * from products;

select * from orderdetails od right join products pr on od.`productCode` = pr.`productCode`;

-- task 5
select * from employees;
select * from offices;

select * from employees e left join offices o on e.`officeCode` = o.`officeCode`;

-- task 6
select * from orderdetails;
select * from products;

select * from orderdetails od left join products pr on od.`productCode` = pr.`productCode`;

-- task 7
select * from customers;
select * from payments;

select * from customers c left join payments p on c.`customerNumber` = p.`customerNumber` where p.amount > 10000;

-- task 8
select * from offices o left join employees e on o.`officeCode` = e.`officeCode`;

-- task 9
select * from orders o1 join orders o2 on o1.`orderNumber` = o2.`orderNumber`;

-- task 10
select * from products pr right join productlines pl on pr.`productLine` = pl.`productLine`;

-- task 11
select * from employees e right join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber`;

-- task 12
select * from employees e left join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber` union select * from employees e right join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber`;

-- task 13

select * from orders o left join customers c on o.`customerNumber` = c.`customerNumber` union select * from orders o right join customers c on o.`customerNumber` = c.`customerNumber`;

-- task 14
select * from products p left join productlines pl on p.`productLine` = pl.`productLine` union select * from products p right join productlines pl on p.`productLine` = pl.`productLine`;

-- task 15
select * from employees e join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber` where c.`customerName` like '%a%';

-- task 16

select * from products;
select distinct p.`productCode` from products p join orderdetails od on od.`productCode` = p.`productCode` where od.`quantityOrdered` > 5 or p.`quantityInStock` > 5;

-- task 17
select distinct o.country from offices o join customers c on o.country = c.country where o.country = c.country;

-- task 18
select distinct p.`productName`, pl.`productLine` from products p join productlines pl on p.`productLine` = pl.`productLine`;

-- task 19
select *, o.city, o.country from employees e join offices o on e.`officeCode` = o.`officeCode` where e.`firstName` like '%a%' or e.`firstName` like '%s%';

-- task 20
select * from orders o right join customers c on o.`customerNumber` = c.`customerNumber`;