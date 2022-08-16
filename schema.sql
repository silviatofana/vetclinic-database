-----ANIMALS TABLE-----
CREATE TABLE animals ( ID int, Name varchar(100), Date_of_birth date, Escape_attempts int, Neutered boolean, Weight_kg decimal );

ALTER TABLE animals DROP COLUMN ID; -----> deletes a specific column(ID)
ALTER TABLE animals ADD ID SERIAL PRIMARY KEY;

ALTER TABLE animals ADD Species varchar(100);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id varchar(100);
ALTER TABLE species  ADD CONSTRAINT ID INT FOREIGN KEY ( name ) REFERENCES animals(species_id);
ALTER TABLE owner  ADD CONSTRAINT ID INT FOREIGN KEY ( full_name ) REFERENCES animals(owner_id);


-----OWNER TABLE----
CREATE TABLE owner ( ID int, Full_name varchar(100), Age int, PRIMARY KEY (ID)  );

-----SPICIES TABLE-----
CREATE TABLE species ( ID INT, Name VARCHAR(100), PRIMARY KEY (ID));
ALTER TABLE species DROP COLUMN ID;
ALTER TABLE species ADD ID SERIAL PRIMARY KEY;


CREATE TABLE vets (id SERIAL PRIMARY KEY, name varchar(100), age int, date_of_graduation date);

CREATE TABLE specializations (id SERIAL PRIMARY KEY, vet_name varchar(100));
ALTER TABLE specializations ADD species varchar(100);

CREATE TABLE visits (id SERIAL PRIMARY KEY, animal varchar(100), vet varchar(100), visit_date date, animals_id INT, vets_id, CONSTRAINT fk_visit_animals FOREIGN KEY(animals_id) REFERENCES animals(ID), CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) );

ALTER TABLE animals ADD vet_id varchar(100);

-- data to insert inorder to achieve perfomance


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


-- the query to checktime execution
explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;


-- the query to deacrease time firts i creacted the index 
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
CREATE INDEX animals_animals_id_desc ON visits(animals_id DESC);


-- the queries to improve execution time.
CREATE INDEX vet_index ON visits(vet_id);
explain analyze SELECT * FROM visits
WHERE vet_id = 2;
CREATE INDEX email_desc ON owners(email DESC);
explain analyze SELECT * FROM owners
WHERE email = 'owner_18327@mail.com';
