-- Active: 1714057803737@@127.0.0.1@3306@company_schema
create database company_schema;

use company_schema;

create table employee (
    fname varchar(100) not null,
    lname varchar(100) not null,
    Minit varchar(50) not null,
    ssn varchar(20) primary key,
    address varchar(1000) not null,
    gender varchar(7) not null,
    salary float not null default 0,
    super_ssn varchar(20),
    dno int,
    constraint fkey_sp_ssn foreign key (super_ssn) references employee(ssn)
);

desc company_schema.employee;

use company_schema;

create table department (
    dname varchar(20) not null unique,
    dnumber int primary key,
    mgr_ssn varchar(20),
    mgr_start_date date not null,
    constraint fkey_dep_mgr foreign key (mgr_ssn) references employee(ssn)
);

desc department;

use company_schema;

create table dept_locations (
    dnumber int,
    dlocation varchar(20) not null unique,
    constraint fkey_dep_loc foreign key (dnumber) references department(dnumber)
);

desc dept_locations;

use company_schema;

create table project (
    pname varchar (100) not null,
    pnumber int primary key,
    plocation varchar(50) not null,
    dnum int,
    constraint fkey_pro_dep foreign key (dnum) references department(dnumber)
);

desc project;

use company_schema;

create table works_on (
    essn varchar(20),
    pno int,
    hours float,
    constraint fkey_work_ssn foreign key (essn) references employee(ssn),
    constraint fkey_work_pro foreign key (pno) references project(pnumber)
);

desc works_on;

use company_schema;

create table dependent (
    essn varchar(20),
    dependent_name varchar(50) unique,
    gender varchar(7) not null,
    bdate date not null,
    relationship varchar(20) not null,
    constraint fkey_ssn_emp foreign key (essn) references employee(ssn)
);

desc dependent;

use company_schema;

alter table employee add constraint fkey_dep foreign key (dno) references department(dnumber);

desc company_schema.employee;

use company_schema;
insert into department (
    dname,
    dnumber,
    mgr_start_date
) values (
    'Software Quality and Assurance',
    1, '2017-08-03'
), (
    'Web Development',
    2, '2020-04-19'
), (
    'Mobile App Development',
    3, '2018-02-12'
), (
    'SEO and digital marketing',
    4, '2017-09-25'
), (
    'Network security analysis',
    5, '2021-03-06'
);

select * from department;

use company_schema;

insert into employee (
    fname, lname,
    minit, ssn,
    address, gender,
    salary, super_ssn, dno
) values (
    'Chris', 'Jones',
    'D', '123456',
    '32 elm street, Atlanta GA',
    'Male', 74567.31,
    null, 1
), (
    'Hashim', 'Ali',
    'A', '223456',
    '64 westlane, San Francisco CA',
    'Male', 65587.42,
    null, 2
), (
    'Dean', 'Albert',
    'A', '323456',
    '23 warren street, New Jersey NY',
    'Male', 88912.42,
    null, 3
), (
    'Alice', 'Scott',
    'C', '423456',
    'Apt. no. 4, Wellick Tower, Manhattan NY',
    'Female', 78987.71,
    null, 4
), (
    'Michael', 'Johnson',
    'B', '523456',
    '45 oakwood drive, Los Angeles CA',
    'Male', 62345.55,
    null, 1
), (
    'Emily', 'Smith',
    'M', '623456',
    '87 maple avenue, Chicago IL',
    'Female', 54876.23,
   null, 2
), (
    'David', 'Martinez',
    'S', '723456',
    '5 pine street, Houston TX',
    'Male', 71289.76,
   null, 3
), (
    'Sophia', 'Brown',
    'L', '823456',
    '321 cherry lane, Miami FL',
    'Female', 63210.98,
   null, 4
), (
    'Matthew', 'Davis',
    'R', '923456',
    '18 cedar road, Seattle WA',
    'Male', 58763.45,
    null, 1
), (
    'Olivia', 'Wilson',
    'N', '1023456',
    '76 hickory lane, Boston MA',
    'Female', 69854.32,
    null, 2
), (
    'Jacob', 'Anderson',
    'T', '1123456',
    '234 oak street, Philadelphia PA',
    'Male', 74521.88,
    null, 3
), (
    'Ava', 'Taylor',
    'K', '1223456',
    '55 pine avenue, Dallas TX',
    'Female', 61598.47,
    null, 4
), (
    'William', 'Thomas',
    'P', '1323456',
    '98 elm road, San Francisco CA',
    'Male', 81236.54,
    null, 1
), (
    'Emma', 'White',
    'Q', '1423456',
    '24 maple street, Miami FL',
    'Female', 52487.63,
    null, 2
), (
    'James', 'Harris',
    'E', '1523456',
    '76 hickory lane, Houston TX',
    'Male', 69874.32,
    null, 3
), (
    'Isabella', 'Martinez',
    'F', '1623456',
    '34 oakwood drive, Los Angeles CA',
    'Female', 73210.98,
    null, 4
), (
    'Daniel', 'Garcia',
    'U', '1723456',
    '78 cherry lane, Chicago IL',
    'Male', 85632.10,
    null, 1
), (
    'Sophia', 'Brown',
    'L', '1823456',
    '123 cedar road, New York NY',
    'Female', 93587.21,
    null, 2
), (
    'Alexander', 'Jackson',
    'W', '1923456',
    '54 oak street, San Diego CA',
    'Male', 78965.43,
    null, 3
), (
    'Madison', 'Lee',
    'Y', '2023456',
    '76 pine avenue, Atlanta GA',
    'Female', 65478.32,
    null, 4
), (
    'Ethan', 'Adams',
    'Z', '2123456',
    '32 maple lane, Seattle WA',
    'Male', 74569.87,
    null, 1
), (
    'Chloe', 'Gonzalez',
    'X', '2223456',
    '45 cherry road, Boston MA',
    'Female', 58742.69,
    null, 2
), (
    'Mason', 'Hall',
    'C', '2323456',
    '67 elm street, Denver CO',
    'Male', 69874.23,
    null, 3
), (
    'Liam', 'Lewis',
    'V', '2423456',
    '89 oakwood drive, Portland OR',
    'Male', 83547.98,
    null, 4
);

select * from employee;