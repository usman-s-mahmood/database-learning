use portfolio_terrain;
-- ddl (data definition language) queries:
-- 1. add a new column named phone_number to the users table:
alter table users add column phone_number varchar(20) default null;

-- 2. Alter posts table by adding a column for URL/slug for each post, keep default as null:
alter table posts add column slug text default null;



-- 3. create a foreign key constraint between reviews.reviewed_by and users.user_id:
alter table reviews add constraint fk_reviewed_by foreign key (reviewed_by) references users(user_id);

-- 4. create a new table named tasks with columns task_id, description, and deadline_date:
create table tasks (
    task_id int primary key auto_increment,
    description varchar(500) not null,
    deadline_date date
);

-- 5. modify the projects table to add a column named status:
alter table projects add column status varchar(50) default 'pending';


-- dml (data manipulation language) queries:
-- 1. update the about_user column of a specific freelancer in the freelancer table whose freelance ID is 1. Set about_user to experienced designer with a focus on ui/ux:
update freelancer set about_user = 'experienced designer with a focus on ui/ux' where freelancer_id = 1;

-- 2. delete all notifications that older are older than the date 1st January 2023:
delete from notifications where notify_date < '2023-01-01';

-- 3. insert a new record into the comments table:
insert into comments (commenter, commented_post, content, comment_date) 
values (3, 5, 'great post, very informative!', '2024-06-01');

-- 4. increase the cost of contract by 10% for a contract with id 7:
update contracts set cost = cost * 1.1 where contract_id = 7;

-- 5. remove all likes from a post with id 1:
select * from likes;
delete from likes where post_liked = 1;

-- joins queries:
-- 1. retrieve the username and email of all users who have posted in the web development category:
select u.username, u.email from users u join posts p on u.user_id = p.author_id where p.category = 'web development';

-- 2. list the titles of all projects along with the corresponding buyer's username and freelancer's username:
select pr.title, u_buyer.username as buyer_username, u_freelancer.username as freelancer_username from projects pr join users u_buyer on pr.buyer_id = u_buyer.user_id join users u_freelancer on pr.seller_id = u_freelancer.user_id;

-- 3. get the content and author's username of posts that have received likes from a specific user:
select p.content, u.username as author_username from posts p join likes l on p.post_id = l.post_liked join users u on p.author_id = u.user_id where l.liked_by = 3;

-- 4. retrieve the total number of likes received by each post, along with the post title:
select p.post_id, p.title, count(l.liked_id) as total_likes from posts p left join likes l on p.post_id = l.post_liked group by p.post_id, p.title;

-- 5. list the titles of posts along with the total number of comments and likes each post has received:
select p.title, count(distinct c.comment_id) as total_comments, count(distinct l.liked_id) as total_likes from posts p left join comments c on p.post_id = c.commented_post left join likes l on p.post_id = l.post_liked group by p.title;
