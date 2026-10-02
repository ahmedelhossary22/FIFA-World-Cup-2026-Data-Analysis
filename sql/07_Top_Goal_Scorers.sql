-- Top Goal Scorers
--Which players scored the most goals in the FIFA World Cup 2026?
USE FIFA_WorldCup_2026;
GO

-- Query 07: Top Goal Scorers

SELECT
    p.PlayerName,
    t.TeamName,
    COUNT(g.GoalID) AS GoalsScored
FROM Goals g
INNER JOIN Players p
    ON g.PlayerID = p.PlayerID
INNER JOIN Teams t
    ON g.TeamID = t.TeamID
WHERE g.GoalType <> 'Own Goal'
   OR g.GoalType IS NULL
GROUP BY
    p.PlayerID,
    p.PlayerName,
    t.TeamID,
    t.TeamName
ORDER BY
    GoalsScored DESC,
    p.PlayerName ASC;
GO