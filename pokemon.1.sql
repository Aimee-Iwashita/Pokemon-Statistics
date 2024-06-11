-- Create table to store the data
CREATE TABLE pokemon (number int NOT NULL, 
					  name text NOT NULL,
					  type1 text NOT NULL,
					  type2 text,
					  total numeric NOT NULL,
					  hp numeric NOT NULL,
					  attack numeric NOT NULL,
					  defense numeric NOT NULL,
					  sp_attack numeric NOT NULL,
					  sp_defense numeric NOT NULL,
					  speed numeric NOT NULL,
					  generation int NOT NULL,
					  legendary boolean NOT NULL
					 )

-- csv uplaoded to the table in pgdmin4

-- Check if there is any NULL in any of the columns other than type 2
SELECT * FROM pokemon
WHERE name IS NULL OR 
type1 IS NULL OR 
total IS NULL OR 
hp IS NULL OR
attack IS NULL OR
defense IS NULL OR
sp_attack IS NULL OR
sp_defense IS NULL OR
speed IS NULL OR
generation IS NULL OR
legendary IS NULL;

-- check the pokemon types
SELECT DISTINCT type1 FROM pokemon;
SELECT DISTINCT type2 FROM pokemon;

-- type1 contains Blastoise which is NOT a type 
SELECT * FROM pokemon WHERE type1 = 'Blastoise';

-- Gigantamax Blasoise is water type only so we will update the data 
UPDATE pokemon SET type1 = 'Water', type2 = null WHERE name = 'Gigantamax Blasoise';
SELECT * FROM pokemon WHERE name = 'Gigantamax Blasoise';

-- Check generations
SELECT DISTINCT generation FROM pokemon;

-- There are 3 pokemons in generation 0 (This is a mistake as there is no generation 0)
SELECT * FROM pokemon WHERE generation = 0;

-- These are all generation 7s so update the table 
UPDATE pokemon SET generation = 7 WHERE generation = 0;
SELECT * FROM pokemon WHERE name = 'Meltan' OR name = 'Melmetal' OR name = 'Gigantamax Melmetal';

-- Check pokemon types
SELECT DISTINCT type FROM (
	SELECT type1 AS type, * FROM pokemon
	UNION ALL
	SELECT type2 AS type, * FROM pokemon WHERE type2 IS NOT NULL
)
ORDER BY type;

-- There is a typo 'Graass'
SELECT * FROM pokemon WHERE type1 = 'Graass' OR type2 = 'Graass';

-- Fix the typo
UPDATE pokemon SET type1 = 'Grass' WHERE type1 = 'Graass';
SELECT * FROM pokemon WHERE name = 'Eldegoss';
