CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY, -- auto-incrementing primary key
    name VARCHAR NOT NULL UNIQUE, -- unique name
    size_in_km INT NOT NULL, -- size of the galaxy in kilometers
    distance_from_earth NUMERIC(10, 2), -- distance from Earth, using NUMERIC
    has_life BOOLEAN NOT NULL, -- whether life exists
    gaseous BOOLEAN -- whether it's a gaseous galaxy
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY, -- auto-incrementing primary key
    name VARCHAR NOT NULL UNIQUE, -- unique name
    size_in_km INT NOT NULL, -- size of the star in kilometers
    distance_from_earth NUMERIC(10, 2), -- distance from Earth
    has_life BOOLEAN NOT NULL, -- whether life exists
    gaseous BOOLEAN, -- whether it's a gaseous star
    galaxy_id INT NOT NULL, -- foreign key linking to galaxy table
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id) -- enforcing the foreign key relationship
);

-- Create planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY, -- auto-incrementing primary key
    name VARCHAR NOT NULL UNIQUE, -- unique name
    size_in_km INT NOT NULL, -- size of the planet in kilometers
    distance_from_earth NUMERIC(10, 2), -- distance from Earth
    has_life BOOLEAN NOT NULL, -- whether life exists
    gaseous BOOLEAN, -- whether it's a gaseous planet
    star_id INT NOT NULL, -- foreign key linking to star table
    FOREIGN KEY (star_id) REFERENCES star(star_id) -- enforcing the foreign key relationship
);


CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY, -- auto-incrementing primary key
    name VARCHAR NOT NULL UNIQUE, -- unique name
    size_in_km INT NOT NULL, -- size of the moon in kilometers
    distance_from_earth NUMERIC(10, 2), -- distance from Earth
    has_life BOOLEAN NOT NULL, -- whether life exists
    gaseous BOOLEAN, -- whether it's a gaseous moon
    planet_id INT NOT NULL, -- foreign key linking to planet table
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id) -- enforcing the foreign key relationship
);

CREATE TABLE celestial_object (
    celestial_object_id SERIAL PRIMARY KEY, -- auto-incrementing primary key
    name VARCHAR NOT NULL UNIQUE, -- unique name
    size_in_km INT NOT NULL, -- size of the object in kilometers
    distance_from_earth NUMERIC(10, 2), -- distance from Earth
    has_life BOOLEAN NOT NULL, -- whether life exists
    gaseous BOOLEAN -- whether it's a gaseous object
);


CREATE TABLE planetary_bodies (
    planetary_bodies_id SERIAL PRIMARY KEY, -- auto-incrementing primary key
    galaxy_id INT REFERENCES galaxy(galaxy_id), -- foreign key linking to galaxy
    star_id INT REFERENCES star(star_id), -- foreign key linking to star
    planet_id INT REFERENCES planet(planet_id), -- foreign key linking to planet
    moon_id INT REFERENCES moon(moon_id) -- foreign key linking to moon
);

-- Insert data into galaxy table (6 rows)
INSERT INTO galaxy (name, size_in_km, distance_from_earth, has_life, gaseous)
VALUES 
('Milky Way', 100000, 0, TRUE, FALSE),
('Andromeda', 200000, 2537000, FALSE, TRUE),
('Triangulum', 300000, 3000000, FALSE, TRUE),
('Whirlpool', 600000, 23000000, FALSE, FALSE),
('Sombrero', 500000, 29000000, FALSE, FALSE),
('Black Eye', 400000, 17600000, FALSE, TRUE);

-- Insert data into star table (6 rows)
INSERT INTO star (name, size_in_km, distance_from_earth, has_life, gaseous, galaxy_id)
VALUES 
('Sun', 1392000, 0, FALSE, TRUE, 1),
('Sirius', 2382000, 8600, FALSE, TRUE, 1),
('Alpha Centauri', 1734000, 43000, FALSE, TRUE, 2),
('Betelgeuse', 1180000000, 64270000, FALSE, FALSE, 3),
('Proxima Centauri', 1106000, 43000, FALSE, TRUE, 4),
('Kepler', 1160000, 3000000, FALSE, TRUE, 5);

-- Insert data into planet table (12 rows)
INSERT INTO planet (name, size_in_km, distance_from_earth, has_life, gaseous, star_id)
VALUES 
('Earth', 12742, 0, TRUE, FALSE, 1),
('Mars', 6792, 780000, FALSE, FALSE, 1),
('Jupiter', 139820, 62873, FALSE, TRUE, 1),
('Venus', 12104, 410000, FALSE, FALSE, 1),
('Saturn', 116460, 12000, FALSE, TRUE, 1),
('Mercury', 4879, 91700, FALSE, FALSE, 2),
('Neptune', 49244, 45000, FALSE, TRUE, 3),
('Proxima-b', 11912, 40100, FALSE, FALSE, 4),
('Kepler-22b', 21452, 62000, FALSE, TRUE, 6),
('Gliese 581d', 20600, 20100, FALSE, TRUE, 5),
('Kepler-452b', 32000, 5000, FALSE, TRUE, 6),
('Wasp-12b', 18748, 87000, FALSE, TRUE, 5);

-- Insert data into moon table (20 rows)
INSERT INTO moon (name, size_in_km, distance_from_earth, has_life, gaseous, planet_id)
VALUES 
('Luna', 3474, 38440, FALSE, FALSE, 1),
('Phobos', 22.4, 9377, FALSE, FALSE, 2),
('Deimos', 12.4, 23460, FALSE, FALSE, 2),
('Io', 3642, 62873, FALSE, FALSE, 3),
('Europa', 3121, 62870, FALSE, FALSE, 3),
('Ganymede', 5262, 62730, FALSE, FALSE, 3),
('Callisto', 4820, 68730, FALSE, FALSE, 3),
('Titan', 5150, 12000, FALSE, TRUE, 5),
('Rhea', 1527, 12100, FALSE, FALSE, 5),
('Enceladus', 504, 12200, FALSE, FALSE, 5),
('Triton', 2707, 45000, FALSE, FALSE, 7),
('Charon', 1212, 44000, FALSE, FALSE, 8),
('Kepler Moon 1', 1432, 62300, FALSE, FALSE, 9),
('Kepler Moon 2', 1765, 62600, FALSE, FALSE, 9),
('Gliese Moon', 1165, 20100, FALSE, FALSE, 10),
('Wasp Moon 1', 2194, 87000, FALSE, FALSE, 11),
('Wasp Moon 2', 3175, 87100, FALSE, TRUE, 11),
('Kepler Moon 3', 1567, 52000, FALSE, FALSE, 12),
('Proxima Moon', 1923, 40120, FALSE, FALSE, 8),
('Centauri Moon', 2854, 43800, FALSE, FALSE, 7);

-- Insert data into the celestial_object table (example of 3 rows)
INSERT INTO celestial_object (name, size_in_km, distance_from_earth, has_life, gaseous)
VALUES 
('Nebula X1', 500000, 1500000, FALSE, TRUE),
('Pulsar A9', 300000, 780000, FALSE, FALSE),
('Quasar Z3', 800000, 10000000, FALSE, TRUE);

alter table galaxy add column solar_sytem text;
alter table stat add column solar_sytem text;
alter table planet add column solar_sytem text;
alter table moon add column solar_sytem text;
alter table celestial_object add column solar_system text;

