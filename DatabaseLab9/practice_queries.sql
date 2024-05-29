-- Active: 1716963650386@@127.0.0.1@3306@classicmodels
-- task 1
select * from customers c left join employees e on c.salesRepEmployeeNumber = e.employeeNumber;

-- task 2
select * from employees e left join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber`;

-- task 3
select * from customers c right join orders o on c.`customerNumber` = o.`customerNumber`;

-- task 4
select * from orderdetails od right join products pr on od.`productCode` = pr.`productCode`;

-- task 5
select * from employees e left join offices o on e.`officeCode` = o.`officeCode`;

-- task 6
select * from orderdetails od right join products pr on od.`productCode` = pr.`productCode`;

-- task 7
select * from customers c left join payments p on c.`customerNumber` = p.`customerNumber` where p.amount > 10000;

-- task 8
select * from offices o left join employees e on o.`officeCode` = e.`officeCode`;

-- task 9
select * from orders where status != 'Cancelled';

-- task 10
select * from productlines;
select * from products;

select * from productlines pl left join products p on pl.`productLine` = p.`productLine`;

-- task 11
select * from customers c left join employees e on c.`salesRepEmployeeNumber` = e.`employeeNumber`;

-- task 12
select * from employees e left join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber` UNION select * from employees e right join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber`;

-- task 13
select * from customers c left join orders o on c.`customerNumber` = o.`customerNumber` union select * from customers c right join orders o on c.`customerNumber` = o.`customerNumber`;

-- task 14
select * from productlines pl left join products pr on pl.`productLine` = pr.`productLine` UNION select * from productlines pl right join products pr on pl.`productLine` = pr.`productLine`;

-- task 15
select * from employees e left join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber` UNION select * from employees e right join customers c on e.`employeeNumber` = c.`salesRepEmployeeNumber` where c.`contactFirstName` like '%a%';

-- task 16
select distinct pr.`productCode` from products pr left join orderdetails od on pr.`productCode` = od.`productCode` where od.`quantityOrdered` > 5;

-- task 17
select distinct o.country from employees e left join offices o on e.`officeCode` = o.`officeCode` union select distinct cst.country from customers cst left join offices o on cst.country = o.country;

-- task 18
select pr.`productName`, pl.`productLine` from products pr join productlines pl on
pr.`productLine` = pl.`productLine`;

-- task 19
select * from employees e right join offices o on e.`officeCode` = o.`officeCode` where e.`firstName` like '%a%' or e.`firstName` like '%s%';

-- task 20
select * from orders o left join customers c on o.`customerNumber` = c.`customerNumber`;