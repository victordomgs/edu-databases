/*******************************************************************************
   Chinook Database - Version 1.0.0
   Script: valorantStats_MySql.sql
   Description: Creates and populates the valorantStats database.
   DB Server: MySql
   Author: Víctor García Saiz
   License: https://github.com/victordomgs/edu-databases/blob/main/LICENSE
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `valorantStats`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `valorantStats`;


USE `valorantStats`;

/*******************************************************************************
   Create Tables
********************************************************************************/

CREATE TABLE `Players` (
    `player_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `level` INT NOT NULL,
    `region` VARCHAR(20) NOT NULL,
    `join_date` DATE NOT NULL,
    CONSTRAINT `PK_Players` PRIMARY KEY (`player_id`)
);

CREATE TABLE `Matches` (
    `match_id` INT NOT NULL,
    `date` DATE NOT NULL,
    `duration` TIME NOT NULL,
    `map_id` INT NOT NULL,
    CONSTRAINT `PK_Matches` PRIMARY KEY (`match_id`)
);

CREATE TABLE `Maps` (
    `map_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `type` VARCHAR(30) NOT NULL,
    CONSTRAINT `PK_Maps` PRIMARY KEY (`map_id`)
);

CREATE TABLE `Agents` (
    `agent_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `role` VARCHAR(20) NOT NULL,
    `abilities` TEXT NOT NULL,
    CONSTRAINT `PK_Agents` PRIMARY KEY (`agent_id`)
);

CREATE TABLE `Teams` (
    `team_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `region` VARCHAR(20) NOT NULL,
    CONSTRAINT `PK_Teams` PRIMARY KEY (`team_id`)
);

CREATE TABLE `Player_Stats` (
    `player_id` INT NOT NULL,
    `match_id` INT NOT NULL,
    `kills` INT NOT NULL,
    `deaths` INT NOT NULL,
    `assists` INT NOT NULL,
    `damage_dealt` INT NOT NULL,
    CONSTRAINT `PK_Player_Stats` PRIMARY KEY (`player_id`, `match_id`)
);

CREATE TABLE `Team_Stats` (
    `team_id` INT NOT NULL,
    `match_id` INT NOT NULL,
    `rounds_won` INT NOT NULL,
    `rounds_lost` INT NOT NULL,
    CONSTRAINT `PK_Team_Stats` PRIMARY KEY (`team_id`, `match_id`)
);

CREATE TABLE `Player_Agents` (
    `player_id` INT NOT NULL,
    `agent_id` INT NOT NULL,
    `match_id` INT NOT NULL,
    CONSTRAINT `PK_Player_Agents` PRIMARY KEY (`player_id`, `agent_id`, `match_id`)
);

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/

ALTER TABLE `Matches` ADD CONSTRAINT `FK_Matches_Maps`
    FOREIGN KEY (`map_id`) REFERENCES `Maps` (`map_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Player_Stats` ADD CONSTRAINT `FK_Player_Stats_Players`
    FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Player_Stats` ADD CONSTRAINT `FK_Player_Stats_Matches`
    FOREIGN KEY (`match_id`) REFERENCES `Matches` (`match_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Team_Stats` ADD CONSTRAINT `FK_Team_Stats_Teams`
    FOREIGN KEY (`team_id`) REFERENCES `Teams` (`team_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Team_Stats` ADD CONSTRAINT `FK_Team_Stats_Matches`
    FOREIGN KEY (`match_id`) REFERENCES `Matches` (`match_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Player_Agents` ADD CONSTRAINT `FK_Player_Agents_Players`
    FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Player_Agents` ADD CONSTRAINT `FK_Player_Agents_Agents`
    FOREIGN KEY (`agent_id`) REFERENCES `Agents` (`agent_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `Player_Agents` ADD CONSTRAINT `FK_Player_Agents_Matches`
    FOREIGN KEY (`match_id`) REFERENCES `Matches` (`match_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


