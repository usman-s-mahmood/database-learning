use assignment3;

-- 1. Name and salary of employees who have a higher salary than the employee whose last name is 'Bull'
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull');

-- 2. Name of all employees who work in the IT department
SELECT first_name, last_name
FROM employees
WHERE department_id = (SELECT department_id FROM department WHERE department_name = 'IT');

-- 3. Employees who have a manager and worked in a USA-based department
SELECT e.first_name, e.last_name
FROM employees e
JOIN department d ON e.department_id = d.department_id
JOIN location l ON d.location_id = l.location_id
WHERE e.manager_id IS NOT NULL AND l.country_id = 'US';

-- 4. Employees who earn more than the average salary
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 5. Employees whose department is located at ‘Toronto’
SELECT e.first_name, e.last_name, e.employee_id, e.job_id
FROM employees e
JOIN department d ON e.department_id = d.department_id
JOIN location l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

-- 6. Employees who report to the manager whose first name is ‘Payam’
SELECT e.first_name, e.last_name, e.employee_id, e.salary
FROM employees e
WHERE e.manager_id = (SELECT employee_id FROM employees WHERE first_name = 'Payam');

-- 7. department where at least one employee is employed
SELECT department_name
FROM department
WHERE department_id IN (SELECT DISTINCT department_id FROM employees);

-- 8. Employees who do not work in the department where managers’ IDs are between 100 and 200
SELECT *
FROM employees
WHERE department_id NOT IN (SELECT department_id FROM department WHERE manager_id BETWEEN 100 AND 200);

-- 9. Employees whose salary matches the lowest salary of any of the department
SELECT e.first_name, e.last_name, e.department_id
FROM employees e
WHERE e.salary = (SELECT MIN(salary) FROM employees GROUP BY department_id ORDER BY MIN(salary) LIMIT 1);

-- 10. Employees who are managers
SELECT first_name, last_name
FROM employees
WHERE employee_id IN (SELECT DISTINCT manager_id FROM employees);

-- 11. Employees whose salary is lower than that of employees whose job title is "MK_MAN"
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary < (SELECT MIN(salary) FROM employees WHERE job_id = 'MK_MAN')
  AND job_id <> 'MK_MAN';

-- 12. Employees whose salary is greater than the average salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 13. Employees whose salary is equal to the minimum salary for their job grade
SELECT first_name, last_name, salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary = j.min_salary;

-- 14. Employees who earn more than the average salary and work in any of the IT department
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
  AND department_id IN (SELECT department_id FROM department WHERE department_name LIKE '%IT%');

-- 15. Employees who earn more than the earning of Mr. Bell
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bell');

-- 16. Employees who earn the same salary as the minimum salary for all department
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 17. Employees whose salary is greater than the average salary of all department
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 18. Find the 3rd maximum salary in the employees table
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
