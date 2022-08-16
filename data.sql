-----ANIMALS TABLE-----
INSERT INTO animals (ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg ) 
VALUES (1 ,'Agumon', '2020-02-03', 0, 'true', '10.23');

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg )
VALUES ( 2, 'Gabumon', '2018-11-15', 2, 'true', '8' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg )
VALUES ( 3, 'Pikachu', '2021-01-7', 1, 'true', '15.04' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg )
VALUES ( 4, 'Devimon', '2017-05-12', 5, 'true', '1' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg,Species )
VALUES ( 5, 'Charmander', '2020-02-08', 0, 'false', '-11', 'Unspecified' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg,Species )
VALUES ( 6, 'Plantmon', '2021-11-15', 2, 'true', '-5.7', 'Unspecified' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg,Species )
VALUES ( 7, 'Squirtle', '1993-04-02', 3, 'true', '-12.13', 'Unspecified' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg,Species )
VALUES ( 8, 'Angemon', '2005-06-12', 1, 'true', '-45', '' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg,Species )
VALUES ( 9, 'Boarmon', '2005-01-07', 7, 'true', '20.4', '' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg,Species )
VALUES ( 10, 'Blossom', '1998-10-13', 3, 'true', '17', '' );

INSERT INTO animals ( ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg,Species )
VALUES ( 11, 'Ditto', '2022-05-14', 4, 'true', '22', '' );

UPDATE animals SET Species = 'Unspecified'; ----> sets all the species column valuesf to unspecified

UPDATE animals SET Neutered = 'false' WHERE Name = 'Squirtle'; 

UPDATE animals SET Date_of_birth = '2005-06-12' WHERE Name = 'Angemon';

UPDATE animals SET Neutered = 'false' WHERE Name = 'Pikachu'; -----> this is a request

UPDATE animals SET Species = 'digimon' WHERE Name like '%mon'; ----> Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.

UPDATE animals SET Species = 'pokemon' WHERE Species = 'Unspecified'; ----> Update the animals table by setting the species column to pokemon for all animals that don't have species already set.

UPDATE animals SET Weight_kg = Weight_kg * -1;

UPDATE animals SET Weight_kg = Weight_kg * -1 WHERE Weight_kg < 0 ;

UPDATE animals SET species_id = 'Unspecified';

UPDATE animals SET species_id = 'digimon' WHERE Name like '%mon';

UPDATE animals SET species_id = 'pokemon' WHERE species_id = 'Unspecified';

UPDATE animals SET owner_id = 'Sam Smith' WHERE name = 'Agumon';
UPDATE animals SET owner_id = 'Sam Smith' WHERE name = 'Agumon';
UPDATE animals SET owner_id = 'Jennifer Orwell' WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 'Jennifer Orwell' WHERE name = 'Pikachu';
UPDATE animals SET owner_id = 'Bob' WHERE name = 'Devimon';
UPDATE animals SET owner_id = 'Bob' WHERE name = 'Plantmon';
UPDATE animals SET owner_id = 'Melody Pond' WHERE name = 'Charmander';
UPDATE animals SET owner_id = 'Melody Pond' WHERE name = 'Squirtle';
UPDATE animals SET owner_id = 'Melody Pond' WHERE name = 'Blossom';
UPDATE animals SET owner_id = 'Dean Winchester' WHERE name = 'Angemon';
UPDATE animals SET owner_id = 'Dean Winchester' WHERE name = 'Boarmon';



-----OWNERS TABLE-----
INSERT INTO owner ( ID, Full_name, Age )
VALUES ( 1, 'Sam Smith', 34 );

INSERT INTO owner ( ID, Full_name, Age )
VALUES ( 2, 'Jennifer Orwell', 19 );

INSERT INTO owner ( ID, Full_name, Age )
VALUES ( 3, 'Bob', 45 );

INSERT INTO owner ( ID, Full_name, Age )
VALUES ( 4, 'Melody Pond', 77 );

INSERT INTO owner ( ID, Full_name, Age )
VALUES ( 5, 'Dean Winchester', 14 );

INSERT INTO owner ( ID, Full_name, Age )
VALUES ( 6, 'Jodie Whittaker', 38 );

-----SPECIES-----
INSERT INTO species ( ID, Name )
VALUES ( 1, 'Pokemon' );

INSERT INTO species ( ID, Name )
VALUES ( 2, 'Digimon' );
SELECT COUNT(*) FROM animals WHERE species_id = 'Pokemon';
SELECT COUNT(*) FROM animals WHERE species_id = 'Digimon';




INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('William Tatcher', 45, '2000-4-23');

INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_name, species) 
VALUES ('William Tatcher', 'Pokemon');

INSERT INTO specializations (vet_name, species) 
VALUES ('Stephanie Mendez', 'Pokemon');

INSERT INTO specializations (vet_name, species) 
VALUES ('Stephanie Mendez', 'Digimon');

INSERT INTO specializations (vet_name, species) 
VALUES ('Jack Harkness', 'Digimon');


INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Agumon', 'William Tatcher', '2020-5-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Agumon', 'William Tatcher', '2020-7-22');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Gabumon', 'Jack Harkness', '2021-7-2');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Pikachu', 'Maisy Smith', '2020-1-5');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Pikachu', 'Maisy Smith', '2020-3-8');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Pikachu', 'Maisy Smith', '2020-5-14');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Devimon', 'Stephanie Mendez', '2021-5-4');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Charmander', 'Jack Harkness', '2021-2-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Plantmon', 'Maisy Smith', '2019-12-21');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Plantmon', 'William Tatcher', '2020-8-10');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Plantmon', 'Maisy Smith', '2021-4-7');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Squirtle', 'Stephanie Mendez', '2019-9-29');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Angemon', 'Jack Harkness', '2020-10-3');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Angemon', 'Jack Harkness', '2020-11-4');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Angemon', 'Jack Harkness', '2020-11-4');
INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('William Tatcher', 45, '2000-4-23');

INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('Maisy Smith', 26, '2019-01-17');

INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('Stephanie Mendez', 64, '1981-05-04');

INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_name, species) 
VALUES ('William Tatcher', 'Pokemon');

INSERT INTO specializations (vet_name, species) 
VALUES ('Stephanie Mendez', 'Pokemon');

INSERT INTO specializations (vet_name, species) 
VALUES ('Stephanie Mendez', 'Digimon');

INSERT INTO specializations (vet_name, species) 
VALUES ('Jack Harkness', 'Digimon');


INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Agumon', 'William Tatcher', '2020-5-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Agumon', 'William Tatcher', '2020-7-22');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Gabumon', 'Jack Harkness', '2021-7-2');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Pikachu', 'Maisy Smith', '2020-1-5');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Pikachu', 'Maisy Smith', '2020-3-8');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Pikachu', 'Maisy Smith', '2020-5-14');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Devimon', 'Stephanie Mendez', '2021-5-4');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Charmander', 'Jack Harkness', '2021-2-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Plantmon', 'Maisy Smith', '2019-12-21');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Plantmon', 'William Tatcher', '2020-8-10');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Plantmon', 'Maisy Smith', '2021-4-7');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Squirtle', 'Stephanie Mendez', '2019-9-29');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Angemon', 'Jack Harkness', '2020-10-3');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Angemon', 'Jack Harkness', '2020-11-4');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Angemon', 'Jack Harkness', '2020-11-4');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2019-1-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2019-5-15');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2020-2-27');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2020-8-3');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Blossom', 'Stephanie Mendez', '2020-5-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Blossom', 'William Tatcher', '2021-1-11');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2019-1-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2019-5-15');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2020-2-27');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Boarmon', 'Maisy Smith', '2020-8-3');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Blossom', 'Stephanie Mendez', '2020-5-24');

INSERT INTO visits (animal, vet, visit_date) 
VALUES ('Blossom', 'William Tatcher', '2021-1-11');
