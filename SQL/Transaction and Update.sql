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
COMMIT;

