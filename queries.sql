/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >='2016-01-01' and date_of_birth<='2019-12-31';
SELECT  name FROM animals WHERE  neutered = 'true' and escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu' ;
SELECT name, escape_attempts FROM animals WHERE  weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon' ; 
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/*TRANSCTION DONE HERE*/

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

 UPDATE animals SET species = 'pokemon' WHERE species IS null;
 SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT saved_point;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO saved_point;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

/*AGGREGATE*/

/*How many animals are there*/
SELECT COUNT(*) FROM animals;

/*How many animals have never tried to escape*/
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/*What is the average weight of animals*/
SELECT AVG(weight_kg) FROM animals;

/*Who escapes the most, neutered or not neutered animals*/
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

/*What is the minimum and maximum weight of each type of animal*/
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000*/
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

--  Write queries (using JOIN) to answer

SELECT name,
  full_name
FROM animals
  JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';



SELECT name AS Animals,
    full_name AS Owners
FROM animals
    RIGHT JOIN owners ON animals.owner_id = owners.id;

SELECT COUNT(animals.name) AS Animals_count,
    species.name AS Specie
FROM animals
    JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT owners.full_name,
    animals.name AS name_of_animals,
    species.name AS name_of_species
FROM animals
    JOIN owners ON owners.id = animals.owner_id
    JOIN species ON species.id = animals.species_id
WHERE owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

SELECT name,
    escape_attempts,
    full_name
FROM animals
    JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

SELECT full_name,
    COUNT(animals.owner_id) AS Owns
FROM owners
    JOIN animals ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY Owns DESC;

