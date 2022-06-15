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




