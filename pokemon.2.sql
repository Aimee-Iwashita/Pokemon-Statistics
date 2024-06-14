-- The whole table 
SELECT * FROM pokemon;

-- How many pokemons are in this dataset?
SELECT COUNT(*) FROM pokemon

-- Count the number of pokemons in each generation
SELECT generation, COUNT(*) FROM pokemon GROUP BY generation
ORDER BY generation;

-- Count the number of pokemon in each type 
SELECT type, COUNT(*) AS count FROM (
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
