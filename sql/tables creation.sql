USE FIFA_WorldCup_2026;
-------------- Teams --------------
CREATE TABLE Teams (
TeamID INT PRIMARY KEY,
TeamName VARCHAR(100) NOT NULL,
CountryCode VARCHAR(3) NOT NULL,
Confederation  VARCHAR(50) NOT NULL,
GroupName VARCHAR(10) NOT NULL, 
HostCountry Varchar(50)
)
-------------- Selcet Teams --------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Teams'
ORDER BY ORDINAL_POSITION;
-------------- create players table --------------
CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    TeamID INT NOT NULL,
    Position VARCHAR(20) NOT NULL,
    JerseyNumber INT NOT NUll,
    
    CONSTRAINT FK_Players_Teams
        FOREIGN KEY (TeamID)
        REFERENCES Teams(TeamID)
);
-------------- select player table --------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Players'
ORDER BY ORDINAL_POSITION;
-------------- create stadium table --------------
CREATE TABLE Stadiums (
    StadiumID INT PRIMARY KEY,
    StadiumName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL
);
-------------- select stadium table --------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Stadiums'
ORDER BY ORDINAL_POSITION;
-------------- create Match table --------------
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    MatchDate DATE NOT NULL,
    Stage VARCHAR(30) NOT NULL,
    GroupName VARCHAR(10), -- knockout matches don't have a group.
    StadiumID INT NOT NULL,
    Team1ID INT NOT NULL,
    Team2ID INT NOT NULL,
    Team1Goals INT NOT NULL,
    Team2Goals INT NOT NULL,
    WinnerTeamID INT, -- a draw has no winner
    Result VARCHAR(10) NOT NULL,

    CONSTRAINT FK_Matches_Stadiums
        FOREIGN KEY (StadiumID)
        REFERENCES Stadiums(StadiumID),

    CONSTRAINT FK_Matches_Team1
        FOREIGN KEY (Team1ID)
        REFERENCES Teams(TeamID),

    CONSTRAINT FK_Matches_Team2
        FOREIGN KEY (Team2ID)
        REFERENCES Teams(TeamID),

    CONSTRAINT FK_Matches_Winner
        FOREIGN KEY (WinnerTeamID)
        REFERENCES Teams(TeamID)
);
-------------- select Matches table --------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Matches'
ORDER BY ORDINAL_POSITION;
-------------- create MatchStatistics table --------------
CREATE TABLE MatchStatistics (
    StatisticID INT PRIMARY KEY,
    MatchID INT NOT NULL,
    TeamID INT NOT NULL,
    Shots INT NOT NULL,
    ShotsOnTarget INT NOT NULL,
    Possession DECIMAL(5,2) NOT NULL,
    Corners INT NOT NULL,
    Fouls INT NOT NULL,
    YellowCards INT NOT NULL,
    RedCards INT NOT NULL,
    Offsides INT NOT NULL,

    CONSTRAINT FK_MatchStatistics_Matches
        FOREIGN KEY (MatchID)
        REFERENCES Matches(MatchID),

    CONSTRAINT FK_MatchStatistics_Teams
        FOREIGN KEY (TeamID)
        REFERENCES Teams(TeamID)
);
-------------- select MatchStatistics table --------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'MatchStatistics'
ORDER BY ORDINAL_POSITION;
-------------- Create PlayerPhysicalStats table --------------
CREATE TABLE PlayerPhysicalStats (
    PlayerID INT PRIMARY KEY,
    Matches INT NOT NULL,
    DistanceMeters DECIMAL(12,2) NOT NULL,
    Sprints INT NOT NULL,
    HighSpeedRunning DECIMAL(12,2) NOT NULL,
    TopSpeedKmh DECIMAL(5,2) NOT NULL,

    SpeedZone1 DECIMAL(12,2) NOT NULL,
    SpeedZone2 DECIMAL(12,2) NOT NULL,
    SpeedZone3 DECIMAL(12,2) NOT NULL,
    SpeedZone4 DECIMAL(12,2) NOT NULL,
    SpeedZone5 DECIMAL(12,2) NOT NULL,

    LineBreaksAttempted INT NOT NULL,
    LineBreaksCompleted INT NOT NULL,
    LineBreaksAccuracyPct DECIMAL(5,2) NOT NULL,

    Through INT NOT NULL,
    Around INT NOT NULL,
    [Over] INT NOT NULL,
    Pass INT NOT NULL,
    Crosses INT NOT NULL,
    Prog INT NOT NULL,
    TotalCrosses INT NOT NULL,

    CONSTRAINT FK_PlayerPhysicalStats_Player
        FOREIGN KEY (PlayerID)
        REFERENCES Players(PlayerID)
);

-------------- select PlayerPhysicalStats table --------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PlayerPhysicalStats'
ORDER BY ORDINAL_POSITION;
-------------- Create Goals table --------------
CREATE TABLE Goals (
    GoalID INT PRIMARY KEY,
    MatchID INT NOT NULL,
    PlayerID INT NOT NULL,
    TeamID INT NOT NULL,
    Minute VARCHAR(10) NOT NULL,
    GoalType VARCHAR(30) NULL,
    CONSTRAINT FK_Goals_Matches
        FOREIGN KEY (MatchID)
        REFERENCES Matches(MatchID),

    CONSTRAINT FK_Goals_Players
        FOREIGN KEY (PlayerID)
        REFERENCES Players(PlayerID),

    CONSTRAINT FK_Goals_Teams
        FOREIGN KEY (TeamID)
        REFERENCES Teams(TeamID)
);
-------------- select Goals table --------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Goals'
ORDER BY ORDINAL_POSITION;


ALTER TABLE Matches
ADD CONSTRAINT CK_Matches_DifferentTeams
CHECK (Team1ID <> Team2ID);
----------------------------------------
USE FIFA_WorldCup_2026;
GO

CREATE TABLE Player_Stats (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    TeamID INT NOT NULL,
    Position VARCHAR(20) NOT NULL,
    JerseyNumber INT NOT NULL,

    Local_Goals INT NULL,
    Local_RegularGoals INT NULL,
    Local_PenaltyGoals INT NULL,
    Local_OwnGoals INT NULL,
    Local_TotalGoalEvents INT NULL,

    Matches INT NULL,
    DistanceMeters DECIMAL(12,2) NULL,
    Sprints INT NULL,
    HighSpeedRunning DECIMAL(12,2) NULL,
    TopSpeedKmh DECIMAL(6,2) NULL,

    SpeedZone1 DECIMAL(12,2) NULL,
    SpeedZone2 DECIMAL(12,2) NULL,
    SpeedZone3 DECIMAL(12,2) NULL,
    SpeedZone4 DECIMAL(12,2) NULL,
    SpeedZone5 DECIMAL(12,2) NULL,

    LineBreaksAttempted INT NULL,
    LineBreaksCompleted INT NULL,
    LineBreaksAccuracyPct DECIMAL(6,2) NULL,

    Through INT NULL,
    Around INT NULL,
    [Over] INT NULL,
    Pass INT NULL,
    Local_Crosses INT NULL,
    Prog INT NULL,
    TotalCrosses INT NULL,

    Goals INT NULL,
    Assists INT NULL,
    MinutesPlayed INT NULL,

    AttemptsOnTarget INT NULL,
    AttemptsAtGoal INT NULL,
    AttemptsAtGoalConvRatePct DECIMAL(6,2) NULL,
    AttemptsInsidethePenaltyArea INT NULL,
    AttemptsOutsidethePenaltyArea INT NULL,
    HeadedAttemptsatGoal INT NULL,

    xG DECIMAL(10,2) NULL,
    xGEfficiency DECIMAL(10,2) NULL,

    Corners INT NULL,
    Passes INT NULL,
    PassingAccuracyPct DECIMAL(6,2) NULL,

    Crosses INT NULL,
    CrossingAccuracyPct DECIMAL(6,2) NULL,

    DefensiveLinebreaksAttempted INT NULL,
    DefensiveLinebreaksAccPct DECIMAL(6,2) NULL,

    SwitchesofPlayAttempted INT NULL,
    SwitchesofPlayAccPct DECIMAL(6,2) NULL,

    OwnGoals INT NULL,
    ForcedTurnovers INT NULL,
    DefensivePressuresApplied INT NULL,
    DefensivePressuresDirectlyApplied INT NULL,

    FoulsAgainst INT NULL,
    FoulsFor INT NULL,
    YellowCards INT NULL,
    RedCards INT NULL,
    IndirectRedCards INT NULL,
    Offsides INT NULL,

    GoalkeeperSaves INT NULL,
    GoalkeeperActionsInsidethePenaltyArea INT NULL,
    GoalkeeperActionsOutsidethePenaltyArea INT NULL,

    CONSTRAINT FK_Player_Stats_Players
        FOREIGN KEY (PlayerID)
        REFERENCES Players(PlayerID),

    CONSTRAINT FK_Player_Stats_Teams
        FOREIGN KEY (TeamID)
        REFERENCES Teams(TeamID)
);
GO
---------------------------------------------
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Player_Stats'
ORDER BY ORDINAL_POSITION;