/* Populate database with sample data. */


INSERT INTO  animals(name,date_of_birth,escape_attempts, neutered , weight_kg) VALUES('Agumon', 'Feb 03 2020',0, true, 10.23);
INSERT INTO  animals(name,date_of_birth,escape_attempts, neutered , weight_kg) VALUES('Gabumon', 'Nov 15 2018',2, true, 8);
INSERT INTO  animals(name,date_of_birth,escape_attempts, neutered , weight_kg) VALUES('Pikachu', 'Jan 7 2021',1, false, 15.04);
INSERT INTO  animals(name,date_of_birth,escape_attempts, neutered , weight_kg) VALUES('Devimon', 'May 12 2017',5, true, 11);

INSERT INTO  animals(name,date_of_birth,escape_attempts, neutered , weight_kg) VALUES('Charmander', 'Feb 08 2020',0, false, 11),
('Plantmon', 'Nov 15 2021',2, true, 5.7),
('Squirtle', 'Apr 02 1993',3, false, 12.13),
('Angemon', 'Jun 12 2005',1, true, 45), 
('Boarmon', 'Jun 07 2005',7, true, 20.4),
('Blossom', 'Oct 13 1998',3, true, 17),
('Ditto', 'May 14 2022',4, true, 22);


-- insert data into owners table
INSERT INTO  owners(full_name, age) VALUES('Sam Smith ', 34), ('Jennifer Orwell', 19 ),
('Bob', 45 ),('Melody Pond', 77 ),('Dean Winchester', 14 ),('Jodie Whittaker', 38 );

-- insert data for species

INSERT INTO  species(name) VALUES('Pokemon'), ('Digimon');

-- Modify your inserted animals so it includes the species_id value

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') 

WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') 
WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id)
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Sam Smith'
    )
WHERE name = 'Agumon';
UPDATE 1

SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Jennifer Orwell'
    )
WHERE name = 'Gabumon';
UPDATE 1

SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Bob'
    )
WHERE name = 'Plantmon' AND 'Devimon';


 UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Bob'
    )
                              ^
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Bob'
    )
WHERE name = 'Plantmon' OR name= 'Devimon';

UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Melody Pond'
    )
WHERE name = 'Charmander' OR name= 'Squirtle' OR name = 'Blossom';

 UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Dean Winchester'
    )
WHERE name = 'Angemon' OR name= 'Boarmon';

UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Jennifer Orwell'
    )
WHERE name = 'Pikachu';
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Sam Smith '
    )
WHERE name = 'Agumon';
SELECT * FROM animals;

-- insert data into vets table

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('Vet William Tatcher', 45, 'Apr 23 2000'),
('Vet Maisy Smith', 26 ,'Jan 17 2019'),
('Vet Stephanie Mendez', 64, 'May 04 1981'),
('Vet Jack Harkness', 38,'Jun 08 2008');

-- insert data into specializations

INSERT INTO specializations(species_id, vets_id)
VALUES ( (
            SELECT id
            FROM species
            WHERE name = 'Pokemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        )
        ),

        (
          (
  SELECT id
  FROM species
  WHERE name = 'Digimon'
    OR name = 'Pokemon'
),
(
  SELECT id
  FROM vets
  WHERE name = 'Vet Stephanie Mendez'
)
),

( (
            SELECT id
            FROM species
            WHERE name = 'Digimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Vet Jack Harkness'
        )
        );

-- insert data into visit table 

INSERT INTO visits(animals_id, vets_id, date_of_visit)
VALUES(
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        '2020-06-24'
    ),
     (
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2020-07-22'
    ),
    -- Pikachu visited Maisy Smith on Jan 5th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-01-05'
    ),
    -- Gabumon visited Jack Harkness on Feb 2nd, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Gabumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2021-02-02'
    ),
    -- Pikachu visited Maisy Smith on Mar 8th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-03-08'
    ),
    -- Pikachu visited Maisy Smith on May 14th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-06-14'
    ),
    -- Devimon visited Stephanie Mendez on May 4th, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Devimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2021-06-04'
    ),
    -- Charmander visited Jack Harkness on Feb 24th, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Charmander'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2021-02-24'
    ),
    -- Plantmon visited Maisy Smith on Dec 21st, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2019-12-21'
    ),
    -- Plantmon visited William Tatcher on Aug 10th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        '2020-09-10'
    ),
    -- Plantmon visited Maisy Smith on Apr 7th, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2021-04-17'
    ),
    -- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Squirtle'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2019-09-29'
    ),
    -- Angemon visited Jack Harkness on Oct 3rd, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2020-10-03'
    ),
    -- Angemon visited Jack Harkness on Nov 4th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2020-11-04'
    ),
    -- Boarmon visited Maisy Smith on Jan 24th, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2019-01-24'
    ),
    -- Boarmon visited Maisy Smith on May 15th, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2019-06-15'
    ),
    -- Boarmon visited Maisy Smith on Feb 27th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-02-27'
    ),
    -- Boarmon visited Maisy Smith on Aug 3rd, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-09-03'
    ),
  
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2020-06-24'
    ),

    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        '2021-01-11'
    ); 






