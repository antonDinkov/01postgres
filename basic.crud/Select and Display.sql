SELECT
	id,
	concat_ws(' ', first_name, last_name) AS "Full Name",
	job_title as "Job Title"
FROM employees;