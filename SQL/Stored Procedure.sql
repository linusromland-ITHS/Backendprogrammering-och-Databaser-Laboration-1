DROP PROCEDURE IF EXISTS get_num_of_seasons_on_series;

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
