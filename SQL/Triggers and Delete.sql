CREATE TRIGGER before_series_delete
    BEFORE DELETE
    ON series
    FOR EACH ROW
BEGIN
    DELETE FROM season WHERE season_series_id = old.series_id;
    DELETE FROM series_producer WHERE series_producer_sid = old.series_id;
END;

CREATE TRIGGER before_season_delete
    BEFORE DELETE
    ON season
    FOR EACH ROW
BEGIN
    DELETE FROM episode WHERE episode_season_id = OLD.season_id;
END;


DELETE
FROM series
WHERE series_name = 'Friends';