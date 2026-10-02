-- Query 06 — Team Goals Conceded
-- How many goals did each team concede during the 2026 World Cup?
USE FIFA_WorldCup_2026;
GO

-- Query 06: Goals Conceded by Each Team

SELECT
    t.TeamName,
    SUM(
        CASE
            WHEN m.Team1ID = t.TeamID THEN m.Team2Goals
            WHEN m.Team2ID = t.TeamID THEN m.Team1Goals
        END
    ) AS GoalsConceded
FROM Teams t
INNER JOIN Matches m
    ON t.TeamID = m.Team1ID
    OR t.TeamID = m.Team2ID
GROUP BY
    t.TeamID,
    t.TeamName
ORDER BY
    GoalsConceded DESC,
    t.TeamName ASC;
GO