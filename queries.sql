UPDATE animals SET Species = 'Unspecified'; ----> sets all the species column valuesf to unspecified

UPDATE animals SET Neutered = 'false' WHERE Name = 'Squirtle'; 

UPDATE animals SET Date_of_birth = '2005-06-12' WHERE Name = 'Angemon';

UPDATE animals SET Neutered = 'false' WHERE Name = 'Pikachu'; -----> this is a request

UPDATE animals SET Species = 'digimon' WHERE Name like '%mon'; ----> Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.

UPDATE animals SET Species = 'pokemon' WHERE Species = 'unspecified'; ----> Update the animals table by setting the species column to pokemon for all animals that don't have species already set.

SELECT * FROM animals; ---> to check whether the updated item changed or not

SELECT * FROM animals WHERE Name like '%mon';

SELECT Name FROM animals WHERE Date_of_birth >= '2016-01-01' AND Date_of_birth <= '2019-12-31';

SELECT Name FROM animals WHERE Escape_attempts < 3 AND Neutered = 'true';

SELECT Date_of_birth FROM animals WHERE Name = 'Agumon' OR Name = 'Pikachu';

SELECT Name, Escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE Neutered;

SELECT * FROM animals WHERE Name != 'Gabumon'; 

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3