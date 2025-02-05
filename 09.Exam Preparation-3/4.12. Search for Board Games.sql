CREATE TABLE IF NOT EXISTS search_results(
    "id" SERIAL PRIMARY KEY,
	game_name VARCHAR(50),
	release_year INT,
	rating NUMERIC(10, 2),
	category_name VARCHAR(50),
	publisher_name VARCHAR(50),
	min_players VARCHAR(50),
	max_players VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE usp_search_by_category(
	category VARCHAR(50)
) AS
$$
BEGIN
	TRUNCATE TABLE
		search_results;

	INSERT INTO 
		search_results(
            game_name,
            release_year,
            rating,
            category_name,
            publisher_name,
            min_players,
            max_players
        )
	SELECT
		bg.name,
		bg.release_year,
		bg.rating,
		cat.name AS category_name,
		pub.name AS publisher_name,
		CONCAT(pr.min_players, ' people') AS min_players,
		CONCAT(pr.max_players, ' people') AS max_players
	FROM 
		board_games AS bg
	JOIN 
		categories AS cat
		ON 
		cat.id = bg.category_id
	JOIN 
		publishers AS pub
		ON
		pub.id = bg.publisher_id
	JOIN 
		players_ranges AS pr
		ON
		pr.id = bg.players_range_id
	WHERE
		cat.name = category
	ORDER BY
		publisher_name,
		release_year DESC;
END;
$$
LANGUAGE plpgsql;