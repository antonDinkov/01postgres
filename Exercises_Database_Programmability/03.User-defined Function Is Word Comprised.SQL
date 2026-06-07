CREATE OR REPLACE FUNCTION fn_is_word_comprised(
    set_of_letters VARCHAR(50),
    word VARCHAR(50)
)
RETURNS BOOLEAN
AS
$$
DECLARE
    current_char CHAR(1);
BEGIN
    set_of_letters := LOWER(set_of_letters);
    word := LOWER(word);

    WHILE LENGTH(word) > 0 LOOP

        current_char := LEFT(word, 1);

        IF current_char ~ '[a-z]' THEN
            IF POSITION(current_char IN set_of_letters) = 0 THEN
                RETURN FALSE;
            END IF;
        END IF;

        word := SUBSTRING(word FROM 2);

    END LOOP;

    RETURN TRUE;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_is_word_comprised('ois tmiah%f', 'Sofia');