-- DDL queries

create database mids_database;
use mids_database;

create table students (
    id int primary key AUTO_INCREMENT,
    name varchar(255) not null,
    roll_num varchar(20) unique,
    subjects varchar(250) not null,
    phone_number varchar(20) unique,
    email varchar(250) unique,
    teacher int
);

desc students;

alter table students change teacher teacher_id int;
alter table students add column majors varchar(250) not null;
-- DML
insert into students (
    name,
    roll_num,
    subjects,
    phone_number,
    email,
    majors
) values 
('std 3', 'rr3', 'DSA, DB, PBD', '18398143', 'std3@mail.com', 'Computer Science'),
('std 4', 'rr4', 'DSA, DB, PBD', '18398144', 'std4@mail.com', 'Computer Science');

select name, roll_num, email from students WHERE majors = 'Computer Science';

select * from students;
alter table students add COLUMN dob DATE default null;
update students set dob = '2003-07-21' where id = 1;

select name, roll_num, email, dob, TIMESTAMPDIFF(year, dob, CURRENT_DATE) as age from students;
delete from students;

create table staff (
    staffNo varchar(5) primary key,
    fname VARCHAR(250) not null,
    lname VARCHAR(250) not null,
    position varchar(50) not null,
    sex varchar (5) not null,
    dob date not null,
    salary float not null default 0.0,
    branchNo varchar(5) not null
);

create table vehicle (
    regNo int primary key AUTO_INCREMENT,
    model varchar(15) not null,
    year char(4) not null,
    color varchar(15) not null,
    staffNo VARCHAR(5),
    constraint fkey_vehical_staff FOREIGN key (staffNo) REFERENCES staff(staffNo)
);

alter table staff add column staffNo_viewing varchar(5) after staffNo;
desc staff;

alter table staff add constraint fkey_staffNo_viewing FOREIGN KEY (staffNo_viewing) REFERENCES staff(staffNo);

alter table viewing change comments review varchar(150);
select birthdate, salary from staff where fname = 'John' and lname = 'White';
select street, city, rent, rooms from propertyForRent where type='Flat' and room >= 4 order by desc rent;

select DISTINCT city as Locations where rent between 300 and 450;
select * from staff where position = 'manager' and salary between 9000 and 18000;
select * from staff where position = 'manager' and salary >= 9000 and salary <= 18000;

select * from privateOwner where fName like '%l' and lName like '--r%';
select fname, lname, sex, salary, branchNo from staff where position = 'Supervisor';

select c.fname, c.lname from clients c, viewing v, propertyForRent pfr where pfr.city = 'Glasgow' and v.comments = null;