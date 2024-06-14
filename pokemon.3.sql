-- Which pokemon have the highest total stats? (highest to 5th highest)
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY total DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;
-- They are all legendary pokemons 

-- Which non-legendary pokemon have the highest total stats? 
-- (highest to 5th highest)
SELECT * FROM (
	SELECT *, 
	DENSE_RANK() OVER(ORDER BY total DESC) as rank 
	FROM pokemon
	WHERE legendary = 'false'
)  as t
WHERE t.rank <= 5
-- Most of them are Mega poekemons

-- Which non-legendary and non-mega pokemon have the highest total stats? 
-- (highest to 5th highest)
SELECT * FROM (
	SELECT *, 
	DENSE_RANK() OVER(ORDER BY total DESC) as rank 
	FROM pokemon
	WHERE legendary = 'false'
	AND name NOT LIKE '%Mega%' 
)  as t
WHERE t.rank <= 5

-- top 5 pokemons for each stats.
-- Attack
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY attack DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- Defense 
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY defense DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- Special Attack
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY sp_attack DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- Special Defense
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY sp_defense DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- HP
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY hp DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- Speed
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY speed DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- Show top pokemons from each type for each stats
-- (highest to 3rd highest)
-- Total
WITH RankedPokemon AS (
    SELECT *,
    DENSE_RANK() OVER (PARTITION BY type ORDER BY total DESC) as rank
    FROM (
        SELECT type1 AS type, name, total FROM pokemon
        UNION ALL
        SELECT type2 AS type, name, total FROM pokemon WHERE type2 IS NOT NULL
    ) AS combined
)
SELECT name, total, type, rank
FROM RankedPokemon
WHERE rank<= 3
ORDER BY type, rank;

-- HP
WITH RankedPokemon AS (
    SELECT *,
    DENSE_RANK() OVER (PARTITION BY type ORDER BY hp DESC) as rank
    FROM (
        SELECT type1 AS type, name, hp FROM pokemon
        UNION ALL
        SELECT type2 AS type, name, hp FROM pokemon WHERE type2 IS NOT NULL
    ) AS combined
)
SELECT name, hp, type, rank
FROM RankedPokemon
WHERE rank<= 3
ORDER BY type, rank;

-- Attack
WITH RankedPokemon AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY type ORDER BY attack DESC) as rank
    FROM (
        SELECT type1 AS type, name, attack FROM pokemon
        UNION ALL
        SELECT type2 AS type, name, attack FROM pokemon WHERE type2 IS NOT NULL
    ) AS combined
)
SELECT name, attack, type, rank
FROM RankedPokemon
WHERE rank<= 3
ORDER BY type, rank;

-- Defense
WITH RankedPokemon AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY type ORDER BY defense DESC) as rank
    FROM (
        SELECT type1 AS type, name, defense FROM pokemon
        UNION ALL
        SELECT type2 AS type, name, defense FROM pokemon WHERE type2 IS NOT NULL
    ) AS combined
)
SELECT name, defense, type, rank
FROM RankedPokemon
WHERE rank<= 3
ORDER BY type, rank;

-- SP Attack
WITH RankedPokemon AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY type ORDER BY sp_attack DESC) as rank
    FROM (
        SELECT type1 AS type, name, sp_attack FROM pokemon
        UNION ALL
        SELECT type2 AS type, name, sp_attack FROM pokemon WHERE type2 IS NOT NULL
    ) AS combined
)
SELECT name, sp_attack, type, rank
FROM RankedPokemon
WHERE rank<= 3
ORDER BY type, rank;

-- SP Defense
WITH RankedPokemon AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY type ORDER BY sp_defense DESC) as rank
    FROM (
        SELECT type1 AS type, name, sp_defense FROM pokemon
        UNION ALL
        SELECT type2 AS type, name, sp_defense FROM pokemon WHERE type2 IS NOT NULL
    ) AS combined
)
SELECT name, sp_defense, type, rank
FROM RankedPokemon
WHERE rank<= 3
ORDER BY type, rank;

-- Speed
WITH RankedPokemon AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY type ORDER BY speed DESC) as rank
    FROM (
        SELECT type1 AS type, name, speed FROM pokemon
        UNION ALL
        SELECT type2 AS type, name, speed FROM pokemon WHERE type2 IS NOT NULL
    ) AS combined
)
SELECT name, speed, type, rank
FROM RankedPokemon
WHERE rank<= 3
ORDER BY type, rank;