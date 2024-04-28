create database blog_db;

create table users(
  id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(50) not null
);

	insert into users values
		(default, 'Karla','Murillo','kar_murillo@dominio.com'),
		(default, 'Luis','Arauz','ar_uz@gmail.com'),
		(default, 'Marcos','Polo','maco_polo@dominio.com');
	
	select * from user;
	

create table posts (
  id serial primary key,
  title varchar(50) not null,
  text text not null,
  creador_id int references users(id)
);

	insert into posts values
		(default, 'post title1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1),
		(default, 'post title2', 'Mauris quam orci, eleifend sit amet nisl ac', 1),
		(default, 'post title3', 'Maecenas hendrerit euismod magna, in porta dolor tristique id', 2),
		(default, 'post title4', 'Mauris augue metus, scelerisque et neque quis, viverra efficitur turpis', 3),
		(default, 'post title5', 'venenatis vel dapibus quis, porttitor ut ante.', 2);
		
	select * from posts;


create table likes(
  id serial primary key,
  user_id int references users(id),
  post_id int references posts(id)
);

	insert into likes values
		(default, 1,6),
		(default, 2,8),
		(default, 3,10),
		(default, 2,7),
		(default, 1,9);

select * from likes;


--Querys
--Trae todos los posts y la información del usuario del campo creator_id
select first_name || ' ' || last_name as full_name, email, title as post_tile, text
from users u
inner join posts p on u.id=p.creador_id

--Trae todos los posts, con la información de los usuarios que les dieron like.
select first_name || ' ' || last_name as full_name, email, title as post_tile, text
from users u
inner join likes l on u.id=l.user_id
inner join posts p on p.id=l.post_id
