USE FIFA_WorldCup_2026;
GO
------------- import Teams.csv -----------------
BULK INSERT Teams
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\Teams.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO
--------------- select from teams ---------------
SELECT COUNT(*) AS TeamsRows
FROM Teams;

SELECT TOP 10 *
FROM Teams
ORDER BY TeamID;
--------------------- import stadium.csv ----------
BULK INSERT Stadiums
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\Stadiums.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO
--------------- select from stadium ---------------
SELECT COUNT(*) AS StadiumsRows
FROM Stadiums;

SELECT TOP 10 *
FROM Stadiums
ORDER BY StadiumID;
--------------------- import players.csv ----------
BULK INSERT Players
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\Players.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO
--------------- select from player ---------------
SELECT COUNT(*) AS PlayersRows
FROM Players;

SELECT TOP 10 *
FROM Players
ORDER BY PlayerID;
--------------------- import matchs.csv ----------
/* Temporary staging table */
CREATE TABLE #Matches_Staging (
    MatchID VARCHAR(20),
    MatchDate VARCHAR(30),
    Stage VARCHAR(50),
    GroupName VARCHAR(20),
    StadiumID VARCHAR(20),
    Team1ID VARCHAR(20),
    Team2ID VARCHAR(20),
    Team1Goals VARCHAR(20),
    Team2Goals VARCHAR(20),
    WinnerTeamID VARCHAR(20),
    Result VARCHAR(20)
);
BULK INSERT #Matches_Staging
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\Matches.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO
/* =========================================================
   INSERT INTO REAL MATCHES TABLE
   ========================================================= */

INSERT INTO Matches (
    MatchID,
    MatchDate,
    Stage,
    GroupName,
    StadiumID,
    Team1ID,
    Team2ID,
    Team1Goals,
    Team2Goals,
    WinnerTeamID,
    Result
)
SELECT
    CAST(CAST(MatchID AS DECIMAL(10,1)) AS INT),
    CAST(MatchDate AS DATE),
    Stage,
    NULLIF(GroupName, ''),
    CAST(CAST(StadiumID AS DECIMAL(10,1)) AS INT),
    CAST(CAST(Team1ID AS DECIMAL(10,1)) AS INT),
    CAST(CAST(Team2ID AS DECIMAL(10,1)) AS INT),
    CAST(CAST(Team1Goals AS DECIMAL(10,1)) AS INT),
    CAST(CAST(Team2Goals AS DECIMAL(10,1)) AS INT),
    CASE
        WHEN NULLIF(WinnerTeamID, '') IS NULL THEN NULL
        ELSE CAST(
            CAST(WinnerTeamID AS DECIMAL(10,1))
            AS INT
        )
    END,
    Result
FROM #Matches_Staging;
/* =========================================================
   VERIFY IMPORT
   ========================================================= */

SELECT COUNT(*) AS MatchesRows
FROM Matches;

SELECT TOP 10 *
FROM Matches
ORDER BY MatchID;
--------------------- import MatchStatistics.csv ----------
BULK INSERT MatchStatistics
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\MatchStatistics.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO
--------------------- select MatchStatistics.csv ----------
SELECT COUNT(*) AS MatchStatisticsRows
FROM MatchStatistics;

SELECT TOP 10 *
FROM MatchStatistics
ORDER BY StatisticID;
--------------------- import MatchStatistics.csv ----------
BULK INSERT PlayerPhysicalStats
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\PlayerPhysicalStats.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO
--------------------- select MatchStatistics.csv ----------
SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT PlayerID) AS UniquePlayerIDs,
    MIN(PlayerID) AS MinPlayerID,
    MAX(PlayerID) AS MaxPlayerID
FROM PlayerPhysicalStats;

--------------------- import goal.csv ----------
BULK INSERT Goals
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\Goals.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO
--------------------- select goal.csv ----------
SELECT
    COUNT(*) AS TotalGoals,
    COUNT(DISTINCT GoalID) AS UniqueGoalIDs,
    MIN(GoalID) AS MinGoalID,
    MAX(GoalID) AS MaxGoalID
FROM Goals;
----------------------














USE FIFA_WorldCup_2026;
GO

/* =========================================================
   IMPORT FIFA MASTER PLAYER STATS
   ========================================================= */

/* Temporary staging table
   All columns are VARCHAR first so SQL Server does not
   fail because of NULLs or values such as 4.0
*/

CREATE TABLE #Player_Stats_Staging (

    PlayerID VARCHAR(50),
    PlayerName VARCHAR(200),
    TeamID VARCHAR(50),
    Position VARCHAR(50),
    JerseyNumber VARCHAR(50),

    Local_Goals VARCHAR(50),
    Local_RegularGoals VARCHAR(50),
    Local_PenaltyGoals VARCHAR(50),
    Local_OwnGoals VARCHAR(50),
    Local_TotalGoalEvents VARCHAR(50),

    Matches VARCHAR(50),
    DistanceMeters VARCHAR(50),
    Sprints VARCHAR(50),
    HighSpeedRunning VARCHAR(50),
    TopSpeedKmh VARCHAR(50),

    SpeedZone1 VARCHAR(50),
    SpeedZone2 VARCHAR(50),
    SpeedZone3 VARCHAR(50),
    SpeedZone4 VARCHAR(50),
    SpeedZone5 VARCHAR(50),

    LineBreaksAttempted VARCHAR(50),
    LineBreaksCompleted VARCHAR(50),
    LineBreaksAccuracyPct VARCHAR(50),

    Through VARCHAR(50),
    Around VARCHAR(50),
    [Over] VARCHAR(50),
    Pass VARCHAR(50),
    Local_Crosses VARCHAR(50),
    Prog VARCHAR(50),
    TotalCrosses VARCHAR(50),

    Goals VARCHAR(50),
    Assists VARCHAR(50),
    MinutesPlayed VARCHAR(50),

    AttemptsOnTarget VARCHAR(50),
    AttemptsAtGoal VARCHAR(50),
    AttemptsAtGoalConvRatePct VARCHAR(50),
    AttemptsInsidethePenaltyArea VARCHAR(50),
    AttemptsOutsidethePenaltyArea VARCHAR(50),
    HeadedAttemptsatGoal VARCHAR(50),

    xG VARCHAR(50),
    xGEfficiency VARCHAR(50),

    Corners VARCHAR(50),
    Passes VARCHAR(50),
    PassingAccuracyPct VARCHAR(50),

    Crosses VARCHAR(50),
    CrossingAccuracyPct VARCHAR(50),

    DefensiveLinebreaksAttempted VARCHAR(50),
    DefensiveLinebreaksAccPct VARCHAR(50),

    SwitchesofPlayAttempted VARCHAR(50),
    SwitchesofPlayAccPct VARCHAR(50),

    OwnGoals VARCHAR(50),
    ForcedTurnovers VARCHAR(50),
    DefensivePressuresApplied VARCHAR(50),
    DefensivePressuresDirectlyApplied VARCHAR(50),

    FoulsAgainst VARCHAR(50),
    FoulsFor VARCHAR(50),
    YellowCards VARCHAR(50),
    RedCards VARCHAR(50),
    IndirectRedCards VARCHAR(50),
    Offsides VARCHAR(50),

    GoalkeeperSaves VARCHAR(50),
    GoalkeeperActionsInsidethePenaltyArea VARCHAR(50),
    GoalkeeperActionsOutsidethePenaltyArea VARCHAR(50)
);
GO


/* =========================================================
   BULK INSERT CSV INTO STAGING TABLE
   ========================================================= */

BULK INSERT #Player_Stats_Staging
FROM 'D:\ai course hw\FIFA_WorldCup_2026_Project\Data\FIFA_WorldCup_2026_Master_Player_Stats.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);
GO


/* =========================================================
   INSERT INTO REAL Player_Stats TABLE
   ========================================================= */

INSERT INTO Player_Stats (
    PlayerID,
    PlayerName,
    TeamID,
    Position,
    JerseyNumber,

    Local_Goals,
    Local_RegularGoals,
    Local_PenaltyGoals,
    Local_OwnGoals,
    Local_TotalGoalEvents,

    Matches,
    DistanceMeters,
    Sprints,
    HighSpeedRunning,
    TopSpeedKmh,

    SpeedZone1,
    SpeedZone2,
    SpeedZone3,
    SpeedZone4,
    SpeedZone5,

    LineBreaksAttempted,
    LineBreaksCompleted,
    LineBreaksAccuracyPct,

    Through,
    Around,
    [Over],
    Pass,
    Local_Crosses,
    Prog,
    TotalCrosses,

    Goals,
    Assists,
    MinutesPlayed,

    AttemptsOnTarget,
    AttemptsAtGoal,
    AttemptsAtGoalConvRatePct,
    AttemptsInsidethePenaltyArea,
    AttemptsOutsidethePenaltyArea,
    HeadedAttemptsatGoal,

    xG,
    xGEfficiency,

    Corners,
    Passes,
    PassingAccuracyPct,

    Crosses,
    CrossingAccuracyPct,

    DefensiveLinebreaksAttempted,
    DefensiveLinebreaksAccPct,

    SwitchesofPlayAttempted,
    SwitchesofPlayAccPct,

    OwnGoals,
    ForcedTurnovers,
    DefensivePressuresApplied,
    DefensivePressuresDirectlyApplied,

    FoulsAgainst,
    FoulsFor,
    YellowCards,
    RedCards,
    IndirectRedCards,
    Offsides,

    GoalkeeperSaves,
    GoalkeeperActionsInsidethePenaltyArea,
    GoalkeeperActionsOutsidethePenaltyArea
)

SELECT
    TRY_CONVERT(INT, NULLIF(PlayerID, '')),
    NULLIF(PlayerName, ''),
    TRY_CONVERT(INT, NULLIF(TeamID, '')),
    NULLIF(Position, ''),
    TRY_CONVERT(INT, NULLIF(JerseyNumber, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Local_Goals, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Local_RegularGoals, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Local_PenaltyGoals, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Local_OwnGoals, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Local_TotalGoalEvents, ''))),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Matches, ''))),
    TRY_CONVERT(DECIMAL(12,2), NULLIF(DistanceMeters, '')),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Sprints, ''))),
    TRY_CONVERT(DECIMAL(12,2), NULLIF(HighSpeedRunning, '')),
    TRY_CONVERT(DECIMAL(6,2), NULLIF(TopSpeedKmh, '')),

    TRY_CONVERT(DECIMAL(12,2), NULLIF(SpeedZone1, '')),
    TRY_CONVERT(DECIMAL(12,2), NULLIF(SpeedZone2, '')),
    TRY_CONVERT(DECIMAL(12,2), NULLIF(SpeedZone3, '')),
    TRY_CONVERT(DECIMAL(12,2), NULLIF(SpeedZone4, '')),
    TRY_CONVERT(DECIMAL(12,2), NULLIF(SpeedZone5, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(LineBreaksAttempted, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(LineBreaksCompleted, ''))),
    TRY_CONVERT(DECIMAL(6,2), NULLIF(LineBreaksAccuracyPct, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Through, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Around, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF([Over], ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Pass, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Local_Crosses, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Prog, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(TotalCrosses, ''))),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Goals, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Assists, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(MinutesPlayed, ''))),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(AttemptsOnTarget, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(AttemptsAtGoal, ''))),
    TRY_CONVERT(DECIMAL(6,2), NULLIF(AttemptsAtGoalConvRatePct, '')),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(AttemptsInsidethePenaltyArea, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(AttemptsOutsidethePenaltyArea, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(HeadedAttemptsatGoal, ''))),

    TRY_CONVERT(DECIMAL(10,2), NULLIF(xG, '')),
    TRY_CONVERT(DECIMAL(10,2), NULLIF(xGEfficiency, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Corners, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Passes, ''))),
    TRY_CONVERT(DECIMAL(6,2), NULLIF(PassingAccuracyPct, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Crosses, ''))),
    TRY_CONVERT(DECIMAL(6,2), NULLIF(CrossingAccuracyPct, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(DefensiveLinebreaksAttempted, ''))),
    TRY_CONVERT(DECIMAL(6,2), NULLIF(DefensiveLinebreaksAccPct, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(SwitchesofPlayAttempted, ''))),
    TRY_CONVERT(DECIMAL(6,2), NULLIF(SwitchesofPlayAccPct, '')),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(OwnGoals, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(ForcedTurnovers, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(DefensivePressuresApplied, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(DefensivePressuresDirectlyApplied, ''))),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(FoulsAgainst, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(FoulsFor, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(YellowCards, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(RedCards, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(IndirectRedCards, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(Offsides, ''))),

    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(GoalkeeperSaves, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(GoalkeeperActionsInsidethePenaltyArea, ''))),
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(18,4), NULLIF(GoalkeeperActionsOutsidethePenaltyArea, '')))
FROM #Player_Stats_Staging;
GO


/* =========================================================
   VERIFY IMPORT
   ========================================================= */

SELECT
    COUNT(*) AS PlayerStatsRows,
    COUNT(DISTINCT PlayerID) AS UniquePlayerIDs,
    MIN(PlayerID) AS MinPlayerID,
    MAX(PlayerID) AS MaxPlayerID
FROM Player_Stats;

SELECT TOP 10
    PlayerID,
    PlayerName,
    TeamID,
    Position,
    Goals,
    Assists,
    MinutesPlayed,
    GoalkeeperSaves
FROM Player_Stats
ORDER BY PlayerID;
GO
------------------