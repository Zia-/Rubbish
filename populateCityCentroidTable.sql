--- Generate city centroid table
create table citycentroidcoords (
	name text
);
ALTER TABLE citycentroidcoords ADD COLUMN id BIGSERIAL PRIMARY KEY;
SELECT AddGeometryColumn ('citycentroidcoords','geom',4326,'POINT',2);
insert into citycentroidcoords (name, geom) VALUES
('zia', ST_SetSRID(ST_MakePoint(-71.1043443253471, 42.3150676015829),4326))

--- Insert bbox for each polygon of worldcitypolygon shapefile
SELECT AddGeometryColumn ('worldcitypolygon','geombbox',4326,'POLYGON',2);
insert into worldcitypolygon(geombbox) select st_envelope(geom) from worldcitypolygon

-- To select city polygons overlapping the city centroid locations use this kinda code
with city as (select name as cityname, continent as citycontinent, geom as geomcity from citycentroidcoords),
world as (select * from worldcityshapes)
select cityname, citycontinent, geomcity, name_0, name_1, name_2, geom
into abc from world, city where st_contains(geom, geomcity)
