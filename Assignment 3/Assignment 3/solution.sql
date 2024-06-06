-- Active: 1714057803737@@127.0.0.1@3306@assignment3
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

select `FIRST_NAME`, `LAST_NAME` from employees where `DEPARTMENT_ID` IN (
    select `DEPARTMENT_ID` from department where `DEPARTMENT_ID` in (
        select `DEPARTMENT_ID` from location where country_id = 'US'
    )
) and `EMPLOYEE_ID` in (
    select `EMPLOYEE_ID` from employees where `MANAGER_ID` is not null
);

-- task 4
select `EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME` from employees where `SALARY` > (
    select AVG(`SALARY`) from employees
);

-- task 5
select `EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `JOB_ID` from employees where `DEPARTMENT_ID` in (
    select `DEPARTMENT_ID` from department where `LOCATION_ID` in  (
        select `LOCATION_ID` from location where city = 'Toronto'
    )
);

-- task 6
select `FIRST_NAME`, `LAST_NAME`, `EMPLOYEE_ID`, `SALARY` from employees where `MANAGER_ID` in (
    select `EMPLOYEE_ID` from employees where `FIRST_NAME` = 'Payam'
);

-- task 7
select `DEPARTMENT_NAME` from department where `DEPARTMENT_ID` in (
    select DISTINCT `DEPARTMENT_ID` from employees
);

-- task 8
select * from employees where `DEPARTMENT_ID` not in (
    select `DEPARTMENT_ID` from department where `MANAGER_ID` between 100 and 200
);

-- task 9
select `FIRST_NAME`, `LAST_NAME`, `DEPARTMENT_ID` from employees where salary in (
    select MIN(`SALARY`) from employees GROUP BY `DEPARTMENT_ID`
);

-- task 10
select `FIRST_NAME`, `LAST_NAME` from employees where `EMPLOYEE_ID` in (
    select `MANAGER_ID` from employees
);

-- task 11
select `FIRST_NAME`, `LAST_NAME`, `JOB_ID` from employees where `SALARY` < (
    select `SALARY` from employees where `JOB_ID` = 'MK_MAN'
) and `JOB_ID` != 'MK_MAN';

-- task 12
select `FIRST_NAME`, `LAST_NAME`, `SALARY` from employees where `SALARY` > (
    select AVG(`SALARY`) from employees
);

-- task 13
select `FIRST_NAME`, `LAST_NAME`, `SALARY` from employees where `SALARY` in (
    select MIN(`SALARY`) from employees GROUP BY `JOB_ID`
);

-- task 14
select `FIRST_NAME`, `LAST_NAME`, `SALARY` from employees where salary > (
    select AVG(`SALARY`) from employees
) AND `DEPARTMENT_ID` in (
    select `DEPARTMENT_ID` from department where `DEPARTMENT_NAME` like '%IT%'
);

-- task 15
select `FIRST_NAME`, `LAST_NAME`, `SALARY` from employees where `SALARY` > (
    select `SALARY` from employees where `LAST_NAME` = 'Bell'
);

-- task 16
select `FIRST_NAME`, `LAST_NAME`, `SALARY` from employees where `SALARY` in (
    select min(`SALARY`) from employees GROUP BY `DEPARTMENT_ID`
);

-- task 17
select `FIRST_NAME`, `LAST_NAME`, `SALARY` from employees where `SALARY` > (
    select avg(`SALARY`) from employees
);

-- task 18

select `SALARY` from (
    select DISTINCT `SALARY` from `employees` ORDER BY `SALARY` DESC LIMIT 3
) AS top_salaries ORDER BY `SALARY` LIMIT 1;
