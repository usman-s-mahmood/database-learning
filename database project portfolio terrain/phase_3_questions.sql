use portfolio_terrain;
-- DDL (Data Definition Language) Queries:
-- 1. Add a new column named "phone_number" to the `users` table:
ALTER TABLE users ADD COLUMN phone_number varchar(20);

-- 2. Create a unique index on the `title` column of the `posts` table:
CREATE UNIQUE INDEX idx_title ON posts(title);

-- 3. Create a foreign key constraint between `reviews.reviewed_by` and `users.user_id`:
ALTER TABLE reviews ADD CONSTRAINT fk_reviewed_by FOREIGN KEY (reviewed_by) REFERENCES users(user_id);

-- 4. Create a new table named `tasks` with columns `task_id`, `description`, and `deadline_date`:
CREATE TABLE tasks (
    task_id int primary key auto_increment,
    description varchar(500) not null,
    deadline_date date
);

-- 5. Modify the `projects` table to add a column named `status`:
ALTER TABLE projects ADD COLUMN status varchar(50) DEFAULT 'Pending';


-- DML (Data Manipulation Language) Queries:
-- 1. Update the `about_user` column of a specific freelancer in the `freelancer` table:
UPDATE freelancer SET about_user = 'Experienced designer with a focus on UI/UX' WHERE freelancer_id = 1;

-- 2. Delete all notifications older than a specific date:
DELETE FROM notifications WHERE notify_date < '2023-01-01';

-- 3. Insert a new record into the `comments` table:
INSERT INTO comments (commenter, commented_post, content, comment_date) 
VALUES (3, 5, 'Great post, very informative!', '2024-06-01');

-- 4. Increase the cost of all contracts by 10%:
UPDATE contracts SET cost = cost * 1.1;

-- 5. Remove duplicates from the `likes` table:
DELETE l1 FROM likes l1 INNER JOIN likes l2 
    WHERE l1.liked_id > l2.liked_id 
    AND l1.liked_by = l2.liked_by 
    AND l1.post_liked = l2.post_liked;


-- Joins Queries:
-- 1. Retrieve the username and email of all users who have posted in the "Web Development" category:
SELECT u.username, u.email
FROM users u
JOIN posts p ON u.user_id = p.author_id
WHERE p.category = 'Web Development';

-- 2. List the titles of all projects along with the corresponding buyer's username and freelancer's username:
SELECT pr.title, u_buyer.username AS buyer_username, u_freelancer.username AS freelancer_username
FROM projects pr
JOIN users u_buyer ON pr.buyer_id = u_buyer.user_id
JOIN users u_freelancer ON pr.seller_id = u_freelancer.user_id;

-- 3. Get the content and author's username of posts that have received likes from a specific user:
SELECT p.content, u.username AS author_username
FROM posts p
JOIN likes l ON p.post_id = l.post_liked
JOIN users u ON p.author_id = u.user_id
WHERE l.liked_by = 3;

-- 4. Retrieve the total number of likes received by each post, along with the post title:
SELECT p.post_id, p.title, COUNT(l.liked_id) AS total_likes
FROM posts p
LEFT JOIN likes l ON p.post_id = l.post_liked
GROUP BY p.post_id, p.title;

-- 5. List the titles of posts along with the total number of comments and likes each post has received:
SELECT p.title, COUNT(DISTINCT c.comment_id) AS total_comments, COUNT(DISTINCT l.liked_id) AS total_likes
FROM posts p
LEFT JOIN comments c ON p.post_id = c.commented_post
LEFT JOIN likes l ON p.post_id = l.post_liked
GROUP BY p.title;
