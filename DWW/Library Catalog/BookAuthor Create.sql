create or replace table library_card_catalog.public.nested_ingest_json 
(
  raw_nested_book VARIANT
);

copy into library_card_catalog.public.nested_ingest_json
from @util_db.public.my_internal_stage
files = ( 'json_book_author_nested.txt')
file_format = ( format_name=library_card_catalog.public.json_file_format );

select raw_nested_book
from nested_ingest_json;

select raw_nested_book:year_published
from nested_ingest_json;

select raw_nested_book:authors
from nested_ingest_json;

-- flattening the information
select value:first_name
from nested_ingest_json
,lateral flatten(input => raw_nested_book:authors);

select value:first_name
from nested_ingest_json
,table(flatten(raw_nested_book:authors));

//Add a CAST command to the fields returned
SELECT value:first_name::varchar, value:last_name::varchar
from nested_ingest_json
,lateral flatten(input => raw_nested_book:authors);

//Assign new column  names to the columns using "AS"
select value:first_name::varchar as first_nm
, value:last_name::varchar as last_nm
from nested_ingest_json
,lateral flatten(input => raw_nested_book:authors);