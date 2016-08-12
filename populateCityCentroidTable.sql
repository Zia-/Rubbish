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
