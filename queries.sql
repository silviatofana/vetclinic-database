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

SELECT animals.owner_id FROM animals INNER JOIN owner ON animals.owner_id = owner.full_name GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1;





SELECT animals.name, visits.vet, visits.visit_date FROM animals INNER JOIN visits ON visits.animal = animals.name WHERE visits.vet = 'William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(*) FROM visits WHERE vet = 'Stephanie Mendez'; 

SELECT specializations.vet_name, specializations.species FROM visits INNER JOIN specializations ON specializations.vet_name = visits.vet WHERE vet = 'William Tatcher';

SELECT specializations.vet_name, specializations.species FROM visits INNER JOIN specializations ON specializations.vet_name = visits.vet WHERE vet = 'Jack Harkness';

SELECT specializations.vet_name, specializations.species FROM visits INNER JOIN specializations ON specializations.vet_name = visits.vet WHERE vet = 'Stephanie Mendez';

SELECT animals.name, visits.vet, visits.visit_date FROM animals INNER JOIN visits ON visits.animal = animals.name WHERE visits.vet = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-4-1' AND '2020-8-30';

SELECT animal FROM visits GROUP BY animal ORDER BY COUNT(*) DESC LIMIT 1;

SELECT animals.name, visits.vet, visits.visit_date FROM animals INNER JOIN visits ON visits.animal = animals.name ORDER BY visits.visit_date LIMIT 1;

SELECT COUNT(*) FROM visits INNER JOIN specializations ON specializations.vet_name = visits.vet WHERE species = 'Pokemon' AND animal NOT LIKE '%mon';

SELECT * FROM visits GROUP BY animal ORDER BY COUNT(*) DESC LIMIT 1;

----INNER JOIN-----

SELECT owner.full_name, animals.name FROM animals INNER JOIN owner ON owner.id = animals.owner_id WHERE owner.full_name='Melody Pond';
SELECT species.name, animals.name FROM animals INNER JOIN species ON species.id = animals.species_id WHERE species.name='Pokemon';
SELECT owner.full_name, animals.name FROM animals INNER JOIN owner ON owner.full_name = animals.owner_id;

