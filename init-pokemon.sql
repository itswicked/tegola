-- init-pokemon.sql
CREATE EXTENSION IF NOT EXISTS postgis;

-- Minimal test data
CREATE TABLE test_locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    geom GEOMETRY(Point, 4326)
);

INSERT INTO test_locations (name, type, geom) VALUES
    ('Gym 1', 'gym', ST_SetSRID(ST_MakePoint(-122.4194, 37.7749), 4326)),
    ('Pokestop 1', 'pokestop', ST_SetSRID(ST_MakePoint(-122.4294, 37.7849), 4326)),
    ('Spawn Zone 1', 'spawn', ST_SetSRID(ST_MakePoint(-122.4094, 37.7649), 4326));

CREATE INDEX test_locations_geom_idx ON test_locations USING GIST(geom);
