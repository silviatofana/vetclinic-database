/* Populate database with sample data. */
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', '2/3/2020', 0, '1', 10.23);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Gabumon', '11/15/2018', 2, '1', 8);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Pikachu', '7/1/2021', 1, '0', 15.04);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Devimon', '5/12/2018', 5, '1', 11);

-- add new data
INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Charmander', '2/8/2020', 5, '0', 11);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Plantmon', '11/15/2021', 2, '1', 5.7);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Squirtle', '4/2/1993', 3, '0', 12.13);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Angemon', '6/12/2005', 1, '1', 45);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Boarmon', '6/7/2005', 7, '1', 20.4);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Blossom', '10/13/1998', 3, '1', 17);

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Ditto', '5/14/2022', 4, '1', 22);

begin
update
    animals
set
    species = 'unspecified';

select
    *
from
    animals;

ROLLBACK;

select
    *
from
    animals;

begin;

update
    animals
set
    species = 'digimon'
where
    name like '%mon';

update
    animals
set
    species = 'pokemon'
where
    species = '';

commit;

select
    *
from
    animals;

insert INTO
    owners (full_name, age)
VALUES
    ('Sam Smith', 34);

insert INTO
    owners (full_name, age)
VALUES
    ('Jennifer Orwell', 19);

insert INTO
    owners (full_name, age)
VALUES
    ('Bob', 45);

insert INTO
    owners (full_name, age)
VALUES
    ('Melofy Pond', 77);

insert INTO
    owners (full_name, age)
VALUES
    ('Dean Winchester', 14);

insert INTO
    owners (full_name, age)
VALUES
    ('Jodie Whittaker', 38);

insert INTO
    species (name)
VALUES
    ('Pokemin');

insert INTO
    species (name)
VALUES
    ('Digimon');

update
    animals
set
    species_id = 2
where
    name like '%mon';

update
    animals
set
    species_id = 1
where
    species_id is null;

update
    animals
set
    owner_id = 1
where
    id = 3;

update
    animals
set
    owner_id = 2
where
    id = 5;

update
    animals
set
    owner_id = 3
where
    id = 6
    OR id = 8;

update
    animals
set
    owner_id = 4
where
    id = 7
    OR id = 9
    OR id = 12;

update
    animals
set
    owner_id = 5
where
    id = 3
    OR id = 11;

-- insert into vets table
insert INTO
    vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '5/23/2000');

insert INTO
    vets (name, age, date_of_graduation)
VALUES
    ('Maisy Smith', 26, '6/17/2019');

insert INTO
    vets (name, age, date_of_graduation)
VALUES
    ('Stephanie Mendez', 64, '4/5/1981');

insert INTO
    vets (name, age, date_of_graduation)
VALUES
    ('Jack Harkness', 38, '6/8/2008');

-- insert into specializations 
insert INTO
    specializations (vet_id, species_id)
VALUES
    (1, 1);

insert INTO
    specializations (vet_id, species_id)
VALUES
    (3, 1);

insert INTO
    specializations (vet_id, species_id)
VALUES
    (3, 2);

insert INTO
    specializations (vet_id, species_id)
VALUES
    (4, 2);

-- insert into visits
insert INTO
    visits
VALUES
    (3, 1, '5/24/2020');

insert INTO
    visits
VALUES
    (3, 3, '7/22/2020');

insert INTO
    visits
VALUES
    (4, 4, '2/2/2021');

insert INTO
    visits
VALUES
    (5, 2, '1/5/2020');

insert INTO
    visits
VALUES
    (5, 2, '3/8/2020');

insert INTO
    visits
VALUES
    (5, 2, '5/14/2020');

insert INTO
    visits
VALUES
    (6, 3, '5/4/2021');

insert INTO
    visits
VALUES
    (7, 4, '2/24/2021');

insert INTO
    visits
VALUES
    (8, 2, '11/21/2019');

insert INTO
    visits
VALUES
    (8, 1, '8/10/2020');

insert INTO
    visits
VALUES
    (8, 2, '4/7/2021');

insert INTO
    visits
VALUES
    (9, 3, '9/29/2019');

insert INTO
    visits
VALUES
    (10, 4, '10/3/2020');

insert INTO
    visits
VALUES
    (10, 4, '12/4/2020');

insert INTO
    visits
VALUES
    (11, 2, '1/24/2019');

insert INTO
    visits
VALUES
    (11, 2, '5/15/2019');

insert INTO
    visits
VALUES
    (11, 2, '2/27/2020');

insert INTO
    visits
VALUES
    (11, 2, '8/3/2020');

insert INTO
    visits
VALUES
    (12, 3, '5/24/2020');

insert INTO
    visits
VALUES
    (12, 1, '1/11/2021');

-- Performance Audit 
INSERT INTO
    visits (animal_id, vet_id, date_of_visit)
SELECT
    *
FROM
    (
        SELECT
            id
        FROM
            animals
    ) animal_ids,
    (
        SELECT
            id
        FROM
            vets
    ) vets_ids,
    generate_series('1980-01-01' :: timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into
    owners (full_name, email)
select
    'Owner ' || generate_series(1, 2500000),
    'owner_' || generate_series(1, 2500000) || '@mail.com';





