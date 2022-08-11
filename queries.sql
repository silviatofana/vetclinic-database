ALTER TABLE animals DROP COLUMN ID; -----> deletes a specific column(ID)

ALTER TABLE animals ADD ID SERIAL PRIMARY KEY;

ALTER TABLE animals 

UPDATE animals SET Species = 'Unspecified'; ----> sets all the species column valuesf to unspecified

UPDATE animals SET Neutered = 'false' WHERE Name = 'Squirtle'; 

UPDATE animals SET Date_of_birth = '2005-06-12' WHERE Name = 'Angemon';

UPDATE animals SET Neutered = 'false' WHERE Name = 'Pikachu'; -----> this is a request

UPDATE animals SET Species = 'digimon' WHERE Name like '%mon'; ----> Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.

UPDATE animals SET Species = 'pokemon' WHERE Species = 'Unspecified'; ----> Update the animals table by setting the species column to pokemon for all animals that don't have species already set.

UPDATE animals SET Weight_kg = Weight_kg * -1;

UPDATE animals SET Weight_kg = Weight_kg * -1 WHERE Weight_kg < 0 ;

SELECT * FROM animals; ---> to check whether the updated item changed or not

SELECT * FROM animals WHERE Name like '%mon';

SELECT Name FROM animals WHERE Date_of_birth >= '2016-01-01' AND Date_of_birth <= '2019-12-31';

SELECT Name FROM animals WHERE Escape_attempts < 3 AND Neutered = 'true';

SELECT Date_of_birth FROM animals WHERE Name = 'Agumon' OR Name = 'Pikachu';

SELECT Name, Escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE Neutered;

SELECT * FROM animals WHERE Name != 'Gabumon'; 

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;

SAVEPOINT save_point;

DELETE  FROM animals; ------> deletes the animals rows

DELETE FROM animals WHERE Date_of_birth > '2022-01-01';

SELECT COUNT(*) AS Number_of_animals FROM animals;

SELECT COUNT( Escape_attempts ) AS Kind_animals FROM animals WHERE Escape_attempts = 0;

SELECT AVG( weight_kg ) AS Weight_avg FROM animals;

SELECT Name, Escape_attempts, Neutered FROM animals WHERE Escape_attempts = ( SELECT MAX(Escape_attempts) FROM animals );

SELECT Name, weight_kg FROM animals WHERE weight_kg = ( SELECT MAX(weight_kg) FROM animals ) AND weight_kg = ( SELECT MIN(weight_kg) FROM animals );

SELECT AVG( Escape_attempts ) AS escape_Average FROM animals WHERE Date_of_birth >= '1990-01-01' AND Date_of_birth <= '2000-01-01';