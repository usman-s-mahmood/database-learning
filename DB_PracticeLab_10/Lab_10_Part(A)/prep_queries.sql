show databases;

use classicmodels;

-- task 1
select * from employees where `officeCode` in (
    select `officeCode` from offices where country = 'USA'
);

-- task 2
select * from employees where `employeeNumber` in (
    select `employeeNumber` from employees where `firstName` like '%a%' or `lastName` like '%a%'
);

-- task 3
select * from employees where `employeeNumber` in (
    select `salesRepEmployeeNumber` from customers where `customerNumber` in (
        select `customerNumber` from payments where amount > 70000
    )
);

-- task 4
select * from customers where `customerNumber` in (
    select `customerNumber` from payments where amount between 1000 and 5000
);

-- task 5
select * from customers where `customerNumber` in (
    select `customerNumber` from orders where `orderDate` like '2003%' and `shippedDate` like '2003%'
);

-- task 6
select * from customers where `customerNumber` not in (
    select `customerNumber` from orders
);

-- task 7
select * from orderdetails;
select * from products where `productCode` in (
    select `customerNumber` from orders where `orderNumber` in (
        select `orderNumber` from orderdetails where `quantityOrdered` < 50 and `quantityOrdered` > 30
    )
);

-- task 8
