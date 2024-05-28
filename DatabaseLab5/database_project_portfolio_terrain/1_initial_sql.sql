show databases;

create database portfolio_terrain;

create table users_table(
	user_id int primary key auto_increment,
    first_name varchar(150) not null,
    last_name varchar(150) not null,
    username varchar (150) not null unique,
    email varchar (150) not null unique,
    last_login date 
);

create table freelancers (
	freelancer_id int primary key auto_increment,
    profile_picture varchar(560) default null,
    about_user varchar(550) not null,
    skills varchar(550)
);

