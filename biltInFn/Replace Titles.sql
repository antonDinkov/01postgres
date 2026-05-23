SELECT
    REPLACE(title, 'The', '***') AS updated_title
FROM books
WHERE title LIKE 'The%'
ORDER BY id;