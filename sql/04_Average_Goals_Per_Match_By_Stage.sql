--Query 04 — Average Goals per Match by Stage
--What was the average number of goals scored per match in each tournament stage?
USE FIFA_WorldCup_2026;
GO

-- Query 04: Average Goals per Match by Tournament Stage

SELECT
    m.Stage,
    COUNT(DISTINCT m.MatchID) AS MatchesPlayed,
    COUNT(g.GoalID) AS TotalGoals,
    CAST(
        COUNT(g.GoalID) * 1.0 / COUNT(DISTINCT m.MatchID)
        AS DECIMAL(5,2)
    ) AS AverageGoalsPerMatch
FROM Matches m
LEFT JOIN Goals g
    ON m.MatchID = g.MatchID
GROUP BY
    m.Stage
ORDER BY
    CASE m.Stage
        WHEN 'First Stage' THEN 1
        WHEN 'Round of 32' THEN 2
        WHEN 'Round of 16' THEN 3
        WHEN 'Quarter-final' THEN 4
        WHEN 'Semi-final' THEN 5
        WHEN 'Bronze final' THEN 6
        WHEN 'Final' THEN 7
        ELSE 8
    END;
GO