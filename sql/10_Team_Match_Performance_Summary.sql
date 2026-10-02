--Query 10 — Team Match Performance Summary
--final SQL analysis query. It combines several useful metrics into one team-level summary:
--Matches played
--Wins
--Draws
--Losses
--Goals scored
--Goals conceded
--Goal difference
--Win rate
USE FIFA_WorldCup_2026;
GO

-- Query 10: Team Match Performance Summary

SELECT
    t.TeamName,

    COUNT(*) AS MatchesPlayed,

    SUM(
        CASE
            WHEN m.WinnerTeamID = t.TeamID THEN 1
            ELSE 0
        END
    ) AS Wins,

    SUM(
        CASE
            WHEN m.Result = 'D' THEN 1
            ELSE 0
        END
    ) AS Draws,

    SUM(
        CASE
            WHEN m.Result <> 'D'
                 AND m.WinnerTeamID <> t.TeamID THEN 1
            ELSE 0
        END
    ) AS Losses,

    SUM(
        CASE
            WHEN m.Team1ID = t.TeamID THEN m.Team1Goals
            WHEN m.Team2ID = t.TeamID THEN m.Team2Goals
        END
    ) AS GoalsScored,

    SUM(
        CASE
            WHEN m.Team1ID = t.TeamID THEN m.Team2Goals
            WHEN m.Team2ID = t.TeamID THEN m.Team1Goals
        END
    ) AS GoalsConceded,

    SUM(
        CASE
            WHEN m.Team1ID = t.TeamID THEN m.Team1Goals - m.Team2Goals
            WHEN m.Team2ID = t.TeamID THEN m.Team2Goals - m.Team1Goals
        END
    ) AS GoalDifference,

    CAST(
        SUM(
            CASE
                WHEN m.WinnerTeamID = t.TeamID THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS WinRatePercentage

FROM Teams t
INNER JOIN Matches m
    ON t.TeamID = m.Team1ID
    OR t.TeamID = m.Team2ID

GROUP BY
    t.TeamID,
    t.TeamName

ORDER BY
    Wins DESC,
    GoalDifference DESC,
    GoalsScored DESC,
    t.TeamName ASC;
GO