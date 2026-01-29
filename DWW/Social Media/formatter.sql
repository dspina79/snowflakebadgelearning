//Create File Format for JSON Data 
create file format json_file_format
type = 'JSON' 
compression = 'AUTO' 
enable_octal = false
allow_duplicate = true 
strip_outer_array = true
strip_null_values = true 
ignore_utf8_errors = false ;


copy into TWEET_INGEST
from @util_db.public.my_internal_stage
files = ('nutrition_tweets.json')
file_format = (format_name=social_media_floodgates.public.json_file_format);