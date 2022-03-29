DROP VIEW all_comedy_series;

CREATE VIEW all_comedy_series AS
SELECT series_name, series_description, genre_name
FROM series
         INNER JOIN genre
                    ON series.series_genre_id = genre.genre_id
WHERE genre_name = 'Comedy';

SELECT *
from all_comedy_series;