-- Active: 1717594420509@@127.0.0.1@3306@assignment3
use assignment3;

-- task 1
show tables;
select * from assignment3.employees;

-- task 1
select `FIRST_NAME`, `LAST_NAME` from employees where `SALARY` > (
    select `SALARY` from employees where `LAST_NAME` = 'Bull'
);

-- task 2

select `FIRST_NAME`, `LAST_NAME` from employees where `DEPARTMENT_ID` = (
    select `DEPARTMENT_ID` from department where `DEPARTMENT_NAME` = 'IT'
);

-- task 3