ALTER TABLE countries
ADD CONSTRAINT continents_code_cnstrt
	FOREIGN KEY (continent_code)
			REFERENCES continents(continent_code)
			ON DELETE CASCADE,
ADD CONSTRAINT currencies_code_cnstrt
	FOREIGN KEY (currency_code)
			REFERENCES currencies(currency_code)
			ON DELETE CASCADE
;