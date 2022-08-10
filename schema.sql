CREATE TABLE animals ( ID int, Name varchar(100), Date_of_birth date, Escape_attempts int, Neutered boolean, Weight_kg decimal );

ALTER TABLE table_name ADD PRIMARY KEY (column_name);

ALTER TABLE animals DROP COLUMN ID; -----> deletes a specific column(ID)

ALTER TABLE animals ADD ID SERIAL PRIMARY KEY;

ALTER DATABASE vet_clinic DROP TABLE animals; ------> deletes the database's table animals

ALTER TABLE animals 