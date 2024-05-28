-- Active: 1714057803737@@127.0.0.1@3306@online_shoping_store
show databases;

create database online_shoping_store;

use online_shoping_store;

create table customers (
    customer_id int primary key auto_increment,
    fname varchar(100) not null,
    lname varchar(100) not null,
    email varchar(200) not null unique,
    phone_number varchar(20) not null unique,
    house_address varchar(1000) not null,
    date_of_birth date not null,
    city varchar(50) not null,
    gender varchar(5) not null,
    login_password varchar(100) not null
);

desc online_shoping_store.customers;

use online_shoping_store;
create table categories (
    category_id int primary key auto_increment,
    name varchar(200) unique not null
);

desc online_shoping_store.categories;

use online_shoping_store;
create table subcategories (
    sub_cat_id int primary key auto_increment,
    sub_cat_name varchar(200) not null unique,
    category_id int
);

alter table online_shoping_store.subcategories add constraint cat_id_fkey foreign key (category_id) references online_shoping_store.categories(category_id);

desc online_shoping_store.subcategories;

use online_shoping_store;
create table products (
    product_id int primary key auto_increment,
    name varchar(150) not null,
    expiry_date date default null,
    description varchar(1000) not null,
    category_id int,
    sub_cat_id int,
    quantity int not null,
    price float not null,
    constraint cat_id_fkey_prod foreign key (category_id) references categories(category_id),
    constraint sub_cat_id_fkey_prod foreign key (sub_cat_id) references subcategories(sub_cat_id)
);

desc products;

use online_shoping_store;

create table discount_codes (
    discount_id int primary key auto_increment,
    promo_name varchar(50) not null unique,
    start_date date not null,
    end_date date not null,
    discount_percent float not null
);

desc discount_codes;

use online_shoping_store;

create table orders(
    order_id int primary key auto_increment,
    products varchar(1000) not null,
    status varchar(50) not null default 'Not Delivered!',
    customer_id int,
    discount_id int,
    house_address varchar(1000) not null,
    payment_mode varchar(100) not null default 'Cash on delivery',
    order_date timestamp default current_timestamp,
    total_price float not null,
    constraint cst_order_rel foreign key (customer_id) references customers(customer_id),
    constraint discount_fkey foreign key (discount_id) references discount_codes(discount_id)
);

desc orders;

use online_shoping_store;

create table delivery_person (
    delivery_person_id int primary key auto_increment,
    date_of_birth date not null,
    name varchar(250) not null,
    phone_number varchar(20) not null unique,
    email varchar(150) not null unique,
    vehical_info varchar(500) not null,
    shift varchar(10) not null,
    city varchar(50) not null
);

desc delivery_person;

create table delivery (
    delivery_id int primary key auto_increment,
    order_id int,
    customer_id int,
    address varchar(1000),
    recieved_by varchar(200),
    delivery_person_id int,
    constraint order_delivery_rel foreign key (order_id) references orders(order_id),
    constraint customer_delivery_rel foreign key (customer_id) references customers(customer_id),
    constraint delivery_person_rel foreign key (delivery_person_id) references delivery_person(delivery_person_id)
);

desc delivery;

use online_shoping_store;
create table payments (
    payment_id int primary key,
    order_id int,
    customer_id int,
    payment_method varchar (50) default 'Cash on delivery',
    amount float not null,
    transaction_date date not null,
    constraint cst_pay_rel foreign key (customer_id) references customers(customer_id),
    constraint order_pay_rel foreign key (order_id) references orders(order_id)
);

desc payments;

use online_shoping_store;

insert into customers (fname, lname, email, phone_number, house_address, date_of_birth, city, gender, login_password)
value
('John', 'Doe', 'john@example.com', '1234567890', '123 Main St', '1990-01-01', 'New York', 'M', 'password123'),
('Alice', 'Smith', 'alice@example.com', '9876543210', '456 Elm St', '1985-05-15', 'Los Angeles', 'F', 'abc123'),
('Michael', 'Johnson', 'michael@example.com', '5678901234', '789 Oak St', '1982-11-30', 'Chicago', 'M', 'passpass'),
('Emily', 'Brown', 'emily@example.com', '3456789012', '101 Pine St', '1995-03-20', 'Houston', 'F', 'hello123'),
('David', 'Wilson', 'david@example.com', '7890123456', '555 Cedar St', '1988-07-10', 'Miami', 'M', 'qwerty'),
('Emma', 'Jones', 'emma@example.com', '2345678901', '222 Maple St', '1992-09-25', 'San Francisco', 'F', 'password'),
('James', 'Taylor', 'james@example.com', '8901234567', '777 Walnut St', '1983-04-18', 'Seattle', 'M', 'abc123'),
('Sophia', 'Martinez', 'sophia@example.com', '4567890123', '888 Pine St', '1998-06-12', 'Boston', 'F', 'passpass'),
('William', 'Garcia', 'william@example.com', '6789012345', '999 Oak St', '1980-12-05', 'Austin', 'M', 'hello123'),
('Olivia', 'Lopez', 'olivia@example.com', '9012345678', '333 Elm St', '1993-08-30', 'Dallas', 'F', 'qwerty');

insert into categories (name)
value
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Sports'),
('Beauty'),
('Toys'),
('Food & Grocery'),
('Furniture'),
('Health & Fitness');

insert into subcategories (sub_cat_name, category_id)
value
('Smartphones', 1),
('Laptops', 1),
('T-Shirts', 2),
('Jeans', 2),
('Fiction', 3),
('Cookware', 4),
('Fitness Equipment', 10),
('Skincare', 6),
('Action Figures', 7),
('Cereals', 8);

insert into products (name, expiry_date, description, category_id, sub_cat_id, quantity, price)
value
('iPhone 12', '2025-12-31', 'Latest iPhone model', 1, 1, 100, 999.99),
('Samsung Galaxy Book', '2025-12-31', 'High-performance laptop', 1, 2, 50, 1499.99),
('Plain White T-Shirt', NULL, 'Basic cotton t-shirt', 2, 3, 200, 19.99),
('Slim Fit Jeans', NULL, 'Stylish denim jeans', 2, 4, 150, 39.99),
('To Kill a Mockingbird', NULL, 'Classic novel by Harper Lee', 3, 5, 100, 9.99),
('Non-Stick Cookware Set', NULL, 'Essential cookware for the kitchen', 4, 6, 80, 149.99),
('Treadmill', NULL, 'Home fitness equipment', 10, 7, 30, 999.99),
('Anti-Aging Cream', '2024-12-31', 'Reduce wrinkles and fine lines', 6, 8, 120, 29.99),
('Superhero Action Figure', NULL, 'Collectible toy for kids', 7, 9, 50, 14.99),
('Corn Flakes', '2025-12-31', 'Breakfast cereal', 8, 10, 300, 4.99);

insert into discount_codes (promo_name, start_date, end_date, discount_percent)
value
('NEWYEAR2024', '2024-01-01', '2024-01-31', 10),
('FREESHIP', '2024-02-01', '2024-02-28', 5),
('SALE2024', '2024-03-01', '2024-03-31', 15),
('SPRING20', '2024-04-01', '2024-04-30', 20),
('MEMORIALDAY', '2024-05-01', '2024-05-31', 10),
('FATHERSDAY', '2024-06-01', '2024-06-30', 25),
('BACKTOSCHOOL', '2024-07-01', '2024-07-31', 15),
('LABORDAY', '2024-08-01', '2024-08-31', 20),
('WINTERFEST', '2024-09-01', '2024-09-30', 30),
('BLESSEDFRIDAY', '2024-10-01', '2024-10-31', 40);

insert into orders (products, customer_id, discount_id, house_address, total_price)
value
('iPhone 12, Slim Fit Jeans', 1, 1, '123 Main St', 1039.98),
('Plain White T-Shirt, Non-Stick Cookware Set', 2, 2, '456 Elm St', 169.98),
('To Kill a Mockingbird', 3, 3, '789 Oak St', 9.99),
('Superhero Action Figure', 4, NULL, '101 Pine St', 14.99),
('Corn Flakes', 5, 5, '555 Cedar St', 4.99),
('Samsung Galaxy Book, Anti-Aging Cream', 6, 6, '222 Maple St', 1529.98),
('Slim Fit Jeans, Fitness Equipment', 7, NULL, '777 Walnut St', 1039.98),
('Plain White T-Shirt, Treadmill', 8, 8, '888 Pine St', 1019.98),
('To Kill a Mockingbird, iPhone 12', 9, 9, '999 Oak St', 1009.98),
('Corn Flakes, Superhero Action Figure', 10, NULL, '333 Elm St', 19.98);

insert into delivery_person (date_of_birth, name, phone_number, email, vehical_info, shift, city)
value
('1985-01-15', 'Mark Johnson', '1234567890', 'mark@example.com', 'Van', 'Morning', 'New York'),
('1988-05-20', 'Sarah Smith', '9876543210', 'sarah@example.com', 'Car', 'Afternoon', 'Los Angeles'),
('1990-09-10', 'Chris Brown', '5678901234', 'chris@example.com', 'Truck', 'Evening', 'Chicago'),
('1983-12-25', 'Jessica Wilson', '3456789012', 'jessica@example.com', 'Bike', 'Night', 'Houston'),
('1995-03-30', 'Alex Martinez', '7890123456', 'alex@example.com', 'Scooter', 'Morning', 'Miami'),
('1980-07-05', 'Sophia Taylor', '2345678901', 'sophia@example.com', 'Bicycle', 'Afternoon', 'San Francisco'),
('1992-11-15', 'Kevin Garcia', '8901234567', 'kevin@example.com', 'Van', 'Evening', 'Seattle'),
('1986-04-20', 'Emma Jones', '4567890123', 'emma@example.com', 'Car', 'Night', 'Boston'),
('1998-08-10', 'Michael Lopez', '9012345678', 'michael@example.com', 'Truck', 'Morning', 'Austin'),
('1982-02-28', 'Olivia Brown', '6789012345', 'olivia@example.com', 'Bike', 'Afternoon', 'Dallas');

insert into delivery (order_id, customer_id, address, recieved_by, delivery_person_id)
value
(1, 1, '123 Main St', 'John Doe', 1),
(2, 2, '456 Elm St', 'Alice Smith', 2),
(3, 3, '789 Oak St', 'Michael Johnson', 3),
(4, 4, '101 Pine St', 'Emily Brown', 4),
(5, 5, '555 Cedar St', 'David Wilson', 5),
(6, 6, '222 Maple St', 'Emma Jones', 6),
(7, 7, '777 Walnut St', 'James Taylor', 7),
(8, 8, '888 Pine St', 'Sophia Martinez', 8),
(9, 9, '999 Oak St', 'William Garcia', 9),
(10, 10, '333 Elm St', 'Olivia Lopez', 10);

insert into payments (payment_id, order_id, customer_id, amount, transaction_date)
value
(1, 1, 1, 1039.98, '2024-01-15'),
(2, 2, 2, 169.98, '2024-02-20'),
(3, 3, 3, 9.99, '2024-03-10'),
(4, 4, 4, 14.99, '2024-04-05'),
(5, 5, 5, 4.99, '2024-05-01'),
(6, 6, 6, 1529.98, '2024-06-15'),
(7, 7, 7, 1039.98, '2024-07-20'),
(8, 8, 8, 1019.98, '2024-08-10'),
(9, 9, 9, 1009.98, '2024-09-05'),
(10, 10, 10, 19.98, '2024-10-01');

use online_shoping_store;
select * from customers;
select * from categories;
select * from subcategories;
select * from products;
select * from discount_codes;
select * from orders;
select * from delivery_person;
select * from delivery;
select * from payments;

DESC categories;
DESC customers;
DESC delivery;
DESC delivery_person;
DESC discount_codes;
DESC orders;
DESC payments;
DESC products;
DESC subcategories;