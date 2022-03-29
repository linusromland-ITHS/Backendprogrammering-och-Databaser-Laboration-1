-- Starts the transaction
START TRANSACTION;

-- Updates a series
UPDATE series
SET series_description = 'Cool Series bre!'
WHERE series_name = 'Friends';

SELECT * FROM series;

-- Rollback
ROLLBACK;

-- Commits changes
-- COMMIT;

-- Creates a view that only shows the series with the genre Comedy
CREATE VIEW all_comedy_series AS
SELECT series_name, series_description, genre_name
FROM series
         INNER JOIN genre
                    ON series.series_genre_id = genre.genre_id
WHERE genre_name = 'Comedy';

-- Selects all from the created view
SELECT *
from all_comedy_series;

-- Stored Procedure that returns the number of seasons on the inputed series
DELIMITER //

CREATE PROCEDURE get_num_of_seasons_on_series(IN s_name varchar(255), OUT num_of_seasons INT)
BEGIN
    SELECT COUNT(*)
    INTO num_of_seasons
    FROM season
    WHERE season_series_id = (SELECT series_id FROM series WHERE series_name = s_name);
END //

DELIMITER ;

CALL get_num_of_seasons_on_series('Friends', @num_of_seasons);
SELECT @num_of_seasons;


-- Tries to delete Series but is unable due to Foreign Key
DELETE
FROM series
WHERE series_name = 'Friends';

-- Tries to create a series with invalid genre_id but is unable due to invalid foreign key
INSERT INTO series(series_name, series_description, series_genre_id)
VALUES ('Fake Series', 'Series to test if you can create without correct genre', 685);

-- Creates trigger that deletes the season and series_producer on series delete
CREATE TRIGGER before_series_delete
    BEFORE DELETE
    ON series
    FOR EACH ROW
BEGIN
    DELETE FROM season WHERE season_series_id = old.series_id;
    DELETE FROM series_producer WHERE series_producer_sid = old.series_id;
END;

-- Creates trigger that deletes all episodes on season on season delete
CREATE TRIGGER before_season_delete
    BEFORE DELETE
    ON season
    FOR EACH ROW
BEGIN
    DELETE FROM episode WHERE episode_season_id = OLD.season_id;
END;

-- Deletes the Series Friends (to use triggers)
DELETE
FROM series
WHERE series_name = 'Friends';

-- View all series from one producer
SELECT producer_id,
       producer_name,
       GROUP_CONCAT(s.series_name) as series
FROM producer AS p
         INNER JOIN series_producer AS sp
                    ON p.producer_id = sp.series_producer_pid
         INNER JOIN series AS s
                    ON sp.series_producer_sid = s.series_id
GROUP BY producer_id;

-- View all producers and other information about a series
SELECT series_id, series_name, series_description, genre_name, GROUP_CONCAT(p.producer_name) AS producers
FROM series as s
         INNER JOIN genre
                    ON s.series_genre_id = genre.genre_id
         INNER JOIN series_producer AS sp
                    ON s.series_id = sp.series_producer_sid
         INNER JOIN producer AS p
                    ON sp.series_producer_pid =p.producer_id
GROUP BY series_id;

