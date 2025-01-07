/*******************************************************************************
   SteamDB Database - Version 1.0.0
   Script: SteamDB_MySql.sql
   Description: Creates and populates the SteamDB database.
   Dataset base: https://steamdb.info/
   DB Server: MySql
   Author: Víctor García Saiz
   License: https://github.com/victordomgs/edu-databases/blob/main/LICENSE
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `SteamDB`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `SteamDB`;


USE `SteamDB`;

/*******************************************************************************
   Create Tables
********************************************************************************/

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    join_date DATE NOT NULL
);

CREATE TABLE Developers (
    developer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50)
);

CREATE TABLE Games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    developer_id INT,
    price DECIMAL(10, 2) NOT NULL,
    genre VARCHAR(50)
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    game_id INT,
    rating TINYINT CHECK (rating BETWEEN 1 AND 10),
    review_text TEXT,
    review_date DATE NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    game_id INT,
    transaction_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);
/*******************************************************************************
   Create Foreign Keys
********************************************************************************/

ALTER TABLE Games 
ADD CONSTRAINT FK_Games_Developers 
FOREIGN KEY (developer_id) REFERENCES Developers(developer_id) 
ON DELETE SET NULL ON UPDATE NO ACTION;

ALTER TABLE Reviews 
ADD CONSTRAINT FK_Reviews_Users 
FOREIGN KEY (user_id) REFERENCES Users(user_id) 
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE Reviews 
ADD CONSTRAINT FK_Reviews_Games 
FOREIGN KEY (game_id) REFERENCES Games(game_id) 
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE Transactions 
ADD CONSTRAINT FK_Transactions_Users 
FOREIGN KEY (user_id) REFERENCES Users(user_id) 
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE Transactions 
ADD CONSTRAINT FK_Transactions_Games 
FOREIGN KEY (game_id) REFERENCES Games(game_id) 
ON DELETE CASCADE ON UPDATE NO ACTION;

/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO Users (username, email, password_hash, join_date) VALUES
('player1', 'player1@example.com', 'hash1', '2023-01-15'),
('player2', 'player2@example.com', 'hash2', '2023-02-20'),
('player3', 'player3@example.com', 'hash3', '2023-03-10');

INSERT INTO Developers (name, country) VALUES
('Valve', 'USA'),
('CD Projekt Red', 'Poland'),
('FromSoftware', 'Japan');

INSERT INTO Games (name, release_date, developer_id, price, genre) VALUES
('Half-Life 2', '2004-11-16', 1, 9.99, 'FPS'),
('Cyberpunk 2077', '2020-12-10', 2, 59.99, 'RPG'),
('Elden Ring', '2022-02-25', 3, 59.99, 'Action RPG');

INSERT INTO Reviews (user_id, game_id, rating, review_text, review_date) VALUES
(1, 1, 10, 'A masterpiece of game design!', '2023-01-20'),
(2, 2, 8, 'Great visuals, but buggy.', '2023-02-25'),
(3, 3, 9, 'Challenging and rewarding.', '2023-03-15');

INSERT INTO Transactions (user_id, game_id, transaction_date, amount) VALUES
(1, 1, '2023-01-16', 9.99),
(2, 2, '2023-02-21', 59.99),
(3, 3, '2023-03-11', 59.99);

