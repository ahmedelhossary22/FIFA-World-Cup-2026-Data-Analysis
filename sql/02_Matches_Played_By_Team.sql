-- Query 02 — Matches Played by Each Team
--This query answers a useful question:
--How many matches did each team play in the 2026 World Cup?
USE FIFA_WorldCup_2026;
GO

-- Query 02: Matches Played by Each Team

SELECT
    t.TeamName,
    COUNT(*) AS MatchesPlayed
FROM
(
    SELECT Team1ID AS TeamID
    FROM Matches

    UNION ALL

    SELECT Team2ID AS TeamID
    FROM Matches
) m
INNER JOIN Teams t
    ON m.TeamID = t.TeamID
GROUP BY
    t.TeamID,
    t.TeamName
ORDER BY
    MatchesPlayed DESC,
    t.TeamName ASC;
GO