CREATE OR REPLACE FUNCTION log_items_trigger()
RETURNS TRIGGER
AS
$$
BEGIN
    INSERT INTO item_log (item_id, status, created_at)
    VALUES (NEW.id, NEW.status, NOW());
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER log_items_after_insert
AFTER INSERT ON items
FOR EACH ROW
EXECUTE FUNCTION log_items_trigger();