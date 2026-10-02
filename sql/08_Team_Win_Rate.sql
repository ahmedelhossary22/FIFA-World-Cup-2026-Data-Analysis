--Team Win Rate
--how successful each team was based on its wins compared with matches played.
USE FIFA_WorldCup_2026;
GO

-- Query 08: Team Win Rate

SELECT
    t.TeamName,
    COUNT(*) AS MatchesPlayed,
    SUM(
        CASE
            WHEN m.WinnerTeamID = t.TeamID THEN 1
            ELSE 0
        END
    ) AS Wins,
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
    WinRatePercentage DESC,
    Wins DESC,
    t.TeamName ASC;
GO