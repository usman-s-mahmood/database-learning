-- Active: 1714057803737@@127.0.0.1@3306@quiz2
SHOW DATABASES;
CREATE DATABASE quiz2;
USE quiz2;
create table student (
    id int primary key AUTO_INCREMENT,
    name varchar(128) not null,
    gender_id int,
    phone_number varchar(20) not null,
    birth_date date not null,
    joining date DEFAULT CURRENT_TIMESTAMP
);
DESC student;
CREATE Table category (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10)
);
DESC category;
ALTER Table student ADD constraint fkey_gender FOREIGN KEY (gender_id) REFERENCES category(id);
INSERT INTO category (name) VALUES ('Male'), ('Female');
INSERT INTO student 
(name, gender_id, phone_number, birth_date) VALUES 
('std2', 2, '1234759134', '20060908'),
('std3', 2, '1234759134', '20060908'),
('std4', 1, '1234759134', '20060908'),
('std5', 1, '1234759134', '20060908'),
('std6', 1, '1234759134', '20060908'),
('std7', 2, '1234759134', '20060908'),
('std8', 2, '1234759134', '20060908');
select s.id, s.name, c.name from student s, category c;
select s.id, s.name, c.name from student s, category c where s.gender_id = c.id;

select name, timestampdiff(year, birth_date, current_date()) as age from quiz2.student;