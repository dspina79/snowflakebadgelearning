
create or replace table camillas_db.cortex_analyst.match_locations
(
 location_id number, 
 location_name varchar(50)
);

insert into camillas_db.cortex_analyst.match_locations
values 
(1, 'Main Street Park - Pitch 1'),
(2, 'Main Street Park - Pitch 2'),
(3, 'Central Park - North Pitch'),
(4, 'Central Park - South Pitch');