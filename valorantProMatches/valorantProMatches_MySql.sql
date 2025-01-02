/*******************************************************************************
   Chinook Database - Version 1.0.0
   Script: valorantProMatches_MySql.sql
   Description: Creates and populates the valorantProMatches database.
   Dataset base: https://www.kaggle.com/datasets/visualize25/valorant-pro-matches-full-data
   DB Server: MySql
   Author: Víctor García Saiz
   License: https://github.com/victordomgs/edu-databases/blob/main/LICENSE
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `valorantProMatches`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `valorantProMatches`;


USE `valorantProMatches`;

/*******************************************************************************
   Create Tables
********************************************************************************/

CREATE TABLE `Events` (
    `event_id` INT NOT NULL,
    `eventName` VARCHAR(500)
    CONSTRAINT `PK_Events` PRIMARY KEY (`event_id`)
);

CREATE TABLE `Games` (
    `game_id` INT NOT NULL,
    `match_id` INT NOT NULL,  
    `map_id` INT NOT NULL,
    `team1_id` INT NOT NULL,
    `team2_id` INT NOT NULL,
    `winner` INT,
    `team1_TotalRounds` INT,
    `team2_TotalRounds` INT,
    `Team1_SideFirstHalf` VARCHAR(10),
    `Team2_SideFirstHalf` VARCHAR(10),
    `Team1_RoundsFirstHalf` INT,
    `Team1_RoundsSecondtHalf` INT,
    `Team1_RoundsOT` INT,
    `Team2_RoundsFirstHalf` INT,
    `Team2_RoundsSecondtHalf` INT,
    `Team2_RoundsOT` INT,
    `Team1_PistolWon` INT,
    `Team1_Eco` INT,
    `Team1_EcoWon` INT,
    `Team1_SemiEco` INT,
    `Team1_SemiEcoWon` INT,
    `Team1_SemiBuy` INT,
    `Team1_SemiBuyWon` INT,
    `Team1_FullBuy` INT,
    `Team1_FullBuyWon` INT,
    `Team2_PistolWon` INT,
    `Team2_Eco` INT,
    `Team2_EcoWon` INT,
    `Team2_SemiEco` INT,
    `Team2_SemiEcoWon` INT,
    `Team2_SemiBuy` INT,
    `Team2_SemiBuyWon` INT,
    `Team2_FullBuy` INT,
    `Team2_FullBuyWon` INT,
    CONSTRAINT `PK_Games` PRIMARY KEY (`game_id`)
);

CREATE TABLE `Maps` (
    `map_id` INT NOT NULL,
    `name` VARCHAR(50)
    CONSTRAINT `PK_Maps` PRIMARY KEY (`map_id`)
);

CREATE TABLE `Matches` (
    `match_id` INT NOT NULL,
    `event_id` INT NOT NULL,
    `matchDate` DATETIME NOT NULL,
    CONSTRAINT `PK_Matches` PRIMARY KEY (`match_id`)
);

CREATE TABLE `Agents` (
    `agent_id` INT NOT NULL,
    `name` VARCHAR(50),
    `role` VARCHAR(50),
    `abilities` TEXT
    CONSTRAINT `PK_Agents` PRIMARY KEY (`agent_id`)
);

CREATE TABLE `Players` (
    `player_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `teamAbbreviation` VARCHAR(50)
    CONSTRAINT `PK_Players` PRIMARY KEY (`player_id`)
);

CREATE TABLE Player_Stats (
    game_id INT NOT NULL,
    player_id INT NOT NULL,
    agent VARCHAR(50),
    agent_id INT NOT NULL,
    acs INT,
    kills INT,
    deaths INT,
    assists INT,
    plusMinus INT,
    KAST_percent FLOAT,
    ADR FLOAT,
    HS_percent FLOAT,
    firstKills INT,
    firstDeaths INT,
    FKFD_PlusMinus INT,
    Num_2Ks INT,
    Num_3Ks INT,
    Num_4Ks INT,
    Num_5Ks INT,
    OnevOne INT,
    OnevTwo INT,
    OnevThree INT,
    OnevFour INT,
    OnevFive INT,
    Econ INT,
    Plants INT,
    Defuse INT,
    CONSTRAINT PK_Game_Stats PRIMARY KEY (game_id, player_id, agent_id)
);
/*******************************************************************************
   Create Foreign Keys
********************************************************************************/

ALTER TABLE `Matches` 
ADD CONSTRAINT `FK_Matches_Events`
FOREIGN KEY (`event_id`) REFERENCES `Events` (`event_id`)
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `Games` 
ADD CONSTRAINT `FK_Games_Matches`
FOREIGN KEY (`match_id`) REFERENCES `Matches` (`match_id`)
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `Games` 
ADD CONSTRAINT `FK_Games_Maps`
FOREIGN KEY (`map_id`) REFERENCES `Maps` (`map_id`)
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `Player_Stats` 
ADD CONSTRAINT `FK_Player_Stats_Games`
FOREIGN KEY (`game_id`) REFERENCES `Games` (`game_id`)
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `Player_Stats` 
ADD CONSTRAINT `FK_Player_Stats_Players`
FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`)
ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `Player_Stats` 
ADD CONSTRAINT `FK_Player_Stats_Agents`
FOREIGN KEY (`agent_id`) REFERENCES `Agents` (`agent_id`)
ON DELETE CASCADE ON UPDATE NO ACTION;

/*******************************************************************************
   Populate Tables
********************************************************************************/
