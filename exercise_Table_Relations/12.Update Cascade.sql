ALTER TABLE countries_rivers
ADD CONSTRAINT country_code_cnstrt
	FOREIGN KEY (country_code)
			REFERENCES countries(country_code)
			ON UPDATE CASCADE,
ADD CONSTRAINT river_id_cnstrt
	FOREIGN KEY (river_id)
			REFERENCES rivers(id)
			ON UPDATE CASCADE
;