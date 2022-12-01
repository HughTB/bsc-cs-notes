SELECT * FROM CATEGORY;
select * from category;
select * from 'Category';
select * from "Category";
select * from 'category';
select * from "category";

-- Database creation task

CREATE DATABASE games;
\c games

CREATE TABLE GAME (
    GAME_ID SERIAL PRIMARY KEY,
    GAME_TITLE VARCHAR(20)
);

CREATE TABLE PLAYER (
    PLAYER_ID SERIAL PRIMARY KEY,
    PLAYER_FNAME VARCHAR(25),
    PLAYER_LNAME VARCHAR(25)
);

CREATE TABLE COMPLETION (
    COMPLETION_ID SERIAL PRIMARY KEY,
    PLAYER_ID INT REFERENCES PLAYER(PLAYER_ID),
    GAME_ID INT REFERENCES GAME(GAME_ID),
    COMPLETE_PERCENT INT
);

-- Data values to insert
INSERT INTO game VALUES (1, 'Minecraft');
INSERT INTO game VALUES (2, 'Counter-Strike');
INSERT INTO game VALUES (3, 'Mario Odyessy');
INSERT INTO game VALUES (4, 'Pokemon');
INSERT INTO game VALUES (5, 'The Legend of Zelda');
INSERT INTO game VALUES (6, 'Battlefield 4');
INSERT INTO game VALUES (7, 'Half-Life');
INSERT INTO game VALUES (8, 'Half-Life 2');
INSERT INTO game VALUES (9, 'Portal');
INSERT INTO game VALUES (10, 'Portal 2');

INSERT INTO player (player_fname, player_lname) VALUES ('Hugh', 'Baldwin');
INSERT INTO player (player_fname, player_lname) VALUES ('Ollie', 'Gale');
INSERT INTO player (player_fname, player_lname) VALUES ('Ben', 'Farmer');

INSERT INTO completion (player_id, game_id, complete_percent) VALUES (1, 5, 50);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (1, 6, 100);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (1, 9, 90);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (2, 3, 75);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (2, 2, 98);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (2, 7, 80);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (3, 2, 90);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (3, 9, 100);
INSERT INTO completion (player_id, game_id, complete_percent) VALUES (3, 10, 100);

-- Queries

-- Show the player's first name, game title and completion percentage for every game they have played
SELECT player.player_fname, game.game_title, completion.complete_percent FROM player LEFT JOIN completion ON player.player_id=completion.player_id LEFT JOIN game ON completion.game_id=game.game_id;
-- Show the player's first and last name, completion percentage and the title of the game for any game with "Portal" in the title
SELECT player.player_fname, player.player_lname, completion.complete_percent, game.game_title FROM player LEFT JOIN completion ON player.player_id=completion.player_id LEFT JOIN game ON completion.game_id=game.game_id WHERE game.game_title LIKE '%Portal%';