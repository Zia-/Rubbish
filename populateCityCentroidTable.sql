create table citycentroidcoords (
	name text
);

ALTER TABLE citycentroidcoords ADD COLUMN id BIGSERIAL PRIMARY KEY;

SELECT AddGeometryColumn ('citycentroidcoords','geom',4326,'POINT',2);

insert into citycentroidcoords (name, geom) VALUES
('zia', ST_SetSRID(ST_MakePoint(-71.1043443253471, 42.3150676015829),4326))
