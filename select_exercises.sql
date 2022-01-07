# Basic_statement_questions

USE albums_db;
SELECT * FROM albums;
# 3a. There are 31 Rows
SELECT COUNT(DISTINCT artist) FROM albums;
# 3b. There are 23 unique artists
DESCRIBE albums;
# 3c. id is the primary key
SELECT * FROM albums;
# 3d. 1967 is the oldest release date

SELECT * FROM albums;


SELECT name, artist FROM albums WHERE artist = 'Pink FLoyd';

SELECT * FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre FROM albums WHERE name = 'Nevermind';

SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT name FROM albums WHERE sales < 20;

SELECT * FROM albums WHERE genre = "Rock";
# Rock is too specific