-- Query 01 — Top Scoring Teams
USE FIFA_WorldCup_2026;
GO

SELECT
    t.TeamName,
    COUNT(g.GoalID) AS TotalGoals
FROM Teams t
INNER JOIN Goals g
    ON t.TeamID = g.TeamID
GROUP BY
    t.TeamID,
    t.TeamName
ORDER BY
    TotalGoals DESC,
    t.TeamName ASC;
GO