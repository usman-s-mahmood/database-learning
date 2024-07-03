drop database portfolio_terrain;

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

use portfolio_terrain;

insert into users (
    first_name, last_name, username,
    email, password
) values
    ('James', 'Alderson', 'james.alderson', 'james.alderson@mail.com', 'pass123456seven'),
    ('John', 'Doe', 'john.doe', 'john.doe@mail.com', 'password456'),
    ('Jane', 'Smith', 'jane.smith', 'jane.smith@mail.com', 'password789'),
    ('Alice', 'Johnson', 'alice.johnson', 'alice.johnson@mail.com', 'passwordABC'),
    ('Bob', 'Brown', 'bob.brown', 'bob.brown@mail.com', 'passwordDEF'),
    ('Charlie', 'Davis', 'charlie.davis', 'charlie.davis@mail.com', 'passwordGHI'),
    ('David', 'Evans', 'david.evans', 'david.evans@mail.com', 'passwordJKL'),
    ('Emma', 'Garcia', 'emma.garcia', 'emma.garcia@mail.com', 'passwordMNO'),
    ('Frank', 'Harris', 'frank.harris', 'frank.harris@mail.com', 'passwordPQR'),
    ('Grace', 'Clark', 'grace.clark', 'grace.clark@mail.com', 'passwordSTU'),
    ('Hank', 'Martinez', 'hank.martinez', 'hank.martinez@mail.com', 'passwordVWX'),
    ('Ivy', 'Robinson', 'ivy.robinson', 'ivy.robinson@mail.com', 'passwordYZA'),
    ('Jack', 'Lewis', 'jack.lewis', 'jack.lewis@mail.com', 'passwordBCD'),
    ('Kara', 'Walker', 'kara.walker', 'kara.walker@mail.com', 'passwordEFG'),
    ('Liam', 'Hall', 'liam.hall', 'liam.hall@mail.com', 'passwordHIJ'),
    ('Mia', 'Allen', 'mia.allen', 'mia.allen@mail.com', 'passwordKLM'),
    ('Noah', 'Young', 'noah.young', 'noah.young@mail.com', 'passwordNOP'),
    ('Olivia', 'Hernandez', 'olivia.hernandez', 'olivia.hernandez@mail.com', 'passwordQRS'),
    ('Paul', 'King', 'paul.king', 'paul.king@mail.com', 'passwordTUV'),
    ('Quincy', 'Scott', 'quincy.scott', 'quincy.scott@mail.com', 'passwordWXY'),
    ('Rachel', 'Adams', 'rachel.adams', 'rachel.adams@mail.com', 'passwordZAB'),
    ('Sam', 'Baker', 'sam.baker', 'sam.baker@mail.com', 'passwordCDE'),
    ('Tina', 'Gonzalez', 'tina.gonzalez', 'tina.gonzalez@mail.com', 'passwordFGH'),
    ('Umar', 'Nelson', 'umar.nelson', 'umar.nelson@mail.com', 'passwordIJK'),
    ('Vicky', 'Carter', 'vicky.carter', 'vicky.carter@mail.com', 'passwordLMN'),
    ('Wade', 'Mitchell', 'wade.mitchell', 'wade.mitchell@mail.com', 'passwordOPQ'),
    ('Xena', 'Perez', 'xena.perez', 'xena.perez@mail.com', 'passwordRST'),
    ('Yasmin', 'Roberts', 'yasmin.roberts', 'yasmin.roberts@mail.com', 'passwordUVW'),
    ('Zane', 'Turner', 'zane.turner', 'zane.turner@mail.com', 'passwordXYZ'),
    ('Aaron', 'Phillips', 'aaron.phillips', 'aaron.phillips@mail.com', 'passwordABC1'),
    ('Bella', 'Campbell', 'bella.campbell', 'bella.campbell@mail.com', 'passwordDEF2'),
    ('Carter', 'Parker', 'carter.parker', 'carter.parker@mail.com', 'passwordGHI3'),
    ('Diana', 'Collins', 'diana.collins', 'diana.collins@mail.com', 'passwordJKL4'),
    ('Evan', 'Edwards', 'evan.edwards', 'evan.edwards@mail.com', 'passwordMNO5'),
    ('Fiona', 'Morris', 'fiona.morris', 'fiona.morris@mail.com', 'passwordPQR6'),
    ('Gavin', 'Bell', 'gavin.bell', 'gavin.bell@mail.com', 'passwordSTU7'),
    ('Holly', 'Murphy', 'holly.murphy', 'holly.murphy@mail.com', 'passwordVWX8'),
    ('Isaac', 'Bailey', 'isaac.bailey', 'isaac.bailey@mail.com', 'passwordYZA9'),
    ('Jade', 'Rivera', 'jade.rivera', 'jade.rivera@mail.com', 'passwordBCD0'),
    ('Kevin', 'Reed', 'kevin.reed', 'kevin.reed@mail.com', 'passwordEFG1'),
    ('Lena', 'Gonzalez', 'lena.gonzalez', 'lena.gonzalez@mail.com', 'passwordHIJ2'),
    ('Mason', 'Hughes', 'mason.hughes', 'mason.hughes@mail.com', 'passwordKLM3'),
    ('Nina', 'Cox', 'nina.cox', 'nina.cox@mail.com', 'passwordNOP4'),
    ('Oscar', 'Howard', 'oscar.howard', 'oscar.howard@mail.com', 'passwordQRS5'),
    ('Paula', 'Ward', 'paula.ward', 'paula.ward@mail.com', 'passwordTUV6'),
    ('Quinn', 'Torres', 'quinn.torres', 'quinn.torres@mail.com', 'passwordWXY7'),
    ('Ruth', 'Peterson', 'ruth.peterson', 'ruth.peterson@mail.com', 'passwordZAB8')
;

select * from users where user_id = 1;

insert into freelancer (
    user_id, about_user, social_link, profile_pic, skills
) values
    (1, 'Experienced web developer with a passion for creating interactive applications.', 'https://linkedin.com/in/jamesalderson', 'https://example.com/profiles/james.jpg', 'HTML, CSS, JavaScript, React, Node.js'),
    (2, 'Graphic designer specializing in branding and visual identity.', 'https://linkedin.com/in/johndoe', 'https://example.com/profiles/john.jpg', 'Photoshop, Illustrator, InDesign, Branding'),
    (3, 'Content writer and SEO specialist with 5 years of experience.', 'https://linkedin.com/in/janesmith', 'https://example.com/profiles/jane.jpg', 'SEO, Content Writing, Blogging, Copywriting'),
    (4, 'Mobile app developer proficient in both Android and iOS platforms.', 'https://linkedin.com/in/alicejohnson', 'https://example.com/profiles/alice.jpg', 'Java, Kotlin, Swift, Flutter'),
    (5, 'Digital marketer with a strong focus on social media campaigns.', 'https://linkedin.com/in/bobbrown', 'https://example.com/profiles/bob.jpg', 'Social Media Marketing, PPC, Google Analytics'),
    (6, 'UI/UX designer creating user-friendly interfaces for web and mobile apps.', 'https://linkedin.com/in/charliedavis', 'https://example.com/profiles/charlie.jpg', 'Sketch, Figma, Adobe XD, Prototyping'),
    (7, 'Back-end developer with expertise in database management and APIs.', 'https://linkedin.com/in/davidevans', 'https://example.com/profiles/david.jpg', 'Python, Django, SQL, REST APIs'),
    (8, 'Freelance photographer specializing in portrait and landscape photography.', 'https://linkedin.com/in/emmagarcia', 'https://example.com/profiles/emma.jpg', 'Photography, Lightroom, Photoshop, Photo Editing'),
    (9, 'Video editor and motion graphics artist with over 10 years of experience.', 'https://linkedin.com/in/frankharris', 'https://example.com/profiles/frank.jpg', 'Final Cut Pro, After Effects, Premiere Pro'),
    (10, 'Copywriter and content strategist for digital and print media.', 'https://linkedin.com/in/graceclark', 'https://example.com/profiles/grace.jpg', 'Copywriting, Content Strategy, Editing'),
    (11, 'Full-stack developer skilled in both front-end and back-end technologies.', 'https://linkedin.com/in/hankmartinez', 'https://example.com/profiles/hank.jpg', 'JavaScript, Ruby on Rails, PostgreSQL, React'),
    (12, 'Project manager with experience in Agile and Scrum methodologies.', 'https://linkedin.com/in/ivyrobinson', 'https://example.com/profiles/ivy.jpg', 'Project Management, Agile, Scrum, JIRA'),
    (13, 'Data analyst with a knack for turning data into actionable insights.', 'https://linkedin.com/in/jacklewis', 'https://example.com/profiles/jack.jpg', 'Excel, SQL, R, Python, Data Visualization'),
    (14, 'Software engineer focused on building scalable web applications.', 'https://linkedin.com/in/karawalker', 'https://example.com/profiles/kara.jpg', 'Java, Spring, Hibernate, AWS'),
    (15, 'Freelance writer with a focus on travel and lifestyle content.', 'https://linkedin.com/in/liamhall', 'https://example.com/profiles/liam.jpg', 'Writing, Blogging, Travel Writing, Content Creation')
;

insert into buyer (
    user_id, about_user, social_link, profile_pic
) values
    (16, 'Entrepreneur looking to build a robust e-commerce platform.', 'https://linkedin.com/in/noahyoung', 'https://example.com/profiles/noah.jpg'),
    (17, 'Small business owner in need of digital marketing services.', 'https://linkedin.com/in/oliviahernandez', 'https://example.com/profiles/olivia.jpg'),
    (18, 'Startup founder seeking a skilled developer for a new app.', 'https://linkedin.com/in/paulking', 'https://example.com/profiles/paul.jpg'),
    (19, 'Non-profit organization manager looking for a website redesign.', 'https://linkedin.com/in/quincyscott', 'https://example.com/profiles/quincy.jpg'),
    (20, 'E-commerce store owner interested in improving user experience.', 'https://linkedin.com/in/racheladams', 'https://example.com/profiles/rachel.jpg'),
    (21, 'Freelancer hiring platform looking to onboard more developers.', 'https://linkedin.com/in/sambaker', 'https://example.com/profiles/sam.jpg'),
    (22, 'Blogger in need of high-quality content for various topics.', 'https://linkedin.com/in/tinagonzalez', 'https://example.com/profiles/tina.jpg'),
    (23, 'Real estate agent looking for a professional photographer.', 'https://linkedin.com/in/umarnelson', 'https://example.com/profiles/umar.jpg'),
    (24, 'Travel agency seeking a copywriter for new travel guides.', 'https://linkedin.com/in/vickycarter', 'https://example.com/profiles/vicky.jpg'),
    (25, 'Online magazine editor looking for a graphic designer.', 'https://linkedin.com/in/wademitchell', 'https://example.com/profiles/wade.jpg'),
    (26, 'Tech startup looking for a freelance UI/UX designer.', 'https://linkedin.com/in/xenaperez', 'https://example.com/profiles/xena.jpg'),
    (27, 'Restaurant owner seeking a photographer for a new menu.', 'https://linkedin.com/in/yasminroberts', 'https://example.com/profiles/yasmin.jpg'),
    (28, 'Local business owner in need of a new brand identity.', 'https://linkedin.com/in/zaneturner', 'https://example.com/profiles/zane.jpg'),
    (29, 'Event planner looking for a social media manager.', 'https://linkedin.com/in/aaronphillips', 'https://example.com/profiles/aaron.jpg'),
    (30, 'Marketing agency searching for a content strategist.', 'https://linkedin.com/in/bellacampbell', 'https://example.com/profiles/bella.jpg'),
    (31, 'Fitness coach needing a website for online bookings.', 'https://linkedin.com/in/carterparker', 'https://example.com/profiles/carter.jpg'),
    (32, 'Podcast producer looking for a skilled audio editor.', 'https://linkedin.com/in/dianacollins', 'https://example.com/profiles/diana.jpg'),
    (33, 'Online retailer interested in improving SEO.', 'https://linkedin.com/in/evanedwards', 'https://example.com/profiles/evan.jpg'),
    (34, 'Fashion blogger in need of a professional photographer.', 'https://linkedin.com/in/fionamorris', 'https://example.com/profiles/fiona.jpg'),
    (35, 'Food blogger looking for a freelance videographer.', 'https://linkedin.com/in/gavinbell', 'https://example.com/profiles/gavin.jpg'),
    (36, 'App developer seeking a UI designer for a new project.', 'https://linkedin.com/in/hollymurphy', 'https://example.com/profiles/holly.jpg'),
    (37, 'Musician in need of a website to showcase their work.', 'https://linkedin.com/in/isaacbailey', 'https://example.com/profiles/isaac.jpg'),
    (38, 'E-book publisher looking for a cover designer.', 'https://linkedin.com/in/jaderivera', 'https://example.com/profiles/jade.jpg'),
    (39, 'Film producer seeking a video editor for a new project.', 'https://linkedin.com/in/kevinreed', 'https://example.com/profiles/kevin.jpg'),
    (40, 'Consultant in need of a professional website.', 'https://linkedin.com/in/lenagonzalez', 'https://example.com/profiles/lena.jpg'),
    (41, 'Freelance recruiter looking for a software developer.', 'https://linkedin.com/in/masonhughes', 'https://example.com/profiles/mason.jpg'),
    (42, 'Startup looking for a skilled marketing strategist.', 'https://linkedin.com/in/ninacox', 'https://example.com/profiles/nina.jpg'),
    (43, 'Corporate manager needing a presentation designer.', 'https://linkedin.com/in/oscarhoward', 'https://example.com/profiles/oscar.jpg'),
    (44, 'Health coach in need of a content writer.', 'https://linkedin.com/in/paulaward', 'https://example.com/profiles/paula.jpg'),
    (45, 'Entrepreneur looking for a branding expert.', 'https://linkedin.com/in/quinntorres', 'https://example.com/profiles/quinn.jpg'),
    (46, 'Educational consultant needing a curriculum designer.', 'https://linkedin.com/in/ruthpeterson', 'https://example.com/profiles/ruth.jpg'),
    (47, 'Restaurant owner needing a website overhaul.', 'https://linkedin.com/in/stevetaylor', 'https://example.com/profiles/steve.jpg');

insert into posts (
    author_id, title, content, media_content, category
) values
    (1, 'Web Development Tips', 'Sharing tips on building responsive websites.', null, 'Web Development'),
    (2, 'Visual Branding Insights', 'Discussing the importance of visual branding.', null, 'Graphic Design'),
    (3, 'SEO-friendly Content Writing', 'Tips for writing content that ranks well in search engines.', null, 'Content Writing'),
    (4, 'Mobile App Trends 2024', 'Exploring upcoming trends in mobile app development.', null, 'Mobile App Development'),
    (5, 'Maximizing Social Media ROI', 'Strategies for maximizing ROI from social media efforts.', null, 'Digital Marketing'),
    (6, 'Engaging UI/UX Designs', 'Principles for creating engaging user experiences.', null, 'UI/UX Design'),
    (7, 'Scalable API Development', 'Best practices for building scalable APIs.', null, 'Backend Development'),
    (8, 'Photography Composition Techniques', 'Techniques for creating compelling photographs.', null, 'Photography'),
    (9, 'Video Editing Tips', 'Tips for beginners to improve their video editing skills.', null, 'Video Editing'),
    (10, 'Copywriting Essentials', 'Essential tips for effective copywriting in marketing.', null, 'Copywriting'),
    (11, 'Mastering Full-Stack Development', 'Steps to master full-stack development.', null, 'Full-Stack Development'),
    (12, 'Project Management Best Practices', 'Best practices for effective project management.', null, 'Project Management'),
    (13, 'Data Analysis Techniques', 'Techniques for deriving insights from data.', null, 'Data Analysis'),
    (14, 'Scalable Web Application Architecture', 'Principles for building scalable web architectures.', null, 'Web Development'),
    (15, 'Travel Writing Tips', 'Tips for aspiring travel writers to share their experiences.', null, 'Writing'),
    (16, 'Web Developer Needed', 'Looking for a web developer for e-commerce site revamp.', null, 'Web Development'),
    (17, 'Graphic Designer Needed', 'In need of a graphic designer for brand visual identity.', null, 'Graphic Design'),
    (18, 'Developer Needed for Mobile App', 'Seeking a developer for innovative mobile app idea.', null, 'Mobile App Development'),
    (19, 'Website Redesign for Non-Profit', 'Redesigning website for better engagement with donors.', null, 'Web Development'),
    (20, 'Improving User Experience', 'Seeking UX/UI expertise for e-commerce store.', null, 'UI/UX Design');

insert into messages (
    sender_id, reciever_id, message_content, attachements
) values
    (16, 1, 'Hi, I saw your profile and I''m interested in your web development services. Can we discuss further details?', null),
    (1, 16, 'Sure, I''d be happy to discuss your project. Could you provide more information about your requirements?', null),
    (17, 2, 'Hey, I love your graphic design portfolio. I have a branding project that I think you''d be perfect for. Are you available for freelance work?', null),
    (2, 17, 'Thank you! I''m currently available for freelance projects. Let''s discuss your branding project in more detail.', null),
    (18, 4, 'Hi, I have an idea for a mobile app and I''m looking for a developer to bring it to life. Are you interested in collaborating?', null),
    (4, 18, 'Absolutely! I''m always excited about innovative app ideas. Let''s chat about your project goals and requirements.', null),
    (19, 3, 'We''re a non-profit organization in need of a website redesign. Your portfolio looks impressive. Would you be interested in working with us?', null),
    (3, 19, 'Thank you for reaching out! I''m passionate about working with non-profits. Let''s discuss how I can help with your website redesign.', null),
    (20, 6, 'Hi there, I''m interested in improving the user experience on my e-commerce store. Can you help?', null),
    (6, 20, 'Of course! Improving user experience is my specialty. Let''s schedule a call to discuss your goals and objectives.', null),
    (21, 8, 'Your photography skills are impressive! I''m in need of a photographer for an upcoming project. Are you available for freelance work?', null),
    (8, 21, 'Thank you! I''m available and excited to hear more about your project. Could you provide more details?', null),
    (22, 10, 'Hey, I have a copywriting project that I think you''d be perfect for. Are you available for freelance work?', null),
    (10, 22, 'Absolutely! I''m always looking for exciting copywriting projects. Let''s discuss the details of your project.', null),
    (23, 12, 'I''m impressed by your project management skills. We''re in need of a project manager for an upcoming initiative. Would you be interested in collaborating?', null),
    (12, 23, 'Thank you for considering me! I''m definitely interested. Let''s schedule a meeting to discuss the project further.', null),
    (24, 14, 'Your web development expertise is exactly what we need for our upcoming project. Are you available for freelance work?', null),
    (14, 24, 'I''m glad you think so! I''m available and eager to hear more about your project. Let''s connect and discuss further.', null);

insert into notifications (
    user_notified, content
) values
    (1, 'You have a new inquiry about your web development services.'),
    (2, 'A potential client is interested in your graphic design services.'),
    (3, 'A non-profit organization is considering you for their website redesign project.'),
    (4, 'A client has an innovative app idea and is seeking your expertise in mobile app development.'),
    (5, 'Your digital marketing skills have caught the attention of a potential client.'),
    (6, 'A client is interested in improving the user experience on their e-commerce store and wants to discuss further.'),
    (7, 'You have a new message from a potential client regarding API development.'),
    (8, 'A client is impressed by your photography portfolio and is considering you for a project.'),
    (9, 'A client has a video editing project and is interested in your services.'),
    (10, 'Your copywriting skills have attracted a potential client.'),
    (11, 'A client is interested in your full-stack development expertise for their project.'),
    (12, 'Your project management skills have caught the attention of a potential client.'),
    (13, 'A client is considering you for a data analysis project.'),
    (14, 'Your web development expertise is in demand for an upcoming project.'),
    (15, 'A client is interested in your travel writing services and wants to discuss further.'),
    (16, 'A web developer has responded to your inquiry about website development.'),
    (17, 'A graphic designer is available for your branding project.'),
    (18, 'A mobile app developer is interested in collaborating on your app idea.'),
    (19, 'A web designer is interested in working with your non-profit organization for website redesign.'),
    (20, 'A UX/UI expert is available to improve the user experience on your e-commerce store.'),
    (21, 'A back-end developer has responded to your inquiry about API development.'),
    (22, 'A photographer is interested in your project and wants to discuss further.'),
    (23, 'A video editor is available for your video editing project.'),
    (24, 'A copywriter is interested in working on your project.'),
    (25, 'A full-stack developer has responded to your inquiry about project development.'),
    (26, 'A project manager is interested in collaborating on your upcoming initiative.'),
    (27, 'A data analyst is available for your data analysis project.'),
    (28, 'A web developer is interested in working on your project.'),
    (29, 'A travel writer is available to discuss your project and provide writing services.');

insert into contracts (title, subject, terms, buyer_id, freelancer_id, cost, company_fee, start_date, end_date)
values
('Social Media Marketing Campaign', 'Managing social media accounts and creating content.', 'Freelancer will provide weekly updates and engage with followers.', 16, 1, 500, 0.20, '2024-06-15', '2024-07-15'),
('Website Development Project', 'Building a responsive website with e-commerce functionality.', 'Freelancer will deliver a fully functional site within 4 weeks.', 17, 2, 1500, 0.15, '2024-06-20', '2024-07-20'),
('Content Writing Services', 'Providing SEO-optimized blog posts.', 'Freelancer will deliver 4 articles per month.', 18, 3, 300, 0.25, '2024-06-10', '2024-12-10'),
('Graphic Design Project', 'Designing marketing materials for print and digital use.', 'Freelancer will provide up to 3 revisions per design.', 19, 4, 800, 0.18, '2024-06-25', '2024-07-25'),
('Video Editing Services', 'Editing promotional videos for social media.', 'Freelancer will deliver edited videos within 3 days of receiving raw footage.', 20, 5, 200, 0.20, '2024-06-18', '2024-07-18'),
('Virtual Assistant Services', 'Providing administrative support.', 'Freelancer will work 20 hours per week.', 21, 6, 15, 0.10, '2024-06-14', '2024-12-14'),
('SEO Optimization Project', 'Improving website ranking on search engines.', 'Freelancer will provide monthly progress reports.', 22, 7, 1000, 0.15, '2024-07-01', '2024-12-01'),
('Translation Services', 'Translating documents from English to Spanish.', 'Freelancer will translate up to 1000 words per day.', 23, 8, 0.10, 0.12, '2024-06-12', '2024-07-12'),
('Mobile App Development Project', 'Developing a cross-platform mobile application.', 'Freelancer will provide bi-weekly progress updates.', 24, 9, 3000, 0.20, '2024-06-30', '2024-09-30'),
('Copywriting Services', 'Crafting compelling advertising copy.', 'Freelancer will deliver within 48 hours of receiving the brief.', 25, 10, 50, 0.25, '2024-06-16', '2024-07-16'),
('Data Entry Project', 'Entering data into a spreadsheet.', 'Freelancer will complete 500 entries per week.', 26, 11, 0.05, 0.15, '2024-06-21', '2024-07-21'),
('Illustration Services', 'Creating custom illustrations for a children''s book.', 'Freelancer will provide sketches for approval before finalizing.', 27, 12, 100, 0.20, '2024-06-23', '2024-07-23'),
('Voiceover Services', 'Recording voiceovers for promotional videos.', 'Freelancer will provide up to 2 revisions per recording.', 28, 13, 50, 0.18, '2024-06-26', '2024-07-26'),
('Transcription Services', 'Transcribing audio files into text.', 'Freelancer will transcribe 1 hour of audio per day.', 29, 14, 20, 0.15, '2024-06-28', '2024-07-28');

INSERT INTO projects (seller_id, buyer_id, title, media_content, category, start_date, end_date) VALUES
(1, 1, 'Website Design', 'Mockups, HTML, CSS, JavaScript files', 'Web Development', '2024-01-01', '2024-01-15'),
(2, 2, 'Logo Creation', 'AI, PSD files', 'Graphic Design', '2024-01-05', '2024-01-10'),
(3, 3, 'Mobile App Development', 'Source code, APK file', 'App Development', '2024-01-10', '2024-02-01'),
(4, 4, 'SEO Optimization', 'SEO report, Keywords analysis', 'Digital Marketing', '2024-01-12', '2024-01-25'),
(5, 5, 'Content Writing', 'Articles, Blog posts', 'Writing', '2024-01-15', '2024-01-20'),
(6, 1, 'Social Media Management', 'Content calendar, Posts', 'Social Media', '2024-01-20', '2024-02-10'),
(7, 2, 'Video Editing', 'Edited video files, Project files', 'Video Production', '2024-01-25', '2024-02-05'),
(8, 3, 'Data Analysis', 'Reports, Data visualizations', 'Data Science', '2024-02-01', '2024-02-15'),
(9, 4, 'Translation Services', 'Translated documents', 'Translation', '2024-02-05', '2024-02-10'),
(10, 5, 'UI/UX Design', 'Design mockups, Prototypes', 'Design', '2024-02-10', '2024-02-25'),
(11, 1, 'Voice Over', 'Voice recordings, Edited audio files', 'Voice Over', '2024-02-15', '2024-02-20'),
(12, 2, 'Email Marketing', 'Email templates, Campaign reports', 'Marketing', '2024-02-20', '2024-03-01'),
(13, 3, 'E-commerce Development', 'Website files, User manuals', 'Web Development', '2024-02-25', '2024-03-10'),
(14, 4, '3D Modeling', '3D models, Rendered images', '3D Design', '2024-03-01', '2024-03-15'),
(15, 5, 'Photography', 'Edited photos, RAW files', 'Photography', '2024-03-05', '2024-03-10'),
(6, 1, 'Podcast Editing', 'Edited audio files, Show notes', 'Audio Production', '2024-03-10', '2024-03-20'),
(7, 2, 'Copywriting', 'Sales copies, Advertisements', 'Writing', '2024-03-15', '2024-03-25'),
(8, 3, 'Game Development', 'Game files, Source code', 'Game Development', '2024-03-20', '2024-04-10'),
(9, 4, 'Virtual Assistance', 'Reports, Task lists', 'Admin Support', '2024-03-25', '2024-04-01'),
(2, 5, 'Bookkeeping', 'Financial reports, Ledger entries', 'Finance', '2024-04-01', '2024-04-15');

insert into categories (category_name) values
('Web Development'),
('Graphic Design'),
('App Development'),
('Digital Marketing'),
('Writing'),
('Social Media'),
('Video Production'),
('Data Science'),
('Translation'),
('Voice Over');


insert into reviews (content, rating, reviewed_by, project_reviewed, review_date) values
('Excellent work! Delivered on time and beyond expectations.', 5.0, 1, 1, '2024-01-16'),
('Good job, but there were some delays in communication.', 4.0, 3, 2, '2024-01-11'),
('Fantastic app development. Very satisfied with the results.', 5.0, 5, 3, '2024-02-02'),
('Average service. The project was completed but not as expected.', 3.0, 7, 4, '2024-01-26'),
('Great content writing. Will hire again.', 4.0, 9, 5, '2024-01-21'),
('Very professional and efficient in managing social media.', 5.0, 2, 6, '2024-02-11'),
('Good video editing skills. Minor revisions needed.', 4.0, 4, 7, '2024-02-06'),
('Outstanding data analysis. Highly recommended.', 5.0, 6, 8, '2024-02-16'),
('Good translation services, but could improve on delivery time.', 4.0, 8, 9, '2024-02-11'),
('Excellent design work. Very creative and prompt.', 5.0, 10, 10, '2024-02-26'),
('Great voice-over work. Exactly what we needed.', 5.0, 12, 11, '2024-02-21'),
('Effective email marketing campaign, but slightly expensive.', 4.0, 14, 12, '2024-03-02'),
('Amazing e-commerce website development. Very user-friendly.', 5.0, 16, 13, '2024-03-11'),
('Excellent 3D modeling skills. Very impressed.', 5.0, 18, 14, '2024-03-16'),
('Photography was good, but delivery was late.', 3.0, 20, 15, '2024-03-11');

insert into comments (
    commenter, commented_post, content, comment_date
) values (
    1, 1, 'good post!', '2024-01-1'
);

insert into comments (
    commenter, commented_post, content, comment_date
) values
    (1, 1, 'Great insights on web development!', '2024-01-01'),
    (22, 1, 'This is really helpful for my project.', '2024-01-02'),
    (2, 2, 'Excellent design tips, thank you!', '2024-01-03'),
    (23, 2, 'I learned a lot from this post.', '2024-01-04'),
    (3, 3, 'Fantastic app development advice!', '2024-01-05'),
    (24, 3, 'This will help me with my app.', '2024-01-06'),
    (4, 4, 'Wonderful ideas for non-profits.', '2024-01-07'),
    (25, 4, 'Thank you for sharing these tips.', '2024-01-08'),
    (5, 5, 'Great user experience insights!', '2024-01-09'),
    (26, 5, 'I will implement these ideas.', '2024-01-10'),
    (6, 6, 'Very informative on API development.', '2024-01-11'),
    (27, 6, 'I found this extremely useful.', '2024-01-12'),
    (7, 7, 'Amazing photography advice!', '2024-01-13'),
    (28, 7, 'This is very inspiring.', '2024-01-14'),
    (8, 8, 'Helpful video editing tips.', '2024-01-15'),
    (29, 8, 'I will use these techniques.', '2024-01-16'),
    (9, 9, 'Great copywriting strategies!', '2024-01-17'),
    (30, 9, 'This is just what I needed.', '2024-01-18'),
    (10, 10, 'Excellent full-stack development ideas.', '2024-01-19'),
    (31, 10, 'I learned a lot from this post.', '2024-01-20');

insert into likes (
    liked_by, post_liked, like_date
) values
    (1, 1, '2024-01-01'),
    (2, 2, '2024-01-02'),
    (3, 3, '2024-01-03'),
    (4, 4, '2024-01-04'),
    (5, 5, '2024-01-05'),
    (6, 6, '2024-01-06'),
    (7, 7, '2024-01-07'),
    (8, 8, '2024-01-08'),
    (9, 9, '2024-01-09'),
    (10, 10, '2024-01-10'),
    (11, 11, '2024-01-11'),
    (12, 12, '2024-01-12'),
    (13, 13, '2024-01-13'),
    (14, 14, '2024-01-14'),
    (15, 15, '2024-01-15'),
    (16, 16, '2024-01-16'),
    (17, 17, '2024-01-17'),
    (18, 18, '2024-01-18'),
    (19, 19, '2024-01-19'),
    (20, 20, '2024-01-20'),
    (21, 1, '2024-01-21'),
    (22, 2, '2024-01-22'),
    (23, 3, '2024-01-23'),
    (24, 4, '2024-01-24'),
    (25, 5, '2024-01-25'),
    (26, 6, '2024-01-26'),
    (27, 7, '2024-01-27'),
    (28, 8, '2024-01-28'),
    (29, 9, '2024-01-29'),
    (30, 10, '2024-01-30'),
    (31, 11, '2024-01-31'),
    (32, 12, '2024-02-01'),
    (33, 13, '2024-02-02'),
    (34, 14, '2024-02-03'),
    (35, 15, '2024-02-04'),
    (36, 16, '2024-02-05'),
    (37, 17, '2024-02-06'),
    (38, 18, '2024-02-07'),
    (39, 19, '2024-02-08'),
    (40, 20, '2024-02-09'),
    (41, 1, '2024-02-10'),
    (42, 2, '2024-02-11'),
    (43, 3, '2024-02-12'),
    (44, 4, '2024-02-13'),
    (45, 5, '2024-02-14'),
    (46, 6, '2024-02-15'),
    (47, 7, '2024-02-16'),
    (1, 8, '2024-02-17'),
    (2, 9, '2024-02-18'),
    (3, 10, '2024-02-19'),
    (4, 11, '2024-02-20');

insert into payments (
    buyer_id, seller_id, amount, company_fee, payment_date
) values
    (1, 1, 500.00, 50.00, '2024-01-01'),
    (2, 2, 700.00, 70.00, '2024-01-02'),
    (3, 3, 600.00, 60.00, '2024-01-03'),
    (4, 4, 800.00, 80.00, '2024-01-04'),
    (5, 5, 900.00, 90.00, '2024-01-05'),
    (6, 6, 1000.00, 100.00, '2024-01-06'),
    (7, 7, 1200.00, 120.00, '2024-01-07'),
    (8, 8, 1100.00, 110.00, '2024-01-08'),
    (9, 9, 1300.00, 130.00, '2024-01-09'),
    (10, 10, 1500.00, 150.00, '2024-01-10'),
    (11, 1, 1400.00, 140.00, '2024-01-11'),
    (12, 2, 1600.00, 160.00, '2024-01-12'),
    (13, 3, 1800.00, 180.00, '2024-01-13'),
    (14, 4, 1700.00, 170.00, '2024-01-14'),
    (15, 5, 1900.00, 190.00, '2024-01-15'),
    (1, 6, 2000.00, 200.00, '2024-01-16'),
    (2, 7, 2100.00, 210.00, '2024-01-17'),
    (3, 8, 2200.00, 220.00, '2024-01-18'),
    (4, 9, 2300.00, 230.00, '2024-01-19'),
    (5, 10, 2400.00, 240.00, '2024-01-20'),
    (6, 1, 2500.00, 250.00, '2024-01-21'),
    (7, 2, 2600.00, 260.00, '2024-01-22'),
    (8, 3, 2700.00, 270.00, '2024-01-23'),
    (9, 4, 2800.00, 280.00, '2024-01-24'),
    (10, 5, 2900.00, 290.00, '2024-01-25'),
    (11, 6, 3000.00, 300.00, '2024-01-26'),
    (12, 7, 3100.00, 310.00, '2024-01-27'),
    (13, 8, 3200.00, 320.00, '2024-01-28'),
    (14, 9, 3300.00, 330.00, '2024-01-29'),
    (15, 10, 3400.00, 340.00, '2024-01-30');

insert into admin (first_name, last_name, username, email, password)
values
    ('Admin1', 'Lastname', 'admin1', 'admin1@example.com', 'adminpassword1'),
    ('Admin2', 'Lastname', 'admin2', 'admin2@example.com', 'adminpassword2'),
    ('Admin3', 'Lastname', 'admin3', 'admin3@example.com', 'adminpassword3'),
    ('Admin4', 'Lastname', 'admin4', 'admin4@example.com', 'adminpassword4'),
    ('Admin5', 'Lastname', 'admin5', 'admin5@example.com', 'adminpassword5');

insert into management (first_name, last_name, username, email, password)
values
    ('Manager1', 'Lastname', 'manager1', 'manager1@example.com', 'managerpassword1'),
    ('Manager2', 'Lastname', 'manager2', 'manager2@example.com', 'managerpassword2'),
    ('Manager3', 'Lastname', 'manager3', 'manager3@example.com', 'managerpassword3'),
    ('Manager4', 'Lastname', 'manager4', 'manager4@example.com', 'managerpassword4'),
    ('Manager5', 'Lastname', 'manager5', 'manager5@example.com', 'managerpassword5'),
    ('Manager6', 'Lastname', 'manager6', 'manager6@example.com', 'managerpassword6'),
    ('Manager7', 'Lastname', 'manager7', 'manager7@example.com', 'managerpassword7'),
    ('Manager8', 'Lastname', 'manager8', 'manager8@example.com', 'managerpassword8'),
    ('Manager9', 'Lastname', 'manager9', 'manager9@example.com', 'managerpassword9'),
    ('Manager10', 'Lastname', 'manager10', 'manager10@example.com', 'managerpassword10'),
    ('Manager11', 'Lastname', 'manager11', 'manager11@example.com', 'managerpassword11'),
    ('Manager12', 'Lastname', 'manager12', 'manager12@example.com', 'managerpassword12'),
    ('Manager13', 'Lastname', 'manager13', 'manager13@example.com', 'managerpassword13'),
    ('Manager14', 'Lastname', 'manager14', 'manager14@example.com', 'managerpassword14'),
    ('Manager15', 'Lastname', 'manager15', 'manager15@example.com', 'managerpassword15'),
    ('Manager16', 'Lastname', 'manager16', 'manager16@example.com', 'managerpassword16'),
    ('Manager17', 'Lastname', 'manager17', 'manager17@example.com', 'managerpassword17'),
    ('Manager18', 'Lastname', 'manager18', 'manager18@example.com', 'managerpassword18'),
    ('Manager19', 'Lastname', 'manager19', 'manager19@example.com', 'managerpassword19'),
    ('Manager20', 'Lastname', 'manager20', 'manager20@example.com', 'managerpassword20');
    
show tables;

select * from admin;
select * from buyer;
select * from categories;
select * from comments;
select * from contracts;
select * from freelancer;
select * from likes;
select * from management;
select * from messages;
select * from notifications;
select * from payments;
select * from posts;
select * from projects;
select * from reviews;
select * from users;