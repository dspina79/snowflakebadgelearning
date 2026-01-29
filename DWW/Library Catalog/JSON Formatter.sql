//Create File Format for JSON Data 
create file format library_card_catalog.public.json_file_format
type = 'JSON' 
compression = 'AUTO' 
enable_octal = false
allow_duplicate = true 
strip_outer_array = true
strip_null_values = true 
ignore_utf8_errors = false 