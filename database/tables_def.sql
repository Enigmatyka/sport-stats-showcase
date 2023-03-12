/*
CREATE IF NOT EXISTS TABLE Playoffs {
    
}
CREATE IF NOT EXISTS TABLE Finals {
    
}
*/

CREATE IF NOT EXISTS TABLE Teams {
    teamID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    teamCurrentName VARCHAR(30) NOT NULL,
    teamHistoricNames VARCHAR,
    teamLocation VARCHAR NOT NULL,
    teamArenaName VARCHAR NOT NULL,
    conference ENUM ('EAST', 'WEST') NOT NULL,
    division ENUM ('ATLANTIC', 'SOUTHEAST', 'CENTRAL', 'NORTHWEST', 'PACIFIC', 'SOUTHWEST') NOT NULL
}

CREATE IF NOT EXISTS TABLE Players {
    playerID MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    playerName VARCHAR NOT NULL,
    playerSurname VARCHAR NOT NULL,
    birthDate DATE NOT NULL,
    playerPosition ENUM ('PG', 'SG', 'SF', 'PF', 'C') NOT NULL
}

/* More advanced stats will get put in their tables perhaps later, for now they will be generated via functions. */

CREATE IF NOT EXISTS TABLE Seasons {
    teamID TINYINT,
    teamLossesCount TINYINT UNSIGNED,
    teamWinsCount TINYINT UNSIGNED,
    seasonYear VARCHAR NOT NULL,
    FOREIGN KEY (teamID) REFERENCES Teams(teamID)
}

CREATE IF NOT EXISTS TABLE TeamGameRosters {
    teamId TINYINT,
    
}



CREATE IF NOT EXISTS TABLE Games {
    gameID INT PRIMARY KEY AUTOINCREMENT,
    homeTeamID TINYINT NOT NULL,
    awayTeamID TINYINT NOT NULL,
    homeTeamScore TINYINT UNSIGNED NOT NULL, -- highest score ever in a triple OT game was below 200, we should be safe with that
    awayTeamScore TINYINT UNSIGNED NOT NULL,
    gameType ENUM ('REGULAR', 'PLAYOFFS', 'PRESEASON', 'FINALS', 'ALL-STAR') NOT NULL,
    firstQuarter JSON NOT NULL,
    secondQuarter JSON NOT NULL,
    thirdQuarter JSON NOT NULL,
    fourthQuarter JSON NOT NULL,
    overtimeRefTable JSON, -- most overtimes played ever were six, so this is the best solution for handling arbitrary count of them that I've thought of
    arena VARCHAR,
    attendance MEDIUMINT UNSIGNED,
    refereeName VARCHAR,
    totalTimeOfGame CHAR(4), -- "h:mm" format
    gameDate DATE, -- handling time might come in later, as it's an issue with timezones
    FOREIGN KEY (homeTeamID) REFERENCES Teams(teamID),
    FOREIGN KEY (awayTeamID) REFERENCES Teams(teamID)
}

CREATE IF NOT EXISTS TABLE Quarters {
    quarterID INT PRIMARY KEY AUTO_INCREMENT
    gameID INT,
    FOREIGN KEY (gameID) REFERENCES Games(gameID)

}

CREATE IF NOT EXISTS TABLE Overtimes {

}