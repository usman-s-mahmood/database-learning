use classicmodels;

show tables;

desc customers; 
desc employees;

select c.customerName, e.firstName, e.lastName, p.amount, pro.productName, e.officeCode, o.city, o.state, o.country from customers c join employees e on c.salesRepEmployeeNumber = e.employeeNumber join offices o on o.officeCode = e.officeCode join payments p on c.customerNumber = p.customerNumber join orders ord on ord.customerNumber = c.customerNumber join orderdetails odels on ord.orderNumber = odels.orderNumber join products pro on odels.productCode = pro.productCode;

select * from products;

select * from orders;
