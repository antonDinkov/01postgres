SELECT
    SUBSTRING(first_name, 1, 2) AS initials,
	COUNT(*) AS user_count
FROM users
GROUP BY initials
ORDER BY
	user_count DESC,
	initials ASC
;