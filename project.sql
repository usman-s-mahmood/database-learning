create database sql_project;
use sql_project;

create table singer (
    id int primary key auto_increment,
    name varchar(250) not null,
    region varchar(250) default null
);


create table songs (
    song_id int primary key AUTO_INCREMENT,
    song_name text unique not null ,
    singer_id int,
    resource_url text unique not null,
    constraint sng_id FOREIGN key (singer_id) REFERENCES singer(id)
);

create table playlists (
    ply_id int primary key auto_increment,
    ply_name text not null unique,
    created_on date default CURRENT_TIMESTAMP
);

create table playlist_detail (
    ply_dt_id int primary key AUTO_INCREMENT,
    ply_id int,
    song_id int,
    singer_id int,
    constraint song_id_fk foreign key (song_id) references songs(song_id),
    constraint singer_id_fk foreign key (singer_id) references singers(id),
    constraint ply_dt_fk foreign key (ply_id) references playlists(ply_id)
);

