-- Active: 1795113281254@@127.0.0.1@3306
-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
SELECT 'before' AS period, AVG(daily_users) AS daily_average
FROM (
    SELECT datetime(login_timestamp, 'unixepoch') AS day,
        COUNT(DISTINCT user_id) AS daily_users
    FROM login_history
    WHERE datetime(login_timestamp, 'unixepoch') < '2018-06-02'
    GROUP BY login_timestamp
)
UNION ALL
SELECT 'after' AS period, AVG(daily_users) AS daily_average
FROM (
    SELECT datetime(login_timestamp, 'unixepoch') AS day,
        COUNT(DISTINCT user_id) AS daily_users
    FROM login_history
    WHERE datetime(login_timestamp, 'unixepoch') >= '2018-06-02'
    GROUP BY login_timestamp
);



-- PART 2: Create a SQL query that indicates the number of status changes by card
SELECT cardID, COUNT(*) AS number_of_changes
FROM card_change_history
GROUP BY cardID
ORDER BY number_of_changes DESC;




