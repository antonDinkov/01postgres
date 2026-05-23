CREATE VIEW view_continents_countries_currencies_details AS
	SELECT
		concat_ws(': ', cont.continent_name, cont.continent_code) AS "continent_details",
		concat_ws(' - ', country.country_name, country.capital, country.area_in_sq_km, 'km2') AS "country_information",
		CONCAT(cur.description, ' (', cur.currency_code, ')') AS "currencies"
	FROM continents AS cont
	JOIN countries AS country
		ON cont.continent_code = country.continent_code
	JOIN currencies as cur
		ON country.currency_code = cur.currency_code
	ORDER BY
		country_information,
		currencies;

SELECT * FROM view_continents_countries_currencies_details;