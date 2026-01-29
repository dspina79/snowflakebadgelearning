alter table fruit_options add column SEARCH_ON text;
--update fruit_options set search_on = false;

select fruit_name from fruit_options;

update fruit_options
set search_on = 'Ximenia (Hog Plum)'
where fruit_name = 'Ximenia';


