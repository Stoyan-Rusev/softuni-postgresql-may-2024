-- CHAT GPT CORRECT
SELECT
    CONCAT(SUBSTRING(description FROM 1 FOR 10), '...') AS summary,
	TO_CHAR(capture_date, 'DD.MM HH24:MI') AS "date"
FROM 
    photos
WHERE
    EXTRACT(DAY FROM capture_date) = 10
ORDER BY
	capture_date DESC
;

-- MY INCORRECT
SELECT
    CONCAT(SUBSTRING(description FROM 1 FOR 10), '...') AS summary,
	TO_CHAR(capture_date, 'DD.MM HH24:MI') AS "date"
FROM 
    photos
WHERE
    EXTRACT(DAY FROM capture_date) = 10
ORDER BY
	"date" DESC
;