create table if not exists artist ( -- �������� �������
	id serial primary key, -- primary key ��������� ���������� ����, ��������� ���� ���� �� ������ 
	name varchar(40) unique not null -- unique ��� �������� ���������, not null �������� �� ������ ���� ������
);

create table if not exists album (
	id serial primary key,
	name varchar(40) unique not null,
	year integer,
);
create table if not exists song (
	id serial primary key,
	name varchar(40) unique not null,
	time integer,
	album_id integer references album (id)
);

create table if not exists artist_album (
	id serial primary key,
	album_id integer not null references album (id),
	artist_id integer not null references artist (id)
);

create table if not exists genre_song (
	id serial primary key,
	name varchar (40) unique not null
);

create table if not exists artist_genre (
	id serial primary key,
	genre_song_id integer not null references genre_song (id),
	artist_id integer references artist (id)
);

create table if not exists collection (
	id serial primary key,
	name varchar(40) unique not null,
	time integer,
	year integer
);

create table if not exists collection_song (
	id serial primary key,
	collection_id integer not null references collection (id),
	song_id integer references song (id)
);

insert into artist (id, name) 
	values (1, 'The Pretty Reckless'), (2, 'Attila'), (3, 'Frank Sinatra'), (4, '����������'), (5, '������ � ���'), (6, 'Lil Peep'), 
	(7, 'Thr Prodigy'), (8, 'Bones');

insert into genre_song (id, name)
	values (1, 'Alternative rock'), (2, 'Deathcore'), (3, 'Jazz'), (4, 'Rap'), (5, 'Techno');

insert into artist_genre (id, artist_id, genre_song_id)
	values (1,1,1),
	(2,2,2),
	(3,3,3),
	(4,4,4),
	(5,5,1),
	(6,6,4),
	(7,7,5),
	(8,8,5);

insert into album (id, name, year)
	values (1, 'Going to hell', 2014), (2, 'Chaos', 2016), (3, 'Thats Life', 1966), (4, 'Golden Age', 2017), 
	(5, '����� � ������', 2000), (6, 'Come Over When Youre Sober, Pt. 2', 2018), (7, 'The day is my enemy', 2015), (8, 'BURDEN', 2021);	

insert into artist_album (id, album_id, artist_id)
	values (1,1,1),
	(2,2,2),
	(3,3,3),
	(4,4,4),
	(5,5,5),
	(6,6,6),
	(7,7,7),
	(8,8,8);

insert into song (id, name, time, album_id)
	values (1, 'Going to hell', 278, 1),(2, 'Heaven Knows', 224, 1), (3, 'Burn', 108, 1), (4, 'Absolution', 308, 1), (5, 'Moshpit', 210, 2),
	(6, 'Queen', 207, 2), (7, 'All Hail Rock and Roll', 185, 2), (8, 'Thats Life', 187, 3), (9, '��������', 125, 4),
	(10, '��� �����', 159, 5), (11,'Sex with my ex', 213, 6), (12, 'Broken Smile (My All)', 280, 6),
	(13, 'The day is my enemy', 173, 7), (14, 'Medicine', 236, 7), (15, 'Opal', 78, 8);

insert into collection (id, name,  time, year)
	values (1, 'Name1', 2725, 2014),
  (2, 'Name2', 2295, 2016),
  (3, 'Name3', 8269, 1966),
  (4, 'Name4', 1332, 2017),
  (5, 'Name5', 2729, 2000),
  (6, 'Name6', 2682, 2018),
  (7, 'Name7', 8668, 2015),
  (8, 'Name8', 1608, 2021);

insert into collection_song (id, collection_id,  song_id)
	values (1,1,1),
	(2,1,2),
	(3,1,3),
	(4,1,4),
	(5,2,5),
	(6,2,6),
	(7,2,7),
	(8,3,8),
	(9,4,9),
	(10,5,10),
	(11,6,11),
	(12,6,12),
	(13,7,13),
	(14,7,14),
	(15,8,15);


















