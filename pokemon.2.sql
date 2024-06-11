-- The whole table 
SELECT * FROM pokemon;

-- Count the number of pokemons in each generation
SELECT generation, COUNT(*) FROM pokemon GROUP BY generation
ORDER BY generation;

-- Count the number of pokemon in each type 
SELECT type, COUNT(*) FROM (
	SELECT type1 AS type, * FROM pokemon
	UNION ALL
	SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
GROUP BY type
ORDER BY type;

-- Count the number of legendary and non-legendary pokemons 
SELECT legendary, COUNT(*) FROM pokemon GROUP BY legendary;

-- Show the minimum and maximum value for each stats attribute
SELECT MIN(total) AS total_min, MAX(total) AS total_max,
MIN(hp) AS hp_min, MAX(hp) AS hp_max,
MIN(attack) AS attack_min, MAX(attack) AS attack_max,
MIN(defense) AS defense_min, MAX(defense) AS defense_max,
MIN(sp_attack) AS sp_attack_min, MAX(sp_attack) AS sp_attack_max,
MIN(sp_defense) AS sp_defense_min, MAX(sp_defense) AS sp_defense_max,
MIN(speed) AS speed_min, MAX(speed) AS speed_max FROM pokemon;

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
-- attack
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY attack DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- defense 
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY defense DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- special attack
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY sp_attack DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- special defense
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY sp_defense DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- hp
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY hp DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- speed
SELECT * FROM (
	SELECT *,
	DENSE_RANK() OVER(ORDER BY speed DESC) as rank 
	FROM pokemon
) as t
WHERE t.rank <= 5;

-- Show top pokemons from each type for each stats
-- (highest to 3rd highest)

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


-- average stats of legendary vs non-legendary
SELECT legendary, ROUND(AVG(total), 2) AS avg_total, 
ROUND(AVG(hp), 2) AS avg_hp, 
ROUND(AVG(attack), 2) AS avg_attack, 
ROUND(AVG(defense), 2) AS avg_defense, 
ROUND(AVG(sp_attack), 2) AS avg_sp_attack, 
ROUND(AVG(sp_defense), 2) AS avg_sp_defense, 
ROUND(AVG(speed), 2) AS avg_speed 
FROM pokemon
GROUP BY legendary;
-- Legendary pokemons have higher average for all stats
-- Are they statistically significantly different? -> Run tests on R


-- average stats for each type
SELECT type, ROUND(AVG(total), 2) AS avg_total, 
ROUND(AVG(hp), 2) AS avg_hp, 
ROUND(AVG(attack), 2) AS avg_attack, 
ROUND(AVG(defense), 2) AS avg_defense, 
ROUND(AVG(sp_attack), 2) AS avg_sp_attack, 
ROUND(AVG(sp_defense), 2) AS avg_sp_defense, 
ROUND(AVG(speed), 2) AS avg_speed 
FROM(
	SELECT type1 AS type, * FROM pokemon
	UNION ALL
	SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
) 
GROUP BY type;

-- Explore each generation
SELECT generation, COUNT(*) FROM pokemon
GROUP BY generation
ORDER BY generation ASC;

-- Generation 1
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '1'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '1'
GROUP BY type
ORDER BY COUNT DESC;

-- Generation 2
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '2'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '2'
GROUP BY type
ORDER BY COUNT DESC;

-- Generation 3
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '3'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '3'
GROUP BY type
ORDER BY COUNT DESC;

-- Generation 4
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '4'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '4'
GROUP BY type
ORDER BY COUNT DESC;

-- Generation 5
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '5'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '5'
GROUP BY type
ORDER BY COUNT DESC;

-- Generation 6
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '6'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '6'
GROUP BY type
ORDER BY COUNT DESC;

-- Generation 7
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '7'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '7'
GROUP BY type
ORDER BY COUNT DESC;

-- Generation 8
SELECT type1, type2, COUNT(*) FROM pokemon
WHERE generation = '8'
GROUP BY type1, type2
ORDER BY type1, type2;

SELECT type, COUNT(*) FROM (
    SELECT type1 AS type, * FROM pokemon
    UNION
    SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
WHERE generation = '8'
GROUP BY type
ORDER BY COUNT DESC;
