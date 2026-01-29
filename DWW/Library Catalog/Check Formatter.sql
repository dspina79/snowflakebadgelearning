SELECT $1
FROM @util_db.public.my_internal_stage/author_with_header.json
(file_format => library_card_catalog.public.json_file_format);


copy into library_card_catalog.public.author_ingest_json
from @util_db.public.my_internal_stage
files = ('author_with_header.json')
file_format = (format_name=library_card_catalog.public.json_file_format);

select raw_author:AUTHOR_UID
from author_ingest_json;

//returns the data in a way that makes it look like a normalized table
SELECT 
 raw_author:AUTHOR_UID
,raw_author:FIRST_NAME::STRING as FIRST_NAME
,raw_author:MIDDLE_NAME::STRING as MIDDLE_NAME
,raw_author:LAST_NAME::STRING as LAST_NAME
FROM AUTHOR_INGEST_JSON;