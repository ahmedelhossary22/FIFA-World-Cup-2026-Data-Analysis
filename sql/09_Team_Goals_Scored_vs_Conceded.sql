--Team Goals Scored vs Goals Conceded
-- this one is useful for the dashboard because it compares each team's attacking performance with its defensive performance.
USE FIFA_WorldCup_2026;
GO

-- Query 09: Goals Scored vs Goals Conceded by Team

SELECT
    t.TeamName,

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
    ) AS GoalDifference

FROM Teams t
INNER JOIN Matches m
    ON t.TeamID = m.Team1ID
    OR t.TeamID = m.Team2ID

GROUP BY
    t.TeamID,
    t.TeamName

ORDER BY
    GoalDifference DESC,
    GoalsScored DESC,
    t.TeamName ASC;
GO