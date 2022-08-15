/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals  where name like '%mon';
select name from animals where date_of_birth between '1/1/2016' and '1/1/2019';
select name from animals where neutered = '1' and escape_attempts < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name,escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = '1';
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select AVG(weight_kg) from animals;
select neutered,MAX(escape_attempts) from animals group by neutered;
select species,min(weight_kg), max(weight_kg) from animals group by species;
select species,avg(escape_attempts) from animals where date_of_birth between '/1/1/1990' and '1/1/2000' group by species;


-- What animals belong to Melody Pond?
SELECT a.name as dog_name,o.full_name as owner_name 
FROM animals a 
INNER JOIN  owners o ON a.owner_id = o.id;

-- List of all animals that are pokemon (their type is Pokemon).
SELECT a.name as dog_name,s.name as type 
FROM animals a 
INNER JOIN  species s ON a.species_id = s.id;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT a.name as dog_name,o.full_name as owner_name 
FROM animals a 
LEFT JOIN  owners o ON a.owner_id = o.id;

-- How many animals are there per species?
 SELECT count(*),s.name 
 FROM animals a 
 INNER JOIN  species s ON a.species_id = s.id group by s.id;
 
--  List all Digimon owned by Jennifer Orwell.
 SELECT a.name as dog_name,
        o.full_name as owner_name,
        s.name as dog_type
        FROM animals a
        INNER JOIN  owners o  ON a.owner_id = o.id 
        INNER JOIN  species s  ON a.species_id = s.id 
        where s.name = 'Digimon' 
        and o.full_name='Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name as dog_name, o.full_name as owner_name,a.escape_attempts
FROM animals a
INNER JOIN  owners o  ON a.owner_id = o.id 
WHERE a.escape_attempts = 0
AND o.full_name='Dean Winchester';

-- Who owns the most animals?
SELECT o.full_name
FROM animals a 
INNER JOIN  owners o ON a.owner_id = o.id
GROUP by o.full_name
ORDER by count(*) DESC
LIMIT 1;

-- Project Day 4
-- (1) Who was the last animal seen by William Tatcher? 
select  animals.name
from visits 
INNER JOIN animals ON  visits.animal_id  = animals.id
WHERE visits.date_of_visit = (
        select  MAX(visits.date_of_visit)
        from visits,vets,animals 
        where vets.id=visits.vet_id 
        and animals.id=visits.animal_id 
        and vets.name='William Tatcher');

-- (2) How many different animals did Stephanie Mendez see? 
 select   count(DISTINCT animals.name)
 from visits 
 inner join animals on animals.id = visits.animal_id 
 inner join vets on visits.vet_id = vets.id 
 where vets.name='Maisy Smith';

-- (3) List all vets and their specialties, including vets with no specialties. 
SELECT vets.name ,specializations.vet_id,species.name 
FROM specializations 
RIGHT JOIN vets ON vets.id=specializations.vet_id 
LEFT JOIN species ON species.id =specializations.species_id;

-- (4) List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. 
SELECT animals.name,visits.date_of_visit,vets.name 
FROM visits
INNER JOIN vets ON vets.id = visits.vet_id
INNER JOIN animals ON animals.id = visits.animal_id
WHERE visits.date_of_visit BETWEEN '4/1/2020' AND '8/30/2020'
AND vets.name = 'Stephanie Mendez';

-- (5) What animal has the most visits to vets?
SELECT animals.name,count(animals.name) as no_of_visit
FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER  BY no_of_visit DESC
LIMIT  1;

-- (6) Who was Maisy Smith's first visit? 
SELECT animals.name , visits.date_of_visit as visit_date
FROM   visits 
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER  BY visit_date DESC
LIMIT  1;


-- (7) Details for most recent visit: animal information, vet information, and date of visit.

SELECT animals.* , vets.* , visits.date_of_visit as visit_date
FROM visits
INNER JOIN animals ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
ORDER  BY visit_date DESC 
LIMIT  1;

-- (8) How many visits were with a vet that did not specialize in that animal's species?
select count(vets.name) from visits INNER JOIN vets ON visits.vet_id = vets.id 
where vets.name = (select vets.name as vet_name
from  specializations 
right join vets on  specializations.vet_id = vets.id 
where specializations.species_id is null);

-- (9) What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name FROM species
WHERE species.id = (
        SELECT MAX(animals.species_id) as animal_type
        FROM visits 
        INNER JOIN vets ON visits.vet_id = vets.id 
        INNER JOIN animals ON visits.animal_id = animals.id 
        where vets.name = (select vets.name as vet_name
                        from  specializations 
                        right join vets on  specializations.vet_id = vets.id 
                        where specializations.species_id is null)
);