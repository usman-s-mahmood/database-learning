use classicmodels;
show tables;
desc customers;
desc employees;
desc offices;
desc orderdetails;
desc orders;
desc payments;
desc productlines;
desc products;
-- 1. Write a query that returns first name and last name of those employees who work in the offices located in the USA.
select * from employees;
select first_name, last_name
from employees
where office_code in (select office_code from offices where country = 'USA');

-- 2. Write a query that returns the total number of employees who has an ‘a’ in their name.
select count(*)
from employees
where first_name like '%a%' or last_name like '%a%';

-- 3. Write a query that returns the total number of employees whose customers payment amount is greater than 70000.
select count(distinct e.employee_number)
from employees e
join customers c on e.employee_number = c.sales_rep_employee_number
where c.customer_number in (
    select customer_number
    from payments
    group by customer_number
    having sum(amount) > 70000
);

-- 4. Write a query that returns the customers who has the pay more than 1000 and less 5000 payment.
select distinct customer_number
from payments
where amount > 1000 and amount < 5000;

-- 5. Write a query to find customers Name and phone number who order year is 2003 and shipped date is also 2003.
select c.customer_name, c.phone
from customers c
join orders o on c.customer_number = o.customer_number
where year(o.order_date) = 2003 and year(o.shipped_date) = 2003;

-- 6. Write a query to find the customers who have not placed any orders.
select customer_name
from customers
where customer_number not in (select customer_number from orders);

-- 7. write a query to display product code and name whose order quantity is greater than 30 and less than 50
select p.product_code, p.product_name
from products p
join orderdetails od on p.product_code = od.product_code
where od.quantity_ordered > 30 and od.quantity_ordered < 50;

-- 8. Write a query to display customers name whose order status is Cancelled and price of that order is greater than 50.
select distinct c.customer_name
from customers c
join orders o on c.customer_number = o.customer_number
join orderdetails od on o.order_number = od.order_number
where o.status = 'Cancelled' and od.price_each > 50;

-- 9. Write a query that display order number of those orders whose total amount are greater than 60K.
select order_number
from orders
where order_number in (
    select order_number
    from orderdetails
    group by order_number
    having sum(quantity_ordered * price_each) > 60000
);

-- 10. Sum the total amount payable in the year 2004.
select sum(amount)
from payments
where year(payment_date) = 2004;

-- 11. Write a query to display customer name and total amount of payments they have to pay for all of their orders.
select c.customer_name, sum(p.amount) as total_amount
from customers c
join payments p on c.customer_number = p.customer_number
group by c.customer_name;

-- 12. Write a query to display product name and total amount of quantities ordered for that specific product till date.
select p.product_name, sum(od.quantity_ordered) as total_quantity
from products p
join orderdetails od on p.product_code = od.product_code
group by p.product_name;

-- 13. Count the number of customers who has ordered a single product with the quantity greater than 5.
select count(distinct customer_number)
from orders o
join orderdetails od on o.order_number = od.order_number
where od.quantity_ordered > 5;

-- 14. Write query to display maximum, minimum and average amount payable by each customer along with their names.
select c.customer_name, 
       max(p.amount) as max_amount, 
       min(p.amount) as min_amount, 
       avg(p.amount) as avg_amount
from customers c
join payments p on c.customer_number = p.customer_number
group by c.customer_name;

-- 15. Display the name of customers whose employee representative’s office is located in USA.
select c.customer_name
from customers c
join employees e on c.sales_rep_employee_number = e.employee_number
where e.office_code in (select office_code from offices where country = 'USA');

-- 16. Display the name of customers who has ordered any product from product line 'Classic Cars'.
select distinct c.customer_name
from customers c
join orders o on c.customer_number = o.customer_number
join orderdetails od on o.order_number = od.order_number
join products p on od.product_code = p.product_code
where p.product_line = 'Classic Cars';
