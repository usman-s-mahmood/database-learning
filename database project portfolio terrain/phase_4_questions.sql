use portfolio_terrain;
-- nested queries
-- 1. retrieve the latest post content from each user:
select u.username,
    p.title,
    p.content
from users u
    join posts p on u.user_id = p.author_id
where p.date_posted = (
        select max(p2.date_posted)
        from posts p2
        where p2.author_id = u.user_id
    );
-- 2. find users who have posted in the 'web development' category and the date of their latest post in that category:
select u.username,
    max(p.date_posted) as latest_post
from users u
    join posts p on u.user_id = p.author_id
where p.category = 'web development'
group by u.username;
-- 3. list all freelancers with a specific skill and their highest rated project:
select f.user_id,
    u.username,
    p.title,
    r.rating
from freelancer f
    join users u on f.user_id = u.user_id
    join projects p on f.freelancer_id = p.seller_id
    join reviews r on p.project_id = r.project_reviewed
where f.skills like '%python%'
    and r.rating = (
        select max(r2.rating)
        from reviews r2
            join projects p2 on r2.project_reviewed = p2.project_id
        where p2.seller_id = f.freelancer_id
    );
-- 4. find the buyer who has spent the most on contracts:
select b.user_id,
    u.username,
    sum(c.cost) as total_spent
from buyer b
    join users u on b.user_id = u.user_id
    join contracts c on b.buyer_id = c.buyer_id
group by b.user_id
order by total_spent desc
limit 1;
-- 5. retrieve comments on the most liked post:
select c.content,
    u.username,
    c.comment_date
from comments c
    join users u on c.commenter = u.user_id
where c.commented_post = (
        select l.post_liked
        from likes l
        group by l.post_liked
        order by count(l.liked_id) desc
        limit 1
    );
-- correlated queries
-- 1. retrieve all posts along with the number of comments they have received:
select p.title,
    p.content,
    p.date_posted,
    (
        select count(*)
        from comments c
        where c.commented_post = p.post_id
    ) as comment_count
from posts p;
-- 2. list all freelancers along with the number of contracts they are working on:
select f.user_id,
    u.username,
    (
        select count(*)
        from contracts c
        where c.freelancer_id = f.freelancer_id
    ) as contract_count
from freelancer f
    join users u on f.user_id = u.user_id;
-- 3. get all users and their most recent notification:
select u.username,
    n.content,
    n.notify_date
from users u
    left join notifications n on u.user_id = n.user_notified
where n.notify_date = (
        select max(n2.notify_date)
        from notifications n2
        where n2.user_notified = u.user_id
    );
-- 4. show all buyers along with the total amount they have spent:
select b.user_id,
    u.username,
    (
        select sum(p.amount)
        from payments p
        where p.buyer_id = b.buyer_id
    ) as total_spent
from buyer b
    join users u on b.user_id = u.user_id;
-- 5. list all projects along with the highest rating they received in reviews:
select p.title,
    p.category,
    (
        select max(r.rating)
        from reviews r
        where r.project_reviewed = p.project_id
    ) as highest_rating
from projects p;