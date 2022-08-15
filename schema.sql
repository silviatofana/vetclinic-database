/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
postgres=# \c vet_clinic
CREATE TABLE animals(
    id bigserial PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BIT,
    weight_kg REAL,
    COLUMN owner_id INT);

ALTER TABLE animals ADD COLUMN species VARCHAR(30);

CREATE TABLE owners (
    id bigserial PRIMARY KEY,
    full_name varchar(50) NOT NULL,
    age INT);

CREATE TABLE species (
 id INT PRIMARY KEY,
 name varchar(50) NOT NULL);

ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species_animal FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD CONSTRAINT fk_owner_animal FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
    id bigserial primary key,
    name varchar(50) NOT NULL,
    age INT,
    date_of_graduation DATE);

CREATE TABLE specializations (
    vet_id INT,
    species_id INT);
ALTER TABLE specializations ADD CONSTRAINT fk_species_animal FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE specializations ADD CONSTRAINT fk_owner_animal FOREIGN KEY (vet_id) REFERENCES vets (id);

CREATE TABLE visits (
    animal_id INT,
    vet_id INT,
    date_of_visit DATE);
ALTER TABLE visits ADD CONSTRAINT fk_species_visits FOREIGN KEY (animal_id) REFERENCES animals (id);
ALTER TABLE visits ADD CONSTRAINT fk_owner_visits FOREIGN KEY (vet_id) REFERENCES vets (id);

-- Performance Audit
ALTER TABLE owners ADD COLUMN email VARCHAR(120);