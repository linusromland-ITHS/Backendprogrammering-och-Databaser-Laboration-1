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

