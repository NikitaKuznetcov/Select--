import sqlalchemy
from pprint import pprint
engine = sqlalchemy.create_engine('postgres://postgresql:postgre@localhost:5432/artist')
connection = engine.connect()



# 1 название и год выхода альбомов, вышедших в 2018 году;
sel_1 = connection.execute ("""
    SELECT name_album, year_album FROM album
    WHERE year_album = 2018;
    """).fetchall() 
pprint(sel_1)

# 2 название и продолжительность самого длительного трека;
sel_2 = connection.execute("""SELECT name_song, time_song 
    FROM song WHERE time_song = (select max(time) from Треки);
    """).fetchall()
pprint(sel_2)

# 3 название и продолжительность самого длительного трека
sel_3 = connection.execute("""SELECT name_track, time FROM track
    WHERE time < '90';
    """).fetchall()
pprint(sel_3)

# 4 названия сборников, вышедших в период с 2018 по 2020 год включительно
sel_4 = connection.execute(""" SELECT name, year FROM collection
    WHERE year >= 2018 AND  year <= 2020;
    """).fetchall()
pprint(sel_4)

#5 исполнители, чье имя состоит из 1 слова;
sel_5 = connection.execute(""" SELECT name FROM artist
    WHERE name NOT LIKE '%% %%'
    """).fetchall()
pprint(sel_5)

# 6 название треков, которые содержат слово "мой"/"my".
sel_6 = connection.execute(""" SELECT name FROM song
    WHERE name LIKE '%%My%%'
    """).fetchall()
pprint(sel_6)