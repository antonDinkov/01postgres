SELECT
	population,
	LENGTH(CAST(population AS TEXT)) AS length
FROM countries;

/* or */

SELECT
    population,
    LENGTH(population::TEXT)
FROM countries;