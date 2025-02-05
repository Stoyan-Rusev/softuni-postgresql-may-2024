-- Step 1: Delete from board_games
DELETE FROM board_games
WHERE publisher_id IN (
    SELECT id
    FROM publishers
    WHERE address_id IN (
        SELECT id
        FROM addresses
        WHERE town LIKE 'L%'
    )
);

-- Step 2: Delete from publishers
DELETE FROM publishers
WHERE address_id IN (
    SELECT id
    FROM addresses
    WHERE town LIKE 'L%'
);

-- Step 3: Delete from addresses
DELETE FROM addresses
WHERE town LIKE 'L%';