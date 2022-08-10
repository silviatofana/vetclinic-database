/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id            INT GENERATED ALWAYS AS IDENTITY,
  name    VARCHAR(250), date_of_birth date, 
  escape_attempts INT, 
  neutered boolean, 
  weight_kg decimal,
  species VARCHAR(250),
  PRIMARY KEY(id),
);

-- Add species table
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(250)
);
--add species table
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(250),
  age INT
);


-- Remove column species
 ALTER TABLE animals DROP COLUMN species;
SELECT * FROM animals;
-- ADD COLUMN SPECIES
 ALTER TABLE animals ADD species_id INT;
SELECT * FROM animals;
-- ADD COLUMN OWNER_ID
 ALTER TABLE animals ADD owner_id INT;

-- set constraint for primary key species_id
 ALTER TABLE animals ADD CONSTRAINT fk_species_table FOREIGN KEY(species_id) REFERENCES species(id);
 -- set constraint for primary key own-id
ALTER TABLE animals ADD CONSTRAINT fk_owner_table FOREIGN KEY(owner_id) REFERENCES owners(id);

-- create vets table

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(250),
  age INT,
  date_of_graduation DATE
);
-- create specializations table
CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
-- create visits table
CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  animals_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT fk_visit_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
  CONSTRAINT fk_visits_vet FOREIGN KEY(vets_id) REFERENCES vets(id)
);