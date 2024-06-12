create database portfolio_terrain;

use portfolio_terrain;

create table users (
    user_id int primary key auto_increment,
    first_name varchar(250) not null,
    last_name varchar(250) not null,
    username varchar(250) not null unique,
    email varchar(250) not null unique,
    password varchar(250) not null,
    joining_date date default current_timestamp
);


create table freelancer (
    freelancer_id int primary key auto_increment,
    user_id int,
    about_user varchar(1000) not null,
    social_link varchar(500) default null,
    profile_pic varchar(300) default null,
    skills varchar(1000) not null,
    constraint freelancer_user_id foreign key (user_id) REFERENCES users(user_id)
);

create table buyer (
    buyer_id int primary key auto_increment,
    user_id int,
    about_user varchar(1000) not null,
    social_link varchar(500) default null,
    profile_pic varchar(300) default null,
    constraint buyer_user_id foreign key (user_id) REFERENCES users(user_id)
);

create table posts (
    post_id int primary key auto_increment,
    author_id int,
    title varchar(1000) not null,
    content varchar(5000) not null,
    media_content varchar(750) default null,
    date_posted DATE default current_timestamp,
    category varchar(250) not null,
    constraint post_author foreign key (author_id) references users(user_id)
);

create table messages (
    message_id int primary key auto_increment,
    sender_id int,
    reciever_id int,
    message_content text not null,
    message_date date default current_timestamp,
    attachements text default null,
    constraint send_user_id foreign key (sender_id) references users(user_id),
    constraint recieve_user_id foreign key (reciever_id) references users(user_id)
);

create table notifications (
    notification_id int primary key auto_increment,
    user_notified int,
    content varchar(250) not null,
    notify_date date default current_timestamp,
    constraint user_notify foreign key (user_notified) references users(user_id)
);

create table contracts (
    contract_id int primary key auto_increment,
    title text not null,
    subject text not null,
    terms text not null,
    buyer_id int,
    freelancer_id int,
    cost double not null,
    company_fee double not null,
    start_date date,
    end_date date,
    constraint working_user foreign key (freelancer_id) references freelancer(freelancer_id),
    constraint benificiary foreign key (buyer_id) references buyer(buyer_id)
);

create table projects (
    project_id int primary key auto_increment,
    seller_id int,
    buyer_id int,
    title text not null,
    media_content text not null,
    category varchar(250) not null,
    start_date date,
    end_date date,
    constraint seller_rel foreign key (seller_id) references freelancer(freelancer_id),
    constraint buyer_rel foreign key (buyer_id) references buyer(buyer_id)
);

create table categories (
    category_id int primary key auto_increment,
    category_name varchar(250) not null,
    added_at date default current_time
);

create table reviews (
    review_id int primary key auto_increment,
    content text not null,
    rating double not null,
    reviewed_by int,
    project_reviewed int,
    review_date date,
    constraint reviewing_user foreign key (reviewed_by) references buyer(buyer_id),
    constraint reviewed_project foreign key (project_reviewed) references projects (project_id)
);

create table comments (
    comment_id int primary key auto_increment,
    commenter int,
    commented_post int,
    content text,
    comment_date date,
    constraint commenting_user foreign key (commenter) references users(user_id),
    constraint post_commented foreign key (commented_post) references posts(post_id)
);

create table likes (
    liked_id int primary key auto_increment,
    liked_by int,
    post_liked int,
    like_date date,
    constraint user_liked foreign key (liked_by) references users(user_id),
    constraint liked_post foreign key (post_liked) references posts(post_id)
);

create table payments (
    payment_id int primary key auto_increment,
    buyer_id int,
    seller_id int,
    amount float not null,
    company_fee float not null,
    payment_date date default current_timestamp,
    constraint buyer_rel_pay foreign key (buyer_id) references buyer(buyer_id),
    constraint seller_rel_pay foreign key (seller_id) references freelancer(freelancer_id)
);

alter table payments add column credit_card_number varchar(50) default null;

create table admin (
    admin_id int primary key auto_increment,
    first_name varchar(250) not null,
    last_name varchar(250) not null,
    username varchar(250) not null unique,
    email varchar(250) not null unique,
    password varchar(250) not null,
    joining_date date default current_timestamp
);

create table management (
    manager_id int primary key auto_increment,
    first_name varchar(250) not null,
    last_name varchar(250) not null,
    username varchar(250) not null unique,
    email varchar(250) not null unique,
    password varchar(250) not null,
    joining_date date default current_timestamp
);

