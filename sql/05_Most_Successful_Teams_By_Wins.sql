--Most Successful Teams by Wins
--Which teams recorded the most wins in the FIFA World Cup 2026?
USE FIFA_WorldCup_2026;
GO

-- Query 05: Most Successful Teams by Wins

SELECT
    t.TeamName,
    COUNT(m.MatchID) AS Wins
FROM Matches m
INNER JOIN Teams t
    ON m.WinnerTeamID = t.TeamID
GROUP BY
    t.TeamID,
    t.TeamName
ORDER BY
    Wins DESC,
    t.TeamName ASC;
GO