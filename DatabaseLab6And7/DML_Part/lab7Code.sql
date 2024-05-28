-- task 1
use company;
select * from employee;

-- task 2
use company;
select fname from employee where salary > 40000;

-- task 3 --
use company;
select fname, lname from employee e where ssn in (select superssn from employee);

-- task 4
use company;
select salary, dno from employee where sex = 'F';

-- task 5

use company;
select fname from employee where salary between 40000 and 50000;

-- task 6

use company;
select distinct fname, lname from employee where dno = 5;

-- task 7
use company;
select * from employee order by salary desc;
-- task 8

use company;
insert into project (
    pname,
    pnumber,
    plocation,
    dnum
) values (
    'Image Processing',
    4,
    'USA',
    6
);
select * from project;

-- task 9

use company;
update project set plocation = 'London' where pname='OperatingSystems' and plocation='Jacksonville';
select * from project;

-- task 10

use company;

delete from project where pnumber = 4;

select * from project;

-- task 11

use company;
select fname, lname, dno from employee where dno != 7;