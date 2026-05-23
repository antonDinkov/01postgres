CREATE VIEW view_addresses AS
SELECT
	concat_ws(' ', e.first_name, e.last_name) AS full_name,
	department_id,
	concat_ws(' ', a.number, a.street) AS address
FROM employees AS e
JOIN addresses AS a
	ON e.address_id = a.id
ORDER BY address;