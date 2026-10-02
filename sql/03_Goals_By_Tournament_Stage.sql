--Query 03 — Goals by Tournament Stage
--what question does Query 03 answer?”, it's:
--How many goals were scored in each stage of the FIFA World Cup 2026?


USE FIFA_WorldCup_2026;
GO

-- Query 03: Goals by Tournament Stage

SELECT
    m.Stage,
    COUNT(g.GoalID) AS TotalGoals
FROM Matches m
INNER JOIN Goals g
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